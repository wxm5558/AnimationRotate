//
//  ViewController.m
//  RotatingViewTest
//
//  Created by xiaomanwang on 14-3-13.
//  Copyright (c) 2014年 xiaomanwang. All rights reserved.
//

#import "ViewController.h"
#import "RotatingView.h"

@interface ViewController ()
{
    RotatingView *rotateView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    rotateView = [[RotatingView alloc] initWithFrame:CGRectMake(100, 100, 100, 140)];
    [self.view addSubview:rotateView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [rotateView startAnimation];
}

@end
