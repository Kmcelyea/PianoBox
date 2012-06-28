//
//  PianoBoxAppDelegate.h
//  PianoBox
//
//  Created by Kyle McElyea on 9/25/11.
//  Copyright 2011 OmNomRobot. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MAAttachedWindow;
@interface PianoBoxAppDelegate : NSObject <NSApplicationDelegate, NSPopoverDelegate> {
    IBOutlet NSMenu *statusMenu;
    MAAttachedWindow *attachedWindow;
    NSStatusItem * statusItem;
    IBOutlet NSView *view;
    IBOutlet NSPopover *setupPop;
    IBOutlet NSButton *setupButton;
    IBOutlet NSPopover *installPop;
    IBOutlet NSButton *installButton;
    IBOutlet NSPopover *aboutPop;
    IBOutlet NSButton *aboutButton;
    
    IBOutlet NSPopover *helpPop;
    IBOutlet NSButton *helpButton;
    IBOutlet NSPopover *MixItPop;
    IBOutlet NSButton *MixItButton;
    
    IBOutlet NSTextField *stationNumber;
    IBOutlet NSTextField *AccountName;
    IBOutlet NSTextField *Pass;
    IBOutlet NSTextField *stationHold;
    
    IBOutlet NSTextField *StationMix1;
    IBOutlet NSTextField *StationMix2;
    IBOutlet NSTextField *TimeDelay;
}

@property (nonatomic, retain)IBOutlet NSPopover *setupPop;
@property (nonatomic, retain)IBOutlet NSPopover *installPop;
@property (nonatomic, retain)IBOutlet NSPopover *aboutPop;
@property (nonatomic, retain)IBOutlet NSPopover *helpPop;
@property (nonatomic, retain)IBOutlet NSPopover *MixItPop;

@property (nonatomic, retain)IBOutlet NSTextField *stationNumber;
@property (nonatomic, retain)IBOutlet NSTextField *AccountName;
@property (nonatomic, retain)IBOutlet NSTextField *Pass;
@property (nonatomic, retain)IBOutlet NSTextField *stationHold;

@property (nonatomic, retain)IBOutlet NSTextField *StationMix1;
@property (nonatomic, retain)IBOutlet NSTextField *StationMix2;
@property (nonatomic, retain)IBOutlet NSTextField *TimeDelay;

-(IBAction)createPBTerm:(id)sender;
-(IBAction)settingsPop:(id)sender;
-(IBAction)installPop:(id)sender;
-(IBAction)saveinfo:(id)sender;
-(IBAction)endIT:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)pauseorplay:(id)sender;
-(IBAction)homebrewer:(id)sender;
-(IBAction)pianoinstall:(id)sender;
-(IBAction)newstation:(id)sender;
-(IBAction)helpPop:(id)sender;
-(IBAction)mixerup:(id)sender;
-(IBAction)MixItPop:(id)sender;
//-(IBAction)getInfo:(id)sender;
-(IBAction)about:(id)sender;
-(IBAction)dislike:(id)sender;
-(IBAction)like:(id)sender;
-(IBAction)tired:(id)sender;
-(IBAction)donate:(id)sender;

- (void)toggleAttachedWindowAtPoint:(NSPoint)pt;


@end
