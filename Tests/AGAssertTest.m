//
//  AGAssertTest.m
//  AGAssertDemo
//
//  Created by Håvard Fossli on 23.07.13.
//  Copyright 2013 Håvard Fossli. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "AGAssert.h"
#include "objc/runtime.h"
#include <stdint.h>
#include <stdio.h>

@interface AGAssertTest : SenTestCase

@end

@implementation AGAssertTest

- (void)testAGAssert_NoDescription
{
    NSString *reason;
    @try {
        int a = 1;
        int b = 0;
        AGAssert(a == b);
    }
    @catch (NSException *exception) {
        reason = exception.reason;
    }
    @finally {
        STAssertEqualObjects(reason, @"Assertion failed with expression (a == b) in AGAssertTest.m:27 -[AGAssertTest testAGAssert_NoDescription]. ", nil);
    }
}

- (void)testAGAssert_SimpleDescription
{
    NSString *reason;
    @try {
        int a = 1;
        int b = 0;
        AGAssert(a == b, @"Might be a stupid developer lurking here.");
    }
    @catch (NSException *exception) {
        reason = exception.reason;
    }
    @finally {
        STAssertEqualObjects(reason, @"Assertion failed with expression (a == b) in AGAssertTest.m:43 -[AGAssertTest testAGAssert_SimpleDescription]. Might be a stupid developer lurking here.", nil);
    }
}

- (void)testAGAssert_DescriptionWithParams
{
    NSString *reason;
    @try {
        int a = 1;
        int b = 0;
        AGAssert(a == b, @"Might be a stupid developer lurking. Expecting %i to be equal to %i.", a, b);
    }
    @catch (NSException *exception) {
        reason = exception.reason;
    }
    @finally {
        STAssertEqualObjects(reason, @"Assertion failed with expression (a == b) in AGAssertTest.m:59 -[AGAssertTest testAGAssert_DescriptionWithParams]. Might be a stupid developer lurking. Expecting 1 to be equal to 0.", nil);
    }
}

static void triggerAGCAssert_NoDescription()
{
    int a = 1;
    int b = 0;
    AGCAssert(a == b);
}

static void triggerAGCAssert_SimpleDescription()
{
    int a = 1;
    int b = 0;
    AGCAssert(a == b, @"Might be a stupid developer lurking here.");
}

static void triggerAGCAssert_DescriptionWithParams()
{
    int a = 1;
    int b = 0;
    AGCAssert(a == b, @"Might be a stupid developer lurking. Expecting %i to be equal to %i.", a, b);
}

- (void)testAGCAssert_NoDescription
{
    NSString *reason;
    @try {
        triggerAGCAssert_NoDescription();
    }
    @catch (NSException *exception) {
        reason = exception.reason;
    }
    @finally {
        STAssertEqualObjects(reason, @"Assertion failed with expression (a == b) in AGAssertTest.m:73 void triggerAGCAssert_NoDescription(). ", nil);
    }
}

- (void)testAGCAssert_SimpleDescription
{
    NSString *reason;
    @try {
        triggerAGCAssert_SimpleDescription();
    }
    @catch (NSException *exception) {
        reason = exception.reason;
    }
    @finally {
        STAssertEqualObjects(reason, @"Assertion failed with expression (a == b) in AGAssertTest.m:80 void triggerAGCAssert_SimpleDescription(). Might be a stupid developer lurking here.", nil);
    }
}

- (void)testAGCAssert_DescriptionWithParams
{
    NSString *reason;
    @try {
        triggerAGCAssert_DescriptionWithParams();
    }
    @catch (NSException *exception) {
        reason = exception.reason;
    }
    @finally {
        STAssertEqualObjects(reason, @"Assertion failed with expression (a == b) in AGAssertTest.m:87 void triggerAGCAssert_DescriptionWithParams(). Might be a stupid developer lurking. Expecting 1 to be equal to 0.", nil);
    }
}

@end
