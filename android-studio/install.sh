if ! brew list | grep android-studio > /dev/null
then
    echo "› brew install android-studio"
    brew install android-studio
fi

if test $(which sdkmanager)
then
    if test $(which jenv)
    then
        jenv local 1.8
    fi

    yes | sdkmanager --licenses
    sdkmanager --update
    sdkmanager "platforms;android-29" "system-images;android-29;default;x86_64" "system-images;android-29;google_apis;x86"
    sdkmanager "cmdline-tools;latest" "build-tools;29.0.2"
fi

if test $(which avdmanager)
then
    if test $(which jenv)
    then
        jenv local 1.8
    fi

    avdmanager create avd -n dabapps -d "pixel_xl" -k "system-images;android-29;google_apis;x86" --force
fi
