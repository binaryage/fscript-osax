# FScript.osax

This is a scripting addition which adds a new Apple Script command to inject [F-Script](http://www.fscript.org) to any application.

It is similar to [F-Script Anywhere](http://www.fscript.org/download/download.htm) or [F-Script SIMBL](https://bitbucket.org/dainkaplan/fscript-simbl).

# Installation

    git clone git://github.com/binaryage/fscript-osax.git
    cd fscript-osax
    xcodebuild

If you see `** BUILD SUCCEEDED **` that means that you have FScript.osax installed in `~/Library/ScriptingAdditions/FScript.osax`

# How to inject F-Script into an app?

1. Install [F-Script](http://www.fscript.org/download/download.htm).
2. Let's say you want to inject F-Script into Safari...

### Applescript

    tell application "Safari" to «event BAFSinjc»

### Command line

    osascript -e "tell application \"Safari\" to «event BAFSinjc»"

<span style="color:red; font-size:8pt">You have to relaunch Safari after first installation of FScript.osax. In other case the AppleScript will fail.</span>

### Applications without main menu

You may use apple events to control F-Script menu item:

    osascript -e "tell application \"Safari\" to «event BAFSscon» -- show console"
    osascript -e "tell application \"Safari\" to «event BAFSoobr» -- open object browser"
    osascript -e "tell application \"Safari\" to «event BAFSsppa» -- show preference panel"

# FScript.framework location

By installing F-Script you should place framework in `/Library/Frameworks/FScript.framework`. This is default location.

If you need to inject different version or a framework from different location, please create `~/.fscript-framework-location` text file with a new path to your FScript.framework.

#### License: [MIT-Style](https://raw.github.com/binaryage/fscript-osax/master/license.txt)