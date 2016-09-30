#!/bin/bash
#
ps -C java f |grep elasticsearch | awk '{print $1}' | xargs kill -9
