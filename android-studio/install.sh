if ! brew list | grep android-studio > /dev/null
then
    echo "› installing android-studio"
    brew install android-studio
fi

if [ -f ~/Library/Android/sdk/tools/bin/sdkmanager ]
then
    ~/Library/Android/sdk/tools/bin/sdkmanager "platforms;android-29" "system-images;android-29;default;x86_64" "system-images;android-29;google_apis;x86"
    ~/Library/Android/sdk/tools/bin/sdkmanager "cmdline-tools;latest" "build-tools;29.0.2"
fi
