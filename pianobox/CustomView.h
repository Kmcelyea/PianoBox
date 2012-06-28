//
//  CustomView.h
//  Created by Kyle McElyea on 9/18/11.
//  Copyright 2011 OmNomRobot. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PianoBoxAppDelegate;
@interface CustomView : NSView {
    __weak PianoBoxAppDelegate *controller;
    BOOL clicked;
}

- (id)initWithFrame:(NSRect)frame controller:(PianoBoxAppDelegate *)ctrlr;

@end
