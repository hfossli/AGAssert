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

@interface AGDemoAssertionHandler : AGAssertionHandler

@property (nonatomic, strong) NSString *lastErrorString;

@end

@implementation AGDemoAssertionHandler

- (void)handleFailureInFunction:(NSString *)functionName
                           file:(NSString *)fileName
                     lineNumber:(NSInteger)line
                    description:(NSString *)format, ...
{
    va_list	ap;
    va_start(ap, format);
    
    if(format == nil)
    {
        self.lastErrorString = @"No description";
    }
    else
    {
        self.lastErrorString = [[NSString alloc] initWithFormat:format arguments:ap];
    }
    
    va_end(ap);
}

- (void)handleFailureInMethod:(SEL) aSelector
                       object:(id)object
                         file:(NSString *)fileName
                   lineNumber:(NSInteger)line
                  description:(NSString *)format, ...
{
    va_list	ap;
    va_start(ap, format);
    
    if(format == nil)
    {
        self.lastErrorString = @"No description";
    }
    else
    {
        self.lastErrorString = [[NSString alloc] initWithFormat:format arguments:ap];
    }
    
    va_end(ap);
}

@end



@interface AGAssertTest : SenTestCase

@end

@implementation AGAssertTest

#pragma mark - Construct and destruct

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [AGAssertionHandler setCurrentHandler:[AGAssertionHandler new]];
    [super tearDown];
}

#pragma mark - Tests

- (void)testStringIsCorrect
{
    AGDemoAssertionHandler *handler = [AGDemoAssertionHandler new];
    [AGAssertionHandler setCurrentHandler:handler];
    
    STAssertNil(handler.lastErrorString, nil);
    
    AGAssert(FALSE, nil);
    STAssertEqualObjects(handler.lastErrorString, @"No description", nil);
    
    AGAssert(FALSE, @"Some text");
    STAssertEqualObjects(handler.lastErrorString, @"Some text", nil);
    
    AGAssert(FALSE, @"Some text with param %@", @"hello");
    STAssertEqualObjects(handler.lastErrorString, @"Some text with param hello", nil);
    
    AGParameterAssert(1 == 2);
    STAssertEqualObjects(handler.lastErrorString, @"Invalid parameter not satisfying: 1 == 2", nil);
}

@end
