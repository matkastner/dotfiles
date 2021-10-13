#!/bin/bash

kill_simulators() {
  adb emu kill 2> /dev/null
  xcrun simctl shutdown all > /dev/null
}

xc() {
  open -a "Xcode" ios/*.xcworkspace
}

as() {
  open -a "Android Studio" android
}

pick_android_device() {
  if [ ! -f .android_devices ];
  then
    adb emu kill
    echo "$(emulator devices -list-avds | sort -R)" > .android_devices
  fi

  random_device="$(cat .android_devices | head -n 1)"
  default_android_device="${ANDROID_DEVICE:-"${random_device}"}"
  echo "${default_android_device// /_}"
}

pick_ios_device() {
  if [ ! -f .ios_devices ];
  then
    xcrun simctl shutdown all
    echo "$(xcrun xctrace list devices | grep iPhone | cut -d"(" -f1 | sort -R | sed -e 's/[[:space:]]*$//')" > .ios_devices
  fi

  random_device="$(cat ios_devices | head -n 1)"
  echo "${IOS_DEVICE:-"${random_device}"}"
}

emu() {
  android_device="$(pick_android_device)"

  if [ "${1}" = "reset" ];
  then
    adb emu kill
    echo "Starting a fresh ${android_device//_/ }"
    emulator -wipe-data -no-snapshot-load "@${android_device}" &
  else
    echo "Restoring a ${android_device//_/ }"
    emulator "@${android_device}"
  fi
}

sim() {
  ios_device="$(pick_ios_device)"

  if [ "${1}" = "reset" ];
  then
    xcrun simctl shutdown "${ios_device}"
    xcrun simctl erase "${ios_device}"
  fi

  echo "Starting a ${ios_device}"
  xcrun simctl boot "${ios_device}"
}

create_gif_from_video() {
  video="${1}"

  mkdir -p /tmp/pngs
  ffmpeg -i "${video}" -r 10 /tmp/pngs/out%04d.png

  mkdir -p /tmp/gifs
  sips -s format gif /tmp/pngs/*.png --out /tmp/gifs

  gifsicle -O3 --resize-fit-height=600 --loopcount /tmp/gifs/*.gif --colors 256 > "${video:r}.gif"

  rm -rf /tmp/pngs /tmp/gifs
}

sim_record() {
  filename="/tmp/sim_vid_$(date +'%Y-%m-%dT%H:%M:%SZ').mov"
  echo "Recording..."
  xcrun simctl io booted recordVideo "${filename}"

  echo "Saving..."
  mv "${filename}" ~/Desktop
  filename=~/Desktop/${filename:t}

  create_gif_from_video "${filename}"
}

emu_pull() {
  echo "Saving..."
  adb pull "/sdcard/${filename}" .

  mv "${filename}" ~/Desktop
  filename=~/Desktop/${filename:t}

  create_gif_from_video "${filename}"

  adb shell rm '/sdcard/emu*'
}

emu_record() {
  filename="emu_vid_$(date +'%Y-%m-%dT%H:%M:%SZ').mp4"
  echo "Recording..."
  adb shell screenrecord "/sdcard/${filename}"

  echo "Saving..."
  emu_pull
}

rnclean() {
  rm -Rf android/.gradle
  rm -Rf android/app/build
  rm -Rf ios/build
  rm -Rf ios/Pods
  rm -Rf node_modules
  rm -Rf /tmp/metro-*]
  watchman watch-del-all
}

rnpurge() {
  rm -Rf ~/.npm
  rm -Rf ~/.gradle
  rm -Rf ~/Library/Developer/Xcode/DerivedData/*
  rnclean
}

rnbuild() {
  npm install
  kill_simulators
  npm start -- --no-interactive --reset-cache &
  [ $1 = 'ios' ] || npm run android
  [ $1 = 'android' ] || npm run ios
  fg %npm
}

rncleanstart() {
  rnclean
  npm install
  npm start --reset-cache
}

rnpurgestart() {
  rnpurge
  npm install
  npm start --reset-cache
}

rncleanbuild() {
  rnclean
  rnbuild
}

rnpurgebuild() {
  rnpurge
  rnbuild
}

srad() {
  rm .android_devices
  adb emu kill
  start_android_device
}
