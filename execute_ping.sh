#!/bin/bash

URL="https://srvshyweb.yucatan.gob.mx/cgi-bin/wspd_cgi.sh/WService=wsingresos/internet/servicios/wsRecibosPagosWeb.r"
BODYPARAMS="cOpcion=obtenerDetalleReferencia&cLineaReferencia="$(date '+%Y%m%d%H%M%S')

for i in $(eval echo {$1..$2}); do     
    BODYPARAMS="cOpcion=obtenerDetalleReferencia&cLineaReferencia="$(date '+%Y%m%d%H%M%S')
    echo "--------------------------------------------------------------------------------"
    echo "fecha_inicio="$(date '+%Y-%m-%d %H:%M:%S')
    echo "url=$URL"    
    echo "params:$BODYPARAMS"
    curl  -w "Establish Connection:%{time_connect}\nStart_Transfer:%{time_starttransfer}\nTotal:%{time_total}\n" --insecure -o /dev/null -d $BODYPARAMS https://srvshyweb.yucatan.gob.mx/cgi-bin/wspd_cgi.sh/WService=wsingresos/internet/servicios/wsRecibosPagosWeb.r
    echo "fecha_fin="$(date '+%Y-%m-%d %H:%M:%S')
    if [ $i -ne 1 ] 
    then
        sleep 90s  
    fi
done


