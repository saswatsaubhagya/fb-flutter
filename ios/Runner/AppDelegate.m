#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
      [GMSServices provideAPIKey: @"AIzaSyDTq_STLdEO8ckdDpsOXnWwYwlN2GDmhwA"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
