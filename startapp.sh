#!/bin/sh
echo "script start"
app_type=${1}
new_handle_id=${2}

webrtc_client="yolo"

echo "app_type = $app_type"
echo "new_handle_id = $new_handle_id"

if [ "$app_type" = "$webrtc_client" ]
then
    echo "$app_type start now..."
    ./WebRTC_SFU_OldLibs $new_handle_id

else
    echo "app_type $app_type is not valid, please check your data"
fi

