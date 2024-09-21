if [ ! -d hyprwayland-scanner ]; then
    git clone https://github.com/hyprwm/hyprwayland-scanner
fi
if [ ! -d hyprutils ]; then
    git clone https://github.com/hyprwm/hyprutils
fi
if [ ! -d aquamarine ]; then
    git clone https://github.com/hyprwm/aquamarine
fi
if [ ! -d hyprlang ]; then
    git clone https://github.com/hyprwm/hyprlang
fi
if [ ! -d hyprcursor ]; then
    git clone https://github.com/hyprwm/hyprcursor
fi
if [ ! -d Hyprland ]; then
    git clone https://github.com/hyprwm/Hyprland
fi
if [ ! -d hyprpaper ]; then
    git clone https://github.com/hyprwm/hyprpaper
fi
if [ ! -d hyprlock ]; then
    git clone https://github.com/hyprwm/hyprlock
fi
if [ ! -d xdg-desktop-portal-hyprland ]; then
    git clone https://github.com/hyprwm/xdg-desktop-portal-hyprland
fi

cd hyprwayland-scanner && \
git pull && \
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build && \
cmake --build build -j `nproc` && \
cmake --install build && \

cd ../hyprutils && \
git pull && \
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build && \
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF` && \
cmake --install build && \

cd ../aquamarine && \
git pull && \
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build && \
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF` && \
cmake --install ./build && \

cd ../hyprlang && \
git pull && \
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build && \
cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF` && \
cmake --install ./build && \

cd ../hyprcursor && \
git pull && \
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build && \
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF` && \
cmake --install build && \

cd ../Hyprland && \
git pull && \
make all && make install && \

cd ../hyprpaper && \
git pull && \
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build && \
cmake --build ./build --config Release --target hyprpaper -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF` && \
cmake --install ./build && \

cd ../hyprlock && \
git pull && \
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build && \
cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF` && \
cmake --install build && \

cd ../xdg-desktop-portal-hyprland && \
git pull && \
cmake -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -B build && \
cmake --build build && \
cmake --install build
