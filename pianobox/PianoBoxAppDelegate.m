//
//  PianoBoxAppDelegate.m
//  PianoBox
//
//  Created by Kyle McElyea on 9/25/11.
//  Copyright 2011 OmNomRobot. All rights reserved.
//

#import "PianoBoxAppDelegate.h"
#import "CustomView.h"
#import "MAAttachedWindow.h"


@implementation PianoBoxAppDelegate
@synthesize setupPop;
@synthesize AccountName;
@synthesize Pass;
@synthesize stationNumber;
@synthesize installPop;
@synthesize stationHold;
@synthesize aboutPop;
@synthesize helpPop;
@synthesize MixItPop;
@synthesize StationMix1, StationMix2, TimeDelay;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    NSString *userDefaultsValuesPath;
    NSDictionary *userDefaultsValuesDict;
    
    // load the default values for the user defaults
    userDefaultsValuesPath=[[NSBundle mainBundle] pathForResource:@"Defaults"
                                                           ofType:@"plist"];
    userDefaultsValuesDict=[NSDictionary dictionaryWithContentsOfFile:userDefaultsValuesPath];
    
    // set them in the standard user defaults
    [[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsValuesDict];
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *actval = [prefs stringForKey:@"accountName"];
    NSString *pwdval = [prefs stringForKey:@"pwd"];
    NSString *stationval = [prefs stringForKey:@"stationId"];
    NSLog(@"actval %@",actval);
    NSLog(@"pwdval %@",pwdval);
    NSLog(@"stationval %@",stationval);
    [AccountName setStringValue:actval];
    [Pass setStringValue:pwdval];
    [stationNumber setStringValue:stationval];
  
    
    
    
}

- (void)awakeFromNib {
    float width = 30.0;
    float height = [[NSStatusBar systemStatusBar] thickness];
    NSRect viewFrame = NSMakeRect(0, 0, width, height);
    statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:width] retain];
    [statusItem setHighlightMode:NO];
    [statusItem setView:[[[CustomView alloc] initWithFrame:viewFrame controller:self] autorelease]];
    
    
    
}

- (void)toggleAttachedWindowAtPoint:(NSPoint)pt
{
    // Attach/detach window.
    if (!attachedWindow) {
        attachedWindow = [[MAAttachedWindow alloc] initWithView:view 
                                                attachedToPoint:pt 
                                                       inWindow:nil 
                                                         onSide:MAPositionBottom 
                                                     atDistance:5.0];
        
        
        [attachedWindow makeKeyAndOrderFront:self];
        
    } else {
        [attachedWindow orderOut:self];
        [attachedWindow release];
        attachedWindow = nil;
    }    
}


//- (void)windowDidResignKey:(NSNotification *)notification {
//    [attachedWindow orderOut:self];
//    [attachedWindow release];
//attachedWindow = nil;
    
    
//}


-(IBAction)settingsPop:(id)sender{
    

[[self setupPop] showRelativeToRect:setupButton.bounds ofView:sender preferredEdge:NSMinXEdge];
}

-(IBAction)installPop:(id)sender{
    
    
    [[self installPop] showRelativeToRect:installButton.bounds ofView:sender preferredEdge:NSMinXEdge];
}

-(IBAction)helpPop:(id)sender {
    
    [[self helpPop] showRelativeToRect:helpButton.bounds ofView:sender preferredEdge:NSMinXEdge];
    
}

-(IBAction)MixItPop:(id)sender {
    
    [[self MixItPop] showRelativeToRect:MixItButton.bounds ofView:sender preferredEdge:NSMinXEdge];
    
}

//install homebrew
-(IBAction)homebrewer:(id)sender
{
    NSDictionary *error;
    
    NSAppleScript *script = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\n quit\n end tell"]];
    
    
    NSAppleEventDescriptor  *result = [script executeAndReturnError: &error];
    NSLog(@"Results = %@", result);
    [script release];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Homebrewer" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
    
}

