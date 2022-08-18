#import "FlutterVoip24hSdkPlugin.h"
#if __has_include(<flutter_voip24h_sdk/flutter_voip24h_sdk-Swift.h>)
#import <flutter_voip24h_sdk/flutter_voip24h_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_voip24h_sdk-Swift.h"
#endif

@implementation FlutterVoip24hSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterVoip24hSdkPlugin registerWithRegistrar:registrar];
}
@end
