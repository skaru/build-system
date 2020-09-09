#!/usr/bin/env python3

import argparse
import subprocess
import os
import sys
import shutil

def main():
    parser = argparse.ArgumentParser(description='build.py - Build Tool', prog=os.path.basename(sys.argv[0]))
    parser.add_argument("-b", "--build", action="store_true", help="Build project")
    parser.add_argument("-c", "--clean", action="store_true", help="Clean project")
    parser.add_argument("-m","--menuconfig", action="store_true", help="Run menuconfig")
    args = parser.parse_args()

    if args.clean == True:
        shutil.rmtree("build")
    else:
        if not os.path.exists('build'):
            os.makedirs('build')
        
        if args.menuconfig == True:    
            os.environ["KCONFIG_CONFIG"] = "build/.config"
            subprocess.call([sys.executable, "tools/menuconfig.py"], env=os.environ.copy())
        elif args.build == True:
            if not os.path.exists('build/.config'):
                os.environ["KCONFIG_CONFIG"] = "build/.config"
                subprocess.call([sys.executable, "tools/menuconfig.py"], env=os.environ.copy())
            subprocess.call([sys.executable, "tools/confgen.py", "--kconfig", "Kconfig", "--config", "build/.config", "--output", "header", "build/config.h", "--output", "cmake", "build/config.cmake"])
            os.chdir("build")
            subprocess.call(["cmake", ".."])
            subprocess.call(["cmake", "--build", "."])

if __name__ == "__main__":
    main()