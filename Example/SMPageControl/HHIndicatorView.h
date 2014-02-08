//
//  HHIndicatorView.h
//  SMPageControl
//
//  Created by lingaohe on 2/8/14.
//  Copyright (c) 2014 Spaceman Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMPageControl.h"

@interface HHIndicatorView : UIView
@property (nonatomic, strong) SMPageControl *pageControl;
@property (nonatomic, copy) void (^completionHandler)(NSInteger currentIndex);


@end
