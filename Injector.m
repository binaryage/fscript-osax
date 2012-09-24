OSErr HandleInjectionEvent(const AppleEvent *ev, AppleEvent *reply, long refcon) {
    NSLog(@"F-Script Injector: got injection request inside %@", [[NSBundle mainBundle] executablePath]);
    
    return 0;
}