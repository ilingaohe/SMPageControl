//
//  main.m
//  SMPageControl
//
//  Created by Jerry Jones on 10/13/12.
//  Copyright (c) 2012 Spaceman Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SMAppDelegate.h"
#import "HHAppDelegate.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
    if (HH_CUSTOM) {
      return UIApplicationMain(argc, argv, nil, NSStringFromClass([HHAppDelegate class]));
    }else{
      return UIApplicationMain(argc, argv, nil, NSStringFromClass([SMAppDelegate class]));
    }
	}
}
