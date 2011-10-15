//
//  TypeerAppDelegate.h
//  Typeer
//
//  Created by Erik Kastner on 10/15/11.
//  Copyright 2011 Meta | ateM. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TypeerAppDelegate : NSObject <NSApplicationDelegate> {
    NSEvent *_eventMonitor;
    int keyCount;
    NSStatusItem *statusItem;
	IBOutlet NSMenu *statusMenu;
}

@end
