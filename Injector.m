#define FRAMEWORK_PATH_CONFIG_FILE @"~/.fscript-framework-location"

@interface FScriptMenuItem : NSObject { }
-(id)alloc;
-(void) insertInMainMenu;

- (IBAction)openObjectBrowser:(id)sender;
- (IBAction)showConsole:(id)sender;
- (IBAction)showPreferencePanel:(id)sender;
@end

static bool gInitialized = false;

OSErr HandleInjectionEvent(const AppleEvent *ev, AppleEvent *reply, long refcon) {
    @autoreleasepool {
        NSLog(@"F-Script Injector: got injection request inside %@", [[NSBundle mainBundle] executablePath]);

        NSString* frameworkLocation = [NSString stringWithContentsOfFile:[FRAMEWORK_PATH_CONFIG_FILE stringByStandardizingPath] encoding:NSUTF8StringEncoding error:NULL];
        if (!frameworkLocation) {
            frameworkLocation = @"/Library/Frameworks/FScript.framework";
        }

        NSLog(@"F-Script Injector: injecting FScript.framework located at %@", frameworkLocation);

        if (![[NSBundle bundleWithPath:frameworkLocation] load]) {
            NSLog(@"F-Script Injector: unable to load FScript.framework, please check framework presence and proper rights at %@", frameworkLocation);
            return 1;
        }
        FScriptMenuItem* item = (FScriptMenuItem*)NSClassFromString(@"FScriptMenuItem");
        if (!item) {
            NSLog(@"F-Script Injector: unable to retrieve FScriptMenuItem");
            return 2;
        }
        [item insertInMainMenu];
        gInitialized = true;
    }
    
    return 0;
}

OSErr HandleShowConsoleEvent(const AppleEvent *ev, AppleEvent *reply, long refcon) {
  @autoreleasepool {
    NSLog(@"F-Script Injector: got showConsole request inside %@", [[NSBundle mainBundle] executablePath]);
    
    if (!gInitialized) {
      NSLog(@"F-Script Injector: inject FScript.framework first via BAFSinjc event (see https://github.com/binaryage/fscript-osax)");
      return 1;
    }
    FScriptMenuItem* item = (FScriptMenuItem*)NSClassFromString(@"FScriptMenuItem");
    if (!item) {
      NSLog(@"F-Script Injector: unable to retrieve FScriptMenuItem");
      return 2;
    }
    [[[[item alloc] init] autorelease] showConsole:nil];
  }
  
  return 0;
}

OSErr HandleOpenObjectBrowserEvent(const AppleEvent *ev, AppleEvent *reply, long refcon) {
  @autoreleasepool {
    NSLog(@"F-Script Injector: got openObjectBrowser request inside %@", [[NSBundle mainBundle] executablePath]);
    
    if (!gInitialized) {
      NSLog(@"F-Script Injector: inject FScript.framework first via BAFSinjc event (see https://github.com/binaryage/fscript-osax)");
      return 1;
    }
    FScriptMenuItem* item = (FScriptMenuItem*)NSClassFromString(@"FScriptMenuItem");
    if (!item) {
      NSLog(@"F-Script Injector: unable to retrieve FScriptMenuItem");
      return 2;
    }
    [[[[item alloc] init] autorelease] openObjectBrowser:nil];
  }
  
  return 0;
}

OSErr HandleShowPreferencePanelEvent(const AppleEvent *ev, AppleEvent *reply, long refcon) {
  @autoreleasepool {
    NSLog(@"F-Script Injector: got showPreferencePanel request inside %@", [[NSBundle mainBundle] executablePath]);
    
    if (!gInitialized) {
      NSLog(@"F-Script Injector: inject FScript.framework first via BAFSinjc event (see https://github.com/binaryage/fscript-osax)");
      return 1;
    }
    FScriptMenuItem* item = (FScriptMenuItem*)NSClassFromString(@"FScriptMenuItem");
    if (!item) {
      NSLog(@"F-Script Injector: unable to retrieve FScriptMenuItem");
      return 2;
    }
    [[[[item alloc] init] autorelease] showPreferencePanel:nil];
  }
  
  return 0;
}