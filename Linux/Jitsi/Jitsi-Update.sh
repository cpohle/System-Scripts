#!/bin/bash  
echo "Update System and Jitsi Meet"  
apt-get --quiet update 
apt-get --quiet --with-new-pkgs --yes upgrade  
apt-get --quiet --purge --yes autoremove

echo "Modify Jitsi Meet Config"  
  
echo "+ Modify Logos"  
cd /usr/share/jitsi-meet/images/
cp /home/ubuntu/watermark.png watermark.png
cp /home/ubuntu/favicon.ico favicon.ico
  
echo "+ Modify interface_config.js"
cd /usr/share/jitsi-meet/
cp /home/ubuntu/title.html title.html
cp /home/ubuntu/interface_config.js interface_config.js
  
echo "+ Modify welcomePageAdditionalContent.html"  
echo "<template id = "welcome-page-additional-content-template"><div id="footer"><center>Betrieben von Pohle IT Dienste UG (haftungsbeschränkt) | <a href="https://www.pohle.de/impressum/">Impressum</a> | <a href="https://www.pohle.de/datenschutz/">Datenschutzhinweis</a> | <a href="https://support.pohle.net/display/HC/Konferenzserver/">Hilfe bei Problemen</a></center></div></template>" > /usr/share/jitsi-meet/static/welcomePageAdditionalContent.html  
  
echo "+ Modify all.css" 
cd /usr/share/jitsi-meet/css/
cp /home/ubuntu/all.css all.css
echo ".welcome .welcome-watermark{position:absolute;width:100%;height:auto}#footer{margin-top:20px;margin-bottom:20px;font-size:14px}"  >> /usr/share/jitsi-meet/css/all.css  
  
echo "+ Restarting services"  
service prosody restart  
service jicofo restart  
service jitsi-videobridge2 restart  
service nginx restart
