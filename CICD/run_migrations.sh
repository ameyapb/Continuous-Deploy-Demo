#!/bin/bash

# Activate the virtual environment
source myenv/bin/activate

# Run Django migrations
python3 manage.py makemigrations
python3 manage.py migrate
