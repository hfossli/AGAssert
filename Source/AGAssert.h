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

#import <Foundation/Foundation.h>
#import "AGAssertionHandler.h"

#if !defined(AG_BLOCK_ASSERTIONS)
# define AG_BLOCK_ASSERTIONS 0
#endif

#if !AG_BLOCK_ASSERTIONS

# define AGAssert(condition, desc, ...)	\
    do {				\
        __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS \
        if (!(condition)) {		\
            [[AGAssertionHandler currentHandler] handleFailureInMethod:_cmd \
                object:self file:[NSString stringWithUTF8String:__FILE__] \
                lineNumber:__LINE__ description:desc, ##__VA_ARGS__]; \
        }				\
        __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS \
    } while(0)

# define AGCAssert(condition, desc, ...) \
    do {				\
        __PRAGMA_PUSH_NO_EXTRA_ARG_WARNINGS \
        if (!(condition)) {		\
            [[AGAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
                file:[NSString stringWithUTF8String:__FILE__] \
                lineNumber:__LINE__ description:desc, ##__VA_ARGS__]; \
        }				\
        __PRAGMA_POP_NO_EXTRA_ARG_WARNINGS \
    } while(0)

# define AGParameterAssert(condition) AGAssert((condition), @"Invalid parameter not satisfying: %s", #condition)

#else
# define AGAssert(condition, desc, ...)
# define AGCAssert(condition, desc, ...)
# define AGParameterAssert(condition) 
#endif

