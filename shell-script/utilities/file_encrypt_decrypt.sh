#! /bin/bash

echo "===== Simple File Encryptor / Decryptor ====="
echo "Select an option:"

choice="Encrypt Decrypt"
select option in $choice; do
    if [ $REPLY = 1 ];
    then
        echo "You have selected Encryption"
        echo "Enter the filename to encrypt: "
        read file;
        gpg -c $file
        echo "The file has been encrypted"
    else
        echo "You have selected Decryption"
        echo "Enter the filename to decrypt: "
        read file2;
        gpg -d $file2
        echo "The file has been decrypted"
    fi
done