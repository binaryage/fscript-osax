# HolyCrash.osax

**HolyCrash** is a scripting addition which adds a new Apple Script command to crash any application. Provides you with God's powers.

        God answer you on the day you crash,
        The name God-of-Jacob put you out of harm's reach,
        Send reinforcements from Holy Hill,
        Dispatch from Zion fresh supplies,
        Exclaim over your offerings,
        Celebrate your sacrifices,
        Give you what your heart desires,
        Accomplish your plans.
    
        -- Psalm 20 (The Message)

This is useful when you want to debug crash scenarios of your Mac application (for example a crash reporting dialog).

# Installation

    git clone git://github.com/binaryage/holycrash-osax.git
    cd holycrash-osax
    xcodebuild

If you see `** BUILD SUCCEEDED **` that means that you have HolyCrash installed in `~/Library/ScriptingAdditions/HolyCrash.osax`

# How to crash an app?

Let's say you want to crash Safari...

<span style="color:red; font-size:8pt">You have to relaunch Safari after first installation of HolyCrash.osax. In other case the AppleScript will fail.</span>

## Applescript

    tell application "Safari" to «event BAHCcrsh»

## Command line

    osascript -e "tell application \"Safari\" to «event BAHCcrsh»"


#### License: [MIT-Style](https://raw.github.com/binaryage/holycrash-osax/master/license.txt)