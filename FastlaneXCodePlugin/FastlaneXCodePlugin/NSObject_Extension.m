//
//  NSObject_Extension.m
//  FastlaneXcodePlugin
//
//  Created by Diogo Maximo on 23/07/15.
//  Copyright (c) 2015 Diogo Maximo. All rights reserved.
//


#import "NSObject_Extension.h"
#import "AppDelegate.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[AppDelegate alloc] initWithBundle:plugin];
        });
    }
}
@end
