//
//  TTHypnosisViewController.m
//  HynopsisNerd
//
//  Created by Fan Yang on 2018/11/28.
//  Copyright © 2018 TT. All rights reserved.
//

#import "TTHypnosisViewController.h"
#import "TTHypnosisView.h"
@interface TTHypnosisViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UISegmentedControl *segmCtl;
@property (nonatomic, strong) TTHypnosisView *backgroundView;
@end

@implementation TTHypnosisViewController

- (void)loadView{
    self.backgroundView = [[TTHypnosisView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    self.view = self.backgroundView;
//    NSLog(@"%f", self.view.bounds.size.width);
    CGRect frame = [UIScreen mainScreen].bounds;

    
    NSArray *arry = @[@"red", @"green", @"blue"];
//    NSArray *arry = [NSArray arrayWithObjects:@"red", @"green", @"blue", nil];
    self.segmCtl = [[UISegmentedControl alloc] initWithItems:arry];
    //    NSLog(@"%f", self.view.bounds.size.width);
    self.segmCtl.frame = CGRectMake(10, 50, self.view.bounds.size.width-20, 50);
    //    NSLog(@"%f,%f,%f,%f", self.segmCtl.frame.origin.x, self.segmCtl.frame.origin.y, self.segmCtl.frame.size.width, self.segmCtl.frame.size.height);
    //    self.segmCtl.tintColor = [UIColor redColor];
    [self.segmCtl addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmCtl];
    
    CGRect textFieldRect = CGRectMake(40, 120, frame.size.width-80, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hynopsis me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [self.backgroundView addSubview:textField];
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.tabBarItem.title = @"Hypnosis";
        UIImage *img = [UIImage imageNamed:@"spiral.png"];
        self.tabBarItem.image = img;
    }
    return self;

}

- (void)viewDidLoad{


}

- (void)changeColor:(UISegmentedControl *)sender{
    NSLog(@"color changing to:");
    switch (sender.selectedSegmentIndex) {
        case 0:
            NSLog(@"red");
            self.backgroundView.circleColor = [UIColor redColor];
            [self.backgroundView setNeedsDisplay];
            break;
        case 1:
            NSLog(@"green");
            self.backgroundView.circleColor = [UIColor greenColor];
            [self.backgroundView setNeedsDisplay];
            break;
        case 2:
            NSLog(@"blue");
            self.backgroundView.circleColor = [UIColor blueColor];
            [self.backgroundView setNeedsDisplay];
            break;
        default:
            break;
    }
}
- (void)drawHypnosisMessages:(NSString *)message{
    for(int i = 0; i < 20; i++){
        UILabel *messageLable = [[UILabel alloc] init];
        messageLable.backgroundColor = [UIColor clearColor];
        messageLable.textColor = [UIColor whiteColor];
        messageLable.text = message;
        
        [messageLable sizeToFit];
        int width = (int)(self.view.bounds.size.width - messageLable.bounds.size.width);
        int x = arc4random() % width;
        int height = (int)(self.view.bounds.size.height - messageLable.bounds.size.height);
        int y = arc4random() % height;
        
        CGRect frame = messageLable.frame;
        frame.origin = CGPointMake(x, y);
        messageLable.frame = frame;
        
        [self.view addSubview:messageLable];
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLable addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLable addMotionEffect:motionEffect];
        
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@", textField.text);
    [self drawHypnosisMessages:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

//- (BOOL)respondsToSelector:(SEL)aSelector{
//    NSLog(@"here");
//
//    return [super respondsToSelector:aSelector];
//}

@end
