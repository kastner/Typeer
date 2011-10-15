//
//  TypeerAppDelegate.m
//  Typeer
//
//  Created by Erik Kastner on 10/15/11.
//  Copyright 2011 Meta | ateM. All rights reserved.
//

#import "TypeerAppDelegate.h"

@implementation TypeerAppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
	//NSImage *statusImage = [NSImage imageNamed:@"MenuIcon.png"];
	//[statusItem setImage:statusImage];
	[statusItem setHighlightMode:YES];
    //[statusItem setTitle:@"WPM!"];

    NSFont *font = [NSFont systemFontOfSize:11.0f];
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:@"WPM" attributes:attrsDictionary];

    [statusItem setAttributedTitle:titleString];

	[statusItem setMenu:statusMenu];

    keyCount = 0;

    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(foo) userInfo:nil repeats:YES];
    // Insert code here to initialize your application
    _eventMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyUpMask handler:^(NSEvent *incomingEvent) {
        //NSLog(@"Key: %@", incomingEvent);
        keyCount++;
    }];
}

- (void)foo
{

    NSString *str;

    if (keyCount >= 2) {
        int keyCountHold = keyCount;
        int cpm = keyCountHold * 30;
        double wpm_e = cpm / 7;
        //NSLog(@"cps: %i, cpm: %i, wpm (est): %f", keyCountHold, cpm, wpm_e);

        str = [NSString stringWithFormat:@"%0.0f", wpm_e];
    } else {

        str = @"WPM";
    }

    keyCount = 0;

    //[statusItem setTitle:[NSString stringWithFormat:@"%f", wpm_e]];

    NSFont *font = [NSFont systemFontOfSize:11.0f];
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:str attributes:attrsDictionary];

    [statusItem setAttributedTitle:titleString];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    NSLog(@"removing");
    [NSEvent removeMonitor:_eventMonitor];
}

@end
