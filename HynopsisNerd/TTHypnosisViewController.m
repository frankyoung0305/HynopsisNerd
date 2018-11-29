//
//  TTHypnosisViewController.m
//  HynopsisNerd
//
//  Created by Fan Yang on 2018/11/28.
//  Copyright © 2018 TT. All rights reserved.
//

#import "TTHypnosisViewController.h"
#import "TTHypnosisView.h"
@interface TTHypnosisViewController ()
@property (nonatomic, strong) UISegmentedControl *segmCtl;
@property (nonatomic, strong) TTHypnosisView *backgroundView;
@end

@implementation TTHypnosisViewController

- (void)loadView{
    self.backgroundView = [[TTHypnosisView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    self.view = self.backgroundView;
//    NSLog(@"%f", self.view.bounds.size.width);
    
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
//    NSArray *arry = @[@"red", @"green", @"blue"];
    NSArray *arry = [NSArray arrayWithObjects:@"red", @"green", @"blue", nil];
    self.segmCtl = [[UISegmentedControl alloc] initWithItems:arry];
//    NSLog(@"%f", self.view.bounds.size.width);
    self.segmCtl.frame = CGRectMake(10, 50, self.view.bounds.size.width-20, 50);
    
//    NSLog(@"%f,%f,%f,%f", self.segmCtl.frame.origin.x, self.segmCtl.frame.origin.y, self.segmCtl.frame.size.width, self.segmCtl.frame.size.height);
//    self.segmCtl.tintColor = [UIColor redColor];
    [self.segmCtl addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.segmCtl];

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

@end
