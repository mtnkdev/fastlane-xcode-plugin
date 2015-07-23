//
//  FastlaneXcodePlugin.h
//  FastlaneXcodePlugin
//
//  Created by Diogo Maximo on 23/07/15.
//  Copyright (c) 2015 Diogo Maximo. All rights reserved.
//

#import <AppKit/AppKit.h>

@class AppDelegate;

static AppDelegate *sharedPlugin;

@interface AppDelegate : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@property (assign) IBOutlet NSWindow *window;

@end