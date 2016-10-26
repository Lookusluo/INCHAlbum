//
//  AppDelegate.m
//  INCHAlbum
//
//  Created by Yazhong Luo on 10/25/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import "AppDelegate.h"
#import "NXOAuth2.h"

@interface AppDelegate ()

@property (atomic) NSString *outgoingRedirect;
@property (atomic) NSString *incomingRedirect;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //registered with instagram
    self.outgoingRedirect = @"http://product.lookus.co/album/redirect.php/myscheme/thing.com";
    self.incomingRedirect = @"myscheme://thing.com";
    
    [[NXOAuth2AccountStore sharedStore] setClientID:@"ad92045b7dec4d63b9d7d1a08199f7b2"
                                             secret:@"c7148138dcc94f928922e14a45ee824c"
                                   authorizationURL:[NSURL URLWithString:@"https://api.instagram.com/oauth/authorize"]
                                           tokenURL:[NSURL URLWithString:@"https://api.instagram.com/oauth/access_token"]
                                        redirectURL:[NSURL URLWithString:self.outgoingRedirect]
                                     forAccountType:@"Instagram"];

    return YES;
}
-(BOOL) application: (UIApplication *)app handleOpenURL:(nonnull NSURL *)url{
    NSLog(@"We received a callback");
    return [[NXOAuth2AccountStore sharedStore] handleRedirectURL:url];
}
-(BOOL) application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    if ([self.incomingRedirect containsString:[url scheme]] && [self.incomingRedirect containsString:[url host]]){
        NSURL *constructed = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", self.outgoingRedirect, [url query]]];
        return [[NXOAuth2AccountStore sharedStore] handleRedirectURL:constructed];
    }
    else
    {
    return [[NXOAuth2AccountStore sharedStore] handleRedirectURL:url];
    }
};


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
