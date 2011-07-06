/**
 BCryptApp
 bcrypt command line utility
 by Duane Sibilly <duane@sibilly.com>
 
 Uses MABCrypt, an Objective-C bcrypt wrapper based on Ricardo Garcia's bcrypt
 C library and Marco Arment's PHP bcrypt implementation.
 
 Uses ddcli command line application framework
 by Dave Dribin <dave@dribin.org>
 
 Copyright (c) 2011 Duane Sibilly.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import <Foundation/Foundation.h>
#import "DDCli/DDCommandLineInterface.h"

#define CURRENT_MARKETING_VERSION @"1.0"

@interface BCryptApp : NSObject <DDCliApplicationDelegate> {
	// Placeholder ivars for DDCli to populate...
	NSString* _passwd; 
	BOOL _version;
	BOOL _help;
}

@end
