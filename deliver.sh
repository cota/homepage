#!/bin/bash

shopt -s dotglob
scp -r _site/* "$1":~/html/
