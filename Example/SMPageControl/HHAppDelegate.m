//
//  HHAppDelegate.m
//  SMPageControl
//
//  Created by lingaohe on 2/8/14.
//  Copyright (c) 2014 Spaceman Labs. All rights reserved.
//

#import "HHAppDelegate.h"
#import "HHViewController.h"

@implementation HHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  HHViewController *viewController = [[HHViewController alloc] init];
  self.window.rootViewController = viewController;
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}
@end
