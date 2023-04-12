#! /usr/bin/bash

# SYNOPSIS
# ./youtube-download link

youtube-dl -o "%(title)s-%(id)s.%(ext)s" --extract-audio --audio-format mp3 $1 
