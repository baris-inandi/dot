# remove default firefox config
rm -rf ~/.mozilla/firefox/

# copy the config from ~/dot
cp -R ~/dot/firefox ~/.mozilla/firefox/

# firefox config symlinks
ln -f -s ~/dot/firefox/personal/chrome/userChrome.css ~/.mozilla/firefox/personal/chrome/userChrome.css
ln -f -s ~/dot/firefox/personal/chrome/userContent.css ~/.mozilla/firefox/personal/chrome/userContent.css
ln -f -s ~/dot/firefox/personal/user.js ~/.mozilla/firefox/personal/user.js