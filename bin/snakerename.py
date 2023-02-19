#!/usr/bin/env python3
import os
import sys
import shutil

# Recursive rename file in folder (argument) to snake case

directory = sys.argv[1]

replace = [["(", "["], [")", "]"], ["{", "["], ["}", "]"], ["_", ""], ["---", "-"], ["--", "-"], ["+", ""]]

def exclude_words(name):
    for item in replace:
        name = name.replace(item[0], item[1])
    return name

for root, dirs, files in os.walk(directory):
    for f in files:
        split = f.find(".")
        name = f.lower()
        name = exclude_words(name)
        name = name.replace(" ", "-")
        shutil.move(root+"/"+f, root+"/"+name)
for root, dirs, files in os.walk(directory):
    for dr in dirs:
        name = dr.lower()
        name = exclude_words(name)
        shutil.move(root+"/"+dr, root+"/"+name)
