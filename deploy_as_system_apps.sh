#!/bin/bash

MYPATH=$(dirname $0)
echo $MYPATH

cd $MYPATH
# ls -la

adb devices

# find -name '*.apk' -exec adb push {} /sdcard/Download \;

echo "0. Checking SU on Android"
echo

if adb shell command -v su >/dev/null 2>&1; then
    echo "The su command is available on the device."
    
else
    echo "The su command is missing on the device. It is not possible to make applications system("
    exit
    
fi
echo

echo "1. Scanning apks in ${MYPATH}"
echo

files=($(find -name '*.apk' -type f))

echo "Founded apks: ${files[@]}"
echo


echo "2. Uploading apks"
echo

for file in "${files[@]}"; do
    echo "Uploding: $file"
    adb push $file /sdcard/Download
done

echo "Apks Uploaded!"
echo


echo "3. Making your applications system"
echo

adb shell su -c mount -o rw,remount /

for file in "${files[@]}"; do
    # Извлекаем имя файла без пути
    file_name=$(basename "$file")
    first_word=$(echo "$file_name" | awk -F '[- ]' '{print $1}')
    adb shell su -c rm -R /system/app/$first_word

    echo "(Android) Make dir: /system/app/$first_word"
    adb shell su -c mkdir /system/app/$first_word
    
    echo "(Android) Copy app: /sdcard/Download/$file_name to /system/app/$first_word/$file_name"
    adb shell su -c cp /sdcard/Download/$file_name /system/app/$first_word/
    
    # установки прав на каталог and apk
    adb shell su -c chmod 755 /system/app/$first_word/
    adb shell su -c chmod 644 /system/app/$first_word/$file_name
    
    adb shell su -c chown root:root /system/app/$first_word/
    adb shell su -c chown root:root /system/app/$first_word/$file_name
    
    adb shell su -c ls /system/app/$first_word
    
    echo
done

echo
adb shell su -c ls /system/app


echo
echo "4. Next you need to reboot this device!"

echo

echo "Done."
echo
