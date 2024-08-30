# MiTvStickUtils
This repository contains scripts for working with "4K Mi TV stick".

## deploy_as_system_apps.sh
**deploy_as_system_apps.sh** - is a script that scans the directory in which it is located for the presence of applications and
loads these applications into the mi tv stick in the /system/app folder, without the subsequent ability to delete these applications.



## Инструкция по запуску скрипта `deploy_as_system_apps.sh` (ru)

Этот скрипт сканирует папку, в которой он находится, на наличие APK-файлов и устанавливает эти приложения на Android-устройство в папку `system/app` через ADB.

### Шаги для запуска скрипта `deploy_as_system_apps.sh`

1. **Убедитесь, что ADB установлен**  
   Убедитесь, что вы установили Android Debug Bridge (ADB) на своем компьютере. Вы можете скачать его с [официального сайта Android](https://developer.android.com/studio/command-line/adb).

2. **Подключите Android-устройство**  
   Подключите ваше Android-устройство к компьютеру через USB-кабель. Убедитесь, что включен режим отладки по USB:
   - Перейдите в **Настройки** → **Для разработчиков** → **Отладка по USB** и активируйте ее.

3. **Проверьте подключение устройства**  
   Откройте терминал и введите следующую команду, чтобы убедиться, что ваше устройство правильно распознается:
   ```bash
   adb devices
   ```
   Вы должны увидеть список подключенных устройств. Если ваше устройство не отображается, убедитесь, что драйвера установлены и отладка включена.

4. **Сделайте скрипт исполняемым: В терминале перейдите в директорию, где находится ваш скрипт, и выполните следующую команду, чтобы сделать его исполняемым:**
   ```bash
   chmod +x deploy_as_system_apps.sh
   ```
5. **Поместите в папку со скриптом апк файлы**
   
6. **Выполните скрипт с помощью следующей команды:**
   ```bash
   ./deploy_as_system_apps.sh
   ```
   или
   ```bash
   {Полный_путь_к_скрипту}/deploy_as_system_apps.sh
   ```

### Замечания
Убедитесь, что у вас есть права суперпользователя (root) на вашем Android-устройстве, чтобы установить приложения в папку /system/app.
Если устройство не рутировано, установка в /system/app не будет возможна, и вы получите ошибку.



## How to run `deploy_as_system_apps.sh` script (en)

This script scans the folder it is in for APK files and installs these apps on your Android device in the `system/app` folder via ADB.

### Steps to run `deploy_as_system_apps.sh` script

1. **Make sure ADB is installed**
Make sure you have installed the Android Debug Bridge (ADB) on your computer. You can download it from the [official Android website](https://developer.android.com/studio/command-line/adb).

2. **Connect your Android device**
Connect your Android device to your computer via a USB cable. Make sure USB debugging is enabled:
- Go to **Settings** → **Developer options** → **USB debugging** and enable it.

3. **Check device connectivity**
Open a terminal and enter the following command to make sure your device is recognized correctly:
```bash
adb devices
```
You should see a list of connected devices. If your device is not shown, make sure the drivers are installed and debugging is enabled.

4. **Make the script executable: In the terminal, go to the directory where your script is located and run the following command to make it executable:**
```bash
chmod +x deploy_as_system_apps.sh
```
5. **Place the apk files in the folder with the script**

6. **Run the script with the following command:**
```bash
./deploy_as_system_apps.sh
```
or
```bash
{Full_path_to_script}/deploy_as_system_apps.sh
```

### Notes
Make sure you have root access on your Android device to install apps to the /system/app folder.
If the device is not rooted, installing to /system/app will not be possible and you will get an error.
