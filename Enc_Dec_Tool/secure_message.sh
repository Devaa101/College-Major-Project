#!/bin/bash

# Title
echo "=================================="
echo " Secure Message Encryption Tool"
echo "=================================="

# Main Menu
echo "1) Encrypt a Message"
echo "2) Decrypt a Message"
read -p "choose an option (1 or 2): " choice

if [[ $choice -eq 1 ]]; then
	read -p "Enter the message to encrypt: " message
	read -sp "Enter a password:" password
	echo 
	echo "$message" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -pass pass:$password
elif [[ $choice -eq 2 ]]; then
	read -p "Paste the encrypted message:" encrypted_message 
        read -sp "Enter the password:" password
        echo 
        echo "$encrypted_message" | openssl enc -aes-256-cbc -a -d -salt -pbkdf2 -pass pass:$password
else
	echo "Invalid choice"
fi
