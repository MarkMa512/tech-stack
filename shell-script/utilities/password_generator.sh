#! /bin/bash 

# Simple Password Generator
# Tutorial: https://www.youtube.com/watch?v=P5552IJp7tU&list=PLMp8OMlFzhoWKZYERjlFxjmia9b6UUSjK

echo "Enter the length of the password: "

read PASS_LENGTH

# Generate 5 passwords
for p in $(seq 1 5);
do
    # use openssl to generate a random base64 string, using all 48 char
    openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done; 