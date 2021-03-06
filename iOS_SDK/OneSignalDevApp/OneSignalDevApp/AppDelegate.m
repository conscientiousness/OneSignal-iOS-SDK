/**
 * Modified MIT License
 *
 * Copyright 2017 OneSignal
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * 1. The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * 2. All copies of substantial portions of the Software may only be used in connection
 * with services provided by OneSignal.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

// Please see the root Example folder of this repo for an Example project.
// This project exisits to make testing OneSignal SDK changes.

#import "AppDelegate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [OneSignal setLogLevel:ONE_S_LL_VERBOSE visualLevel:ONE_S_LL_WARN];
    
    OneSignal.inFocusDisplayType = OSNotificationDisplayTypeInAppAlert;
    
    id openNotificationHandler = ^(OSNotificationOpenedResult *result) {
        NSLog(@"OSNotificationOpenedResult: %@", result);
    };
    
    
    [OneSignal setSubscription:true];
    
    [OneSignal initWithLaunchOptions:launchOptions
                               appId:@"b2f7f966-d8cc-11e4-bed1-df8f05be55ba"
            handleNotificationAction:openNotificationHandler
                            settings:@{kOSSettingsKeyAutoPrompt: @false,
                                       kOSSettingsKeyInAppLaunchURL: @false}];
    
    [OneSignal promptLocation];
    [OneSignal sendTag:@"someKey1122" value:@"03222017"];
    
    [OneSignal addPermissionObserver:self];
    [OneSignal addSubscriptionObserver:self];
    
    return YES;
}

- (void) onOSSubscriptionChanged:(OSSubscriptionStateChanges*)stateChanges {
    NSLog(@"onOSSubscriptionChanged: %@", stateChanges);
    NSLog(@"HERE");
}

- (void) onOSPermissionChanged:(OSPermissionStateChanges*)stateChanges {
    NSLog(@"onOSPermissionChanged: %@", stateChanges);
    NSLog(@"HERE");
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}

// Remote
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
    NSLog(@"application:didReceiveRemoteNotification:fetchCompletionHandler: %@", userInfo);
    completionHandler(nil);
}

@end
