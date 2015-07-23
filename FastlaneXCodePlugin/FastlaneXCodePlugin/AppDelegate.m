//
//  FastlaneXcodePlugin.m
//  FastlaneXcodePlugin
//
//  Created by Diogo Maximo on 23/07/15.
//  Copyright (c) 2015 Diogo Maximo. All rights reserved.
//

#import "AppDelegate.h"
#import "LanesController.h"
@interface AppDelegate()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation AppDelegate{
    LanesController *lanesController;
    
}

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
        lanesController = [[LanesController alloc] initWithWindowNibName:@"LanesView"];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    [self addMenuItems];
}


- (void)addMenuItems {
    // insert a menuItem to MainMenu "Window"
    NSMenuItem* menuItem = [[NSApp mainMenu] itemWithTitle:@"Product"];
    if (!menuItem) {
        return;
    }
    
    [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
    
    //add Snippet Group
    NSMenu* submenu = [[NSMenu alloc] init];
    
    NSMenuItem* mainItem = [[NSMenuItem alloc] init];
    [mainItem setTitle:@"Fastlane"];
    
    [mainItem setSubmenu:submenu];
    [[menuItem submenu] addItem:mainItem];
    
    //support snippets to add TODO
    NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"My lanes"
                                                action:@selector(doOpenLanes)
                                         keyEquivalent:@"t"];
    
    [actionMenuItem setKeyEquivalentModifierMask:NSControlKeyMask | NSShiftKeyMask];
    
    [actionMenuItem setTarget:self];
    [submenu addItem:actionMenuItem];
 
}

- (void)doOpenLanes
{
    [lanesController.window makeKeyAndOrderFront:nil];

    self.window = lanesController.window;
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Hello, World"];
    [alert runModal];
    
    
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
