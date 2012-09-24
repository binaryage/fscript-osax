#define FRAMEWORK_PATH_CONFIG_FILE @"~/.fscript-framework-location"

@interface FScriptMenuItem { }
-(void) insertInMainMenu;
@end

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
    }
    
    return 0;
}