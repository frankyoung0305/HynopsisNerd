//
//  TTHypnosisView.m
//  Chap4
//
//  Created by Fan Yang on 2018/11/27.
//  Copyright © 2018 TT. All rights reserved.
//

#import "TTHypnosisView.h"
@interface TTHypnosisView ()
//@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic, strong) UIImage *image;
@end

@implementation TTHypnosisView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
        self.image = [UIImage imageNamed:@"872px-Android_robot.svg.png"];
        NSLog(@"%f", self.bounds.size.width);


        NSLog(@"view init");
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
//    NSLog(@"!!!!%f", self.bounds.size.width);

    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float radius = (hypot(bounds.size.width, bounds.size.height)/2);
    UIBezierPath *path = [[UIBezierPath alloc] init];

    for(; radius >= 0.0; radius -= 20.0){
        [path moveToPoint:CGPointMake(center.x+radius, center.y)];
        [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
//    [self.image drawInRect:CGRectMake(center.x -25, center.y -30, 50, 60)];
//    image = nil;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched.", self);
    float r = (arc4random() % 100) / 100.0;
    float g = (arc4random() % 100) / 100.0;
    float b = (arc4random() % 100) / 100.0;
    
    self.circleColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    [self setNeedsDisplay];
}


@end
