#!/bin/sh

jekyll build
gsutil -m cp -R -a public-read  _site/* gs://jablog.ntaoo.com
