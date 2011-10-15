//
//  TypeerAppDelegate.h
//  Typeer
//
//  Created by Erik Kastner on 10/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TypeerAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *_window;
}

@property (strong) IBOutlet NSWindow *window;

@end
