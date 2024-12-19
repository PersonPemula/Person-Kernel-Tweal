#!/system/bin/sh

SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE="
"

print_modname() {
  ui_print " ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print "| ⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀"
ui_print "| ⢀⢀⢀⢀⢀⢀⢀⡤⠒⠋⠉⠉⠉⠉⠉⠑⠲⢄⢀⢀⢀⢀⢀⢀⢀"
ui_print "| ⢀⢀⢀⢀⢀⠔⢁⡠⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⠉⢢⢀⢀⢀⢀⢀"
ui_print "| ⢀⢀⢀⢠⠃⣴⡇⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⠱⡄⢀⢀⢀"
ui_print "| ⢀⢀⢠⠃⢀⣿⣧⣀⢀⢀⣀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⠹⡀⢀⢀"
ui_print "| ⢀⢀⡇⢀⢀⠹⣶⣿⣿⣿⣿⣿⣶⣶⣶⣤⡀⢀⢀⣴⡿⢀⡇⢀⢀"
ui_print "| ⢀⢀⡇⢀⢀⢀⠤⣾⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⢀⡇⢀⢀"
ui_print "| ⢀⢀⡇⢀⣠⣤⣶⣿⣿⣧⣉⣿⣿⡟⣃⣿⢿⡿⢀⢀⢀⢀⡇⢀⢀"
ui_print "| ⢀⢀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢀⢀⢀⢀⢀⡰⠁⢀⢀"
ui_print "| ⢀⢀⢀⠘⣿⣿⣿⣿⣿⣏⡀⢀⣸⣿⣿⢀⢀⢀⢀⢀⡰⠃⢀⢀⢀"
ui_print "| ⢀⢀⢀⢀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⡏⢀⢀⢀⣠⠞⠁⢀⢀⢀⢀"
ui_print "| ⢀⢀⢀⢀⢀⢀⠈⠙⠿⢿⣿⣿⣿⣿⣇⡠⠔⠊⠁⢀⢀⢀⢀⢀⢀"
ui_print "| ⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀"
ui_print " "
sleep 1
ui_print " Module info: "
ui_print " • Name            : Person-Kernel-Tweak"
ui_print " • Codename        : person-kt"
ui_print " • Status          : Release On Public"
ui_print " • Owner           : Person "
ui_print " • Build Date      : 19-12-2024"
ui_print " • Support Varians : Universal "
ui_print " "
ui_print " Device Info: "
ui_print " • Device : $(getprop ro.product.manufacturer), $(getprop ro.product.device)"
sleep 1
ui_print " • SELinux Status : $(getenforce)"
sleep 1
ui_print " • Kernel Version : $(uname -r)"
sleep 1
ui_print " "
sleep 1
ui_print " Thanks To:"
ui_print " — Person//Mod"
ui_print " — Zyarexx//Own"
ui_print " "
sleep 1
ui_print " Please Reboot Your Device Now ‼️ "
ui_print " "
sleep 1
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
unzip -o "$ZIPFILE" 'kt/*' -d $MODPATH >&2

if [[ -e /data/adb/modules/person-kt ]]; then
echo "Person Kernel Tweak Detected"
echo "Removing...."
rm -rf /data/adb/modules/person-kt
fi
sleep 1
if [[ -e /data/adb/modules/mvast ]]; then
echo "Mvast Detected"
echo "Removing...."
rm -rf /data/adb/modules/mvast
fi
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/kt 0 0 0777 0755
}