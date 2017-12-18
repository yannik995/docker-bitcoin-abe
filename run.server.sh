#!/bin/sh

# initial setup of db
python -m Abe.abe --config db.conf --commit-bytes 100000 --no-serve

# serve it up
python -m Abe.abe --config db.conf
