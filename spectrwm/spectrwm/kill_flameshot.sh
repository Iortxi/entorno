#!/bin/bash
kill -9 $(ps aux | grep "flameshot gui" | grep -v "grep" | awk '{print $2}')
