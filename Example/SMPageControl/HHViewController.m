//
//  HHViewController.m
//  SMPageControl
//
//  Created by lingaohe on 2/8/14.
//  Copyright (c) 2014 Spaceman Labs. All rights reserved.
//

#import "HHViewController.h"
#import "HHIndicatorView.h"

@interface HHViewController ()
@property (nonatomic, strong) HHIndicatorView *indicatorView;
@end

@implementation HHViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- Rotation
//只允许竖屏
- (BOOL)shouldAutorotate
{
  return YES;
}
- (NSUInteger)supportedInterfaceOrientations
{
  return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
  return UIInterfaceOrientationPortrait;
}
#pragma mark -- SetupView
- (void)setupView
{
  //
  UILabel *adjustPageRect = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 320, 40)];
  adjustPageRect.textAlignment = NSTextAlignmentCenter;
  adjustPageRect.text = @"SMPageControl PageRect Adjust";
  [self.view addSubview:adjustPageRect];
  UISwitch *indicatorSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(130, 200, 60, 20)];
  [indicatorSwitch addTarget:self action:@selector(handleSwitchAction:) forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:indicatorSwitch];
  //
  HHIndicatorView *indicatorView = [self productIndicatorView];
  [self.view addSubview:indicatorView];
  CGFloat centerY = [UIScreen mainScreen].bounds.size.height - indicatorView.frame.size.height/2;
  indicatorView.center = CGPointMake(indicatorView.center.x, centerY);
  self.indicatorView = indicatorView;
}
- (HHIndicatorView *)productIndicatorView
{
  CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
  HHIndicatorView *indicatorView = [[HHIndicatorView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 60.0f)];
  indicatorView.completionHandler = ^(NSInteger index){
    NSLog(@"IndicatorIndex:%d",index);
  };
  return indicatorView;
}
#pragma mark -- UIAction
- (void)handleSwitchAction:(id)sender
{
  UISwitch *indicatorSwitch = (UISwitch *)sender;
  [self.indicatorView.pageControl setAdjustPageRectFlag:indicatorSwitch.on];
}
@end
