//
//  TTReminderViewController.m
//  HynopsisNerd
//
//  Created by Fan Yang on 2018/11/28.
//  Copyright © 2018 TT. All rights reserved.
//

#import "TTReminderViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface TTReminderViewController ()
@property (nonatomic, weak)IBOutlet UIDatePicker *datePicker;
@end


@implementation TTReminderViewController
- (IBAction)addReminder:(id)sender{
    NSDate *date = self.datePicker.date;
    NSLog(@"setting a raminder for %@", date);
    
    UNMutableNotificationContent *localNotification = [UNMutableNotificationContent new];
    localNotification.title = [NSString localizedUserNotificationStringForKey:@"Time to go!" arguments:nil];
    localNotification.body = [NSString localizedUserNotificationStringForKey:@"i'm the body!" arguments:nil];
    localNotification.sound = [UNNotificationSound defaultSound];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10 repeats:NO];
    
    //        maybe use this to complete notify user at some time point:
//    UNCalendarNotificationTrigger *dateTrigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:date repeats:NO];
    
    localNotification.badge = @([[UIApplication sharedApplication] applicationIconBadgeNumber] +1);
    
//    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"id" content:localNotification trigger:trigger];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"id" content:localNotification trigger:trigger];

    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error){
        
        NSLog(@"Notification created, %@", error);
    }];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.tabBarItem.title = @"Reminder";
        UIImage *img = [UIImage imageNamed:@"stopwatch.png"];
        self.tabBarItem.image = img;
    }
    return self;
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"rvc viewWillappare");
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

@end
