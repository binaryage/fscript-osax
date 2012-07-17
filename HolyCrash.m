OSErr HandleCrashEvent(const AppleEvent *ev, AppleEvent *reply, long refcon) {
    NSLog(@"HolyCrash: got crash request");
    
    // crash this process!
    abort();

    return 0;
}