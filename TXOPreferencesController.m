//
//  TXOPreferencesController.m
//  TeXorator
//
//  Created by Ian Henderson on 24.09.04.
//

#import "TXOPreferencesController.h"

NSString * const TXODefaultExecutablePath = @"/usr/texbin/pdflatex";
NSInteger * const TXODefaultRemoveJunk = 0;

@implementation TXOPreferencesController

- (id)init
{
    return [super initWithWindowNibName:@"TXOPreferences"];
}

- (IBAction)ok:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:[executablePath stringValue] forKey:@"TXOTexExecutable"];
	[[NSUserDefaults standardUserDefaults] setInteger:[removeJunk integerValue] forKey:@"TXORemoveJunk"];

    [self close];
}

- (void)windowDidLoad
{
    [executablePath setStringValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"TXOTexExecutable"]];
	[removeJunk setIntegerValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"TXORemoveJunk"]];
}

- (void)applicationDidFinishLaunching:(NSNotification *)note
{	
	[[NSUserDefaults standardUserDefaults] registerDefaults:[NSDictionary dictionaryWithObjectsAndKeys:
															 TXODefaultExecutablePath, @"TXOTexExecutable",
															 TXODefaultRemoveJunk, @"TXORemoveJunk"]];
}

@end
