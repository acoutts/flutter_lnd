#import "FlutterLndPlugin.h"
#if __has_include(<flutter_lnd/flutter_lnd-Swift.h>)
#import <flutter_lnd/flutter_lnd-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_lnd-Swift.h"
#endif

@implementation FlutterLndPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterLndPlugin registerWithRegistrar:registrar];
}
@end
