//
//  RotatingView.m
//  RotatingViewTest
//
//  Created by xiaomanwang on 14-3-13.
//  Copyright (c) 2014年 xiaomanwang. All rights reserved.
//

#import "RotatingView.h"

@interface RotatingView()
{
    CGFloat oddEven;
    UIImageView *imageView;
}

@property(nonatomic, strong)NSTimer *timer;

@end

@implementation RotatingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        oddEven = 1;
        self.backgroundColor = [UIColor whiteColor];
        
        imageView = [UIImageView new];
        imageView.frame = self.bounds;
        imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:imageView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width, rect.size.height));
    CGContextRef gc = UIGraphicsGetCurrentContext();
    [[UIColor redColor] setFill];
    CGFloat cenx = CGRectGetMidX(self.bounds);
    CGFloat ceny = CGRectGetMidY(self.bounds);
    CGContextTranslateCTM(gc, cenx, ceny);
    
    oddEven == 1? CGContextRotateCTM(gc, 0* M_PI/180):CGContextRotateCTM(gc, 20* M_PI/180);
    oddEven =  oddEven == 1? 0:1;
    for(int i = 0; i < 12; i++)
    {
        CGContextAddRect(gc, CGRectMake(-5, CGRectGetWidth(self.bounds)/4.0, 5, CGRectGetWidth(self.bounds)/4.0));
        CGContextFillPath(gc);
        CGContextRotateCTM(gc, 30* M_PI/180);
    }
    UIImage *destImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [imageView setImage:destImg];
}

- (void)startAnimation
{
    self.timer = [NSTimer timerWithTimeInterval:0.15 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopAnimatin
{
    if(self.timer)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)refresh
{
    [self setNeedsDisplay];
}
@end
