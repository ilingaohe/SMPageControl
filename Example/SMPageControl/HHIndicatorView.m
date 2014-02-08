//
//  HHIndicatorView.m
//  SMPageControl
//
//  Created by lingaohe on 2/8/14.
//  Copyright (c) 2014 Spaceman Labs. All rights reserved.
//

#import "HHIndicatorView.h"

@interface HHIndicatorView ()
@property (nonatomic, strong) UIView *currentIndicatorView;
@end

@implementation HHIndicatorView

#pragma mark -- Init
- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
    [self setupView];
  }
  return self;
}
- (void)layoutSubviews
{
  [super layoutSubviews];
  [self refreshViewFrame];
}
#pragma mark -- UIView
- (void)setupView
{
  self.backgroundColor = [UIColor clearColor];
  //
  UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indicator_bg"]];
  bgImageView.autoresizingMask = UIViewContentModeCenter;
  [self addSubview:bgImageView];
  //
  [self setupPageControl];
  [self setupCurrentIndicatorView];
  CGRect firstIndicatorRect = [self.pageControl rectForPageIndicator:0];
  self.currentIndicatorView.center = CGPointMake(firstIndicatorRect.origin.x+firstIndicatorRect.size.width/2, 60 - self.currentIndicatorView.frame.size.height/2 - 5);
  [self setIndicatorIndex:1 marginRatio:0];
}
- (void)setupPageControl
{
  self.pageControl = [self productPageControl];
  [self addSubview:self.pageControl];
  [self refreshPageControlImage:self.pageControl];
}
- (void)refreshPageControlImage:(SMPageControl *)pageControl
{
  [pageControl setImage:[UIImage imageNamed:@"indicator_setting"] forPage:0];
  [pageControl setCurrentImage:[UIImage imageNamed:@"indicator_setting"] forPage:0];
  [pageControl setImage:[UIImage imageNamed:@"indicator_start"] forPage:1];
  [pageControl setCurrentImage:[UIImage imageNamed:@"indicator_start"] forPage:1];
  UIImage *secondImage = [UIImage imageNamed:@"indicator_spring_h"];
  UIImage *thirdImage = [UIImage imageNamed:@"indicator_summer_h"];
  UIImage *forthImage = [UIImage imageNamed:@"indicator_autumn_h"];
  UIImage *fifthImage = [UIImage imageNamed:@"indicator_winter_h"];
  [pageControl setImage:secondImage forPage:2];
  [pageControl setCurrentImage:secondImage forPage:2];
  [pageControl setImage:thirdImage forPage:3];
  [pageControl setCurrentImage:thirdImage forPage:3];
  [pageControl setImage:forthImage forPage:4];
  [pageControl setCurrentImage:forthImage forPage:4];
  [pageControl setImage:fifthImage forPage:5];
  [pageControl setCurrentImage:fifthImage forPage:5];
  
}
- (SMPageControl *)productPageControl
{
  //
  NSUInteger contentPageCount = 4;
  //
  SMPageControl *pageControl = [[SMPageControl alloc] initWithFrame:self.frame];
  pageControl.indicatorMargin = 34.0f;
  pageControl.alignment = SMPageControlAlignmentCenter;
  pageControl.numberOfPages = contentPageCount + 2;
  pageControl.tapBehavior = SMPageControlTapBehaviorJump;
  //分别设置图片的方式
  //设置事件
  [pageControl addTarget:self action:@selector(handlePageControlAction:) forControlEvents:UIControlEventValueChanged];
  //  pageControl.enabled = NO;
  //
  return pageControl;
}
- (UIView *)productCurrentIndicatorView
{
  UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 7)];
  indicatorView.backgroundColor = [UIColor redColor];
  return indicatorView;
}
- (void)setupCurrentIndicatorView
{
  self.currentIndicatorView = [self productCurrentIndicatorView];
  [self addSubview:self.currentIndicatorView];
}
- (void)refreshViewFrame
{
  
}
#pragma mark -- UIAction
- (void)handlePageControlAction:(id)sender
{
  SMPageControl *pageControl = (SMPageControl *)sender;
  if (self.completionHandler) {
    self.completionHandler(pageControl.currentPage);
  }
  [self setIndicatorIndex:pageControl.currentPage marginRatio:0];
}
#pragma mark -- Public
- (void)setIndicatorIndex:(NSUInteger)index marginRatio:(CGFloat)marginRatio
{
  NSUInteger currentIndex = index;
  if (currentIndex >= [self.pageControl numberOfPages]) {
    currentIndex = 0;
  }
  [self.pageControl setCurrentPage:currentIndex];
  //
  CGRect previousIndicatorRect = [self.pageControl rectForPageIndicator:0];
  CGRect nextIndicatorRect = [self.pageControl rectForPageIndicator:1];
  CGFloat distance = (nextIndicatorRect.origin.x + nextIndicatorRect.size.width/2) - (previousIndicatorRect.origin.x+previousIndicatorRect.size.width/2);
  CGRect currentIndicatorRect = [self.pageControl rectForPageIndicator:currentIndex];
  CGFloat marginDistance = distance * marginRatio;
  CGFloat centerX = (currentIndicatorRect.origin.x+currentIndicatorRect.size.width/2)+marginDistance;
  self.currentIndicatorView.center = CGPointMake(centerX, self.currentIndicatorView.center.y);
}
@end
