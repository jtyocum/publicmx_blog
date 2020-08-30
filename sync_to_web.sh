#!/bin/bash
hugo && rsync -avz --delete --exclude=.well-known/ public/ publicmx@publicmx.com:~/public_html/
