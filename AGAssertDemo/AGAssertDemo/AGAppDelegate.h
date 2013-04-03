//
//  AGAppDelegate.h
//  AGAssertDemo
//
//  Created by Håvard Fossli on 03.04.13.
//  Copyright (c) 2013 Håvard Fossli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGViewController;

@interface AGAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AGViewController *viewController;

@end
