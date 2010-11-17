OSErr HandleCrashEvent(const AppleEvent *ev, AppleEvent *reply, long refcon) {
    NSLog(@"HolyCrash: got crash request");
    
    // crash this process!
    *((char*)0x0) = 0;
    
    return 0;
}