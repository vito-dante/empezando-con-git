#                                                                #
#    REPARA TU HDD CON TAN-SOLO UN 2-BLE CLICK            #
#                  BY: JOKJER-LINUX                              #
##################################################################


zenity --question --width=350 --height=120 --title "Repara Tu Disco" --ok-label="Si" \
--cancel-label="No" --text "Este Proceso Tardará Un Timepo Prolongado. ¿Desea Continuar?" ; echo $

zenity --info --text "Puedes Finalizar El Proceso Presionando Ctrl+c" --title="VITO"

zenity --info --text "Para Continuar Ingresa La Contraseña De Usuario" --title="VITO"

sudo badblocks -s -v -n -f /dev/sda

zenity --info --text "El Proceso Finalizo Correctamente" --title="VITO"





