-(IBAction)pianoinstall:(id)sender {
    NSDictionary *error;
    
    NSAppleScript *script = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\n quit\n end tell"]];
    
    
    NSAppleEventDescriptor  *result = [script executeAndReturnError: &error];
    NSLog(@"Results = %@", result);
    [script release];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Brewpiano" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
    
    
}


-(IBAction)newstation:(id)sender
{
    
    NSString *stationhold = [stationHold stringValue];
    NSDictionary *error2;
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\nactivate\ndo script\"s%@\" in front window\n end tell", stationhold]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error2];
    NSLog(@"Results = %@", result2);
    [script2 release];
    

    NSString* path = [[NSBundle mainBundle] pathForResource:@"Hideterm" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
    
    
}


-(IBAction)dislike:(id)sender {
    NSDictionary *error2;
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\nactivate\ndo script\"-\" in front window\n end tell"]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error2];
    NSLog(@"Results = %@", result2);
    [script2 release];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Hideterm" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
    
    
}

-(IBAction)like:(id)sender {
    NSDictionary *error2;
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\nactivate\ndo script\"+\" in front window\n end tell"]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error2];
    NSLog(@"Results = %@", result2);
    [script2 release];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Hideterm" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
    
}


-(IBAction)tired:(id)sender {
    NSDictionary *error2;
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\nactivate\ndo script\"t\" in front window\n end tell"]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error2];
    NSLog(@"Results = %@", result2);
    [script2 release];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Hideterm" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
}

/*
-(IBAction)getInfo:(id)sender {
    
    
    
    NSTask *task = [[NSTask new] autorelease];
    NSPipe *outputPipe = [NSPipe pipe];
    [task setLaunchPath:@"/terminal.app"];
    [task setArguments:[NSArray arrayWithObject:@"i"]];
    [task setStandardOutput:outputPipe];
    [task launch];
    [task waitUntilExit];
    NSFileHandle *fh = [outputPipe fileHandleForReading];
    NSString *outputString =
    [[[NSString alloc] initWithData:[fh readDataToEndOfFile]
                           encoding:NSUTF8StringEncoding] autorelease];
    NSLog(@"Outputstring %@",outputString);
    
}
*/

-(IBAction)about:(id)sender {
    [[self aboutPop] showRelativeToRect:aboutButton.bounds ofView:sender preferredEdge:NSMaxXEdge];
    
}

-(IBAction)donate:(id)sender {
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LBWFVDKTUFCDQ&lc=US&item_name=OmNomRobot%20Software&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted"]];
    
    
}




-(IBAction)mixerup:(id)sender {
    NSString *chan1 = [StationMix1 stringValue];
    NSString *chan2 = [StationMix2 stringValue];
    NSString *timeframebefore = [TimeDelay stringValue];
    int i = [timeframebefore intValue];
    int timeframe = (i * 60);
    NSLog(@"Timeframe = %d after i * 60", timeframe);
    NSString *passtime = [NSString stringWithFormat:@"%d", timeframe];
    
    
    
    NSLog(@"Chan1 = %@", chan1);
    NSLog(@"Chan2 = %@", chan2);
    NSLog(@"Passtime = %@", passtime);
    
    NSDictionary *error;
    
  
    
    NSAppleScript *script = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\ndo script \"s%@\" in front window\n end tell" ,chan1]];
    
    
    
    NSAppleEventDescriptor  *result = [script executeAndReturnError: &error];
    [script release];
    
    
    NSDictionary *error2;
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\ndelay %@\ndo script\"s%@\" in front window\n end tell", passtime, chan2]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error2];
    NSLog(@"Results = %@", result2);
    [script2 release];

    NSString* path = [[NSBundle mainBundle] pathForResource:@"Hideterm" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
    
    

}

