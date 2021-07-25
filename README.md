# Aicactus AdNetwork SDK IOS

Aicactus AdNetwork SDK for AiCactus platform.

Integrate Aicactus AdNetwork SDK integrate networks and monetize effectively.


## Installation

AicactusAdNetworkSDK is available through [CocoaPods](http://cocoapods.org)

### CocoaPods

```ruby
    pod 'AicactusAdNetworkSDK'
```

## Quickstart

In your application delegate’s `application:didFinishLaunchingWithOptions:` method, set up the SDK like so:

```swift
    // ContainerID AiCactus
    let configuration = AiCactusConfig(writeKey: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx")
    AicactusAdNetworkSDK.setup(with: configuration)
```

And of course, import the SDK in the files that you use it by adding the following line:

```swift
import AicactusAdNetworkSDK
```


## Submitting to the App Store

AicactusAdNetworkSDK collects the IDFA of the user’s device to use in mobile install attribution with destinations like Mobile App Tracking.

When you submit to the app store, even if you’re not currently doing mobile install attribution, check the following three boxes in the “Does this app use the Advertising Identifier (IDFA)?” on this page:

- “Attribute this app installation to a previously served advertisement”
- “Attribute an action taken within this app to a previously served advertisement”
- “I, YOUR_NAME, confirm that this app, and any third party…”

`Note: You should not check the box labeled “Serve advertisements within the app” unless you are actually going to display ads.`

## NOTE: ‼️ Before build for submitting App Store

Because Apple won’t allow x86_64, i386 architecture on app store build.

So for wrapping out x86_64, i386 architecture from framework on host app (App in which our fat framework is in use) use below script

Under “Build Phases” select “Add Run Script” and copy the contents of below script

```bash
    # Type a script or drag a script file from your workspace to insert its path.
APP_PATH="${TARGET_BUILD_DIR}/${WRAPPER_NAME}"

# This script loops through the frameworks embedded in the application and
# removes unused architectures.
find "$APP_PATH" -name '*.framework' -type d | while read -r FRAMEWORK
do
    if ( $FRAMEWORK == "AicactusAdNetworkSDK" )
    then
        FRAMEWORK_EXECUTABLE_NAME=$(defaults read "$FRAMEWORK/Info.plist" CFBundleExecutable)
        FRAMEWORK_EXECUTABLE_PATH="$FRAMEWORK/$FRAMEWORK_EXECUTABLE_NAME"
        echo "Executable is $FRAMEWORK_EXECUTABLE_PATH"

        EXTRACTED_ARCHS=()

        for ARCH in $ARCHS
        do
            echo "Extracting $ARCH from $FRAMEWORK_EXECUTABLE_NAME"
            lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
            EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
        done

        echo "Merging extracted architectures: ${ARCHS}"
        lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
        rm "${EXTRACTED_ARCHS[@]}"

        echo "Replacing original executable with thinned version"
        rm "$FRAMEWORK_EXECUTABLE_PATH"
        mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"
    fi
done

```
