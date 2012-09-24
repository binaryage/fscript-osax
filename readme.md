# FScript.osax

This is a scripting addition which adds a new Apple Script command to inject [F-Script](http://www.fscript.org) to any application.

It is similar to [F-Script Anywhere]() or [F-Script SIMBL](https://bitbucket.org/dainkaplan/fscript-simbl).

# Installation

    git clone git://github.com/binaryage/fscript-osax.git
    cd fscript-osax
    xcodebuild

If you see `** BUILD SUCCEEDED **` that means that you have FScript.osax installed in `~/Library/ScriptingAdditions/FScript.osax`

# How to inject F-Script into an app?

Let's say you want to inject F-Script into Safari...

<span style="color:red; font-size:8pt">You have to relaunch Safari after first installation of FScript.osax. In other case the AppleScript will fail.</span>

## Applescript

    tell application "Safari" to «event BAFSinjc»

## Command line

    osascript -e "tell application \"Safari\" to «event BAFSinjc»"


#### License: [MIT-Style](https://raw.github.com/binaryage/fscript-osax/master/license.txt)