-(IBAction)createPBTerm:(id)sender {
    NSString *email =[AccountName stringValue];
    NSString *pwd=[Pass stringValue];
    NSString *stationid=[stationNumber stringValue];
    
    
    
    NSDictionary *error3;
    
    NSAppleScript *ender = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\n quit\n end tell"]];
    
    
    NSAppleEventDescriptor  *result3 = [ender executeAndReturnError: &error3];
    NSLog(@"Results = %@", result3);
    [ender release];
    
    
    
    NSLog(@"pushed start");
    
    NSDictionary *error;
    
    NSAppleScript *script = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\n activate\n end tell"]];
   
   
    NSAppleEventDescriptor  *result = [script executeAndReturnError: &error];
    [script release];
    
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\ndo script \"pianobar\" in front window\ndo script\"%@\" in front window\ndo script\"%@\" in front window\ndo script\"%@\"in front window\n end tell", email, pwd, stationid]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error];
    [script2 release];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Hideterm" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
    
    
}

-(IBAction)saveinfo:(id)sender {
    
    NSLog(@"Save action");
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *actval;
    NSString *pwdval;
    NSString *stationval;
    
    // Get the new value from the textview
    
    actval = [AccountName stringValue];
    [prefs removeObjectForKey:@"accountName"];
    [prefs setObject:actval forKey:@"accountName"];
    NSLog(@"actkey %@",actval);
    pwdval = [Pass stringValue];
    [prefs removeObjectForKey:@"pwd"];
    [prefs setObject:pwdval forKey:@"pwd"];
    NSLog(@"pwdkey %@",pwdval);
    stationval = [stationNumber stringValue];
    [prefs removeObjectForKey:@"stationId"];
    [prefs setObject:stationval forKey:@"stationId"];
    NSLog(@"stationkey %@",stationval);
    [prefs synchronize];
}

-(IBAction)endIT:(id)sender {
    
    NSLog(@"Quit");
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *actval;
    NSString *pwdval;
    NSString *stationval;
    
    // Get the new value from the textview
    
    actval = [AccountName stringValue];
    [prefs removeObjectForKey:@"accountName"];
    [prefs setObject:actval forKey:@"accountName"];
    NSLog(@"actkey %@",actval);
    pwdval = [Pass stringValue];
    [prefs removeObjectForKey:@"pwd"];
    [prefs setObject:pwdval forKey:@"pwd"];
    NSLog(@"pwdkey %@",pwdval);
    stationval = [stationNumber stringValue];
    [prefs removeObjectForKey:@"stationId"];
    [prefs setObject:stationval forKey:@"stationId"];
    NSLog(@"stationkey %@",stationval);
    [prefs synchronize];
    
   NSDictionary *error2;
    
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\ndo script\"q\" in front window\n end tell"]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error2];
    NSLog(@"Results = %@", result2);
    [script2 release];
    
    NSDictionary *error;
    
    NSAppleScript *script = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\n quit\n end tell"]];
    
    
    NSAppleEventDescriptor  *result = [script executeAndReturnError: &error];
    NSLog(@"Results = %@", result);
    [script release];
    
    [NSApp terminate:self];
}


-(IBAction)next:(id)sender;
{
    NSDictionary *error2;
    
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\ndo script\"n\" in front window\n end tell"]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error2];
    NSLog(@"Results = %@", result2);
    [script2 release];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Hideterm" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
}

-(IBAction)pauseorplay:(id)sender {
    NSDictionary *error2;
    
    NSAppleScript *script2 = [[NSAppleScript alloc] initWithSource:[NSString stringWithFormat:@"tell application \"Terminal\"\ndo script\"p\" in front window\n end tell"]];
    
    
    NSAppleEventDescriptor  *result2 = [script2 executeAndReturnError: &error2];
    NSLog(@"Results = %@", result2);
    [script2 release];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Hideterm" ofType:@"scpt"];
    NSURL* url = [NSURL fileURLWithPath:path];NSDictionary* errors = [NSDictionary dictionary];
    NSAppleScript* appleScript = [[NSAppleScript alloc] initWithContentsOfURL:url error:&errors];
    [appleScript executeAndReturnError:nil];
    [appleScript release];
    
}

-(void) dealloc {
    [setupPop release];
    [installPop release];
    [aboutPop release];
    [MixItPop release];
    [StationMix2 release];
    [StationMix1 release];
    [TimeDelay release];
    [AccountName release];
    [stationNumber release];
    [Pass release];
    [super dealloc];
    
}
@end
