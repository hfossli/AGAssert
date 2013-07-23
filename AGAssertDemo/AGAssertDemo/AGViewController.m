//
//  AGViewController.m
//  AGAssertDemo
//
//  Created by Håvard Fossli on 03.04.13.
//  Copyright (c) 2013 Håvard Fossli. All rights reserved.
//

#import "AGViewController.h"
#import "AGAssert.h"

@interface AGViewController ()

@end

@implementation AGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)assertObjectiveC:(id)sender
//{
//    BOOL test = NO;
//    AGAssert(test, @"something wrong with '%i'?", test);
//}
//
//- (IBAction)assertC:(id)sender
//{
//    assertC();
//}
//
//static void assertC()
//{
//    BOOL test = NO;
//    AGCAssert(test, @"something wrong with '%i'?", test);
//}

@end
