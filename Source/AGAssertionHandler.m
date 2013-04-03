//
// Author: Håvard Fossli <hfossli@agens.no>
//
// Copyright (c) 2013 Agens AS (http://agens.no/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AGAssertionHandler.h"
#include "objc/runtime.h"
#include <stdint.h>
#include <stdio.h>

#if __has_builtin(__builtin_unreachable)
# define AG_UNREACHABLE() __builtin_unreachable()
#else
# define AG_UNREACHABLE() abort()
#endif

@interface AGAssertionHandler ()

@end

static AGAssertionHandler *handler = nil;

@implementation AGAssertionHandler

+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[AGAssertionHandler alloc] init];
    });
}

+ (AGAssertionHandler *)currentHandler
{
    return handler;
}

+ (void)setCurrentHandler:(AGAssertionHandler *)newHandler
{
    handler = newHandler;
}


/**
 * Handles an assertion failure by using NSLogv() to print an error
 * message built from the supplied arguments, and then raising an
 * NSInternalInconsistencyException
 */
- (void)handleFailureInFunction:(NSString *)functionName
                           file:(NSString *)fileName
                     lineNumber:(NSInteger)line
                    description:(NSString *)format, ...
{
    id	message;
    va_list	ap;
    
    va_start(ap, format);
    message =
    [NSString
     stringWithFormat: @"%@:%i Assertion failed in %@. %@",
     fileName, line, functionName, format];
    NSLogv(message, ap);
    
    [NSException raise:NSInternalInconsistencyException format:message arguments:ap];
    va_end(ap);
    
    AG_UNREACHABLE(); // abort / exit - not reachable
}

/**
 * Handles an assertion failure by using NSLogv() to print an error
 * message built from the supplied arguments, and then raising an
 * NSInternalInconsistencyException
 */
- (void)handleFailureInMethod:(SEL) aSelector
                       object:(id)object
                         file:(NSString *)fileName
                   lineNumber:(NSInteger)line
                  description:(NSString *)format, ...
{
    id	message;
    va_list	ap;
    
    va_start(ap, format);
    message =
    [NSString
     stringWithFormat: @"%@:%i Assertion failed in %@[%@ %@]. %@",
     fileName, line, class_isMetaClass([object class]) ? @"+" : @"-",
     NSStringFromClass([object class]),
     NSStringFromSelector(aSelector), format];
    NSLogv(message, ap);
    
    [NSException raise:NSInternalInconsistencyException format:message arguments:ap];
    va_end(ap);
    
    AG_UNREACHABLE(); // abort / exit - not reachable
}

@end
