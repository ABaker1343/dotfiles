ishdr=$1
monitor=$2
saturation=$3

if [[ $ishdr == true ]]; then
    hyprctl keyword monitor "$monitor,2560x1440@143.97Hz,1920x0,1,vrr,2,bitdepth,10,cm,hdr,sdrsaturation,$saturation"
    echo "$monitor,2560x1440@143.97Hz,1920x0,1,vrr,2,bitdepth,10,cm,hdr,sdrsaturation,$saturation"
else
    hyprctl keyword monitor "$monitor,2560x1440@143.97Hz,1920x0,1,vrr,2,bitdepth,8,cm,srgb"
fi

