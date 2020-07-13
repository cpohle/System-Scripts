echo "+ Modify interface_config.js"  
sed -i DEFAULT_BACKGROUND/s/#474747/#7f7f7f/g /usr/share/jitsi-meet/interface_config.js  
sed -i APP_NAME/s/Jitsi Meet/Konferenzserver Pohle IT Dienste UG/g /usr/share/jitsi-meet/interface_config.js  
sed -i NATIVE_APP_NAME/s/Jitsi Meet/Konferenzserver/g /usr/share/jitsi-meet/interface_config.js  
sed -i PROVIDER_NAME/s/Jitsi/Pohle IT Dienste UG/g /usr/share/jitsi-meet/interface_config.js  
sed -i DEFAULT_REMOTE_DISPLAY_NAME/s/Fellow Jitster/Konferenzteilnehmer/g /usr/share/jitsi-meet/interface_config.js  
sed -i DEFAULT_LOCAL_DISPLAY_NAME/s/me/Ich/g /usr/share/jitsi-meet/interface_config.js  
sed -i JITSI_WATERMARK_LINK!s!https://jitsi.org!https://support.pohle.net/display/HC/Konferenzserver!g /usr/share/jitsi-meet/interface_config.js  
