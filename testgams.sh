 cd ~
 wget -nv https://d37drm4t2jghv5.cloudfront.net/distributions/29.1.0/linux/linux_x64_64_sfx.exe
 chmod 755 linux_x64_64_sfx.exe
 ./linux_x64_64_sfx.exe
 echo "~/gams29.1_linux_x64_64_sfx" >> $GITHUB_PATH
 gams PartialEq.gms
 cat PartialEq.lst
 grep -c "\\$[0-9]" PartialEq.lst || true
