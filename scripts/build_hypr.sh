cmake -S hyprutils -B hyprutils/build
make -C hyprutils/build

cmake -S hyprwire -B hyprwire/build
make -C hyprwire/build

cmake -S hyprwayland-scanner -B hyprwayland-scanner/build
make -C hyprwayland-scanner/build

cmake -S hyprlang -B hyprlang/build
make -C hyprlang/build

cmake -S hyprgraphics -B hyprgraphics/build
make -C hyprgraphics/build

cmake -S hyprcursor -B hyprcursor/build
make -C hyprcursor/build

cmake -S aquamarine -B aquamarine/build
make -C aquamarine/build

cmake -S Hyprland -B Hyprland/build
make -C Hyprland/build
