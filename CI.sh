#!/bin/sh

echo ==================================
pwd
cd /Users/zhangfei/desktop/bim360ea
echo ===========
pwd
Rspec spec/*_spec.rb -fh >>$(date).html
#for bach - %date%.html