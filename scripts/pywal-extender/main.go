package main

import(
    "os"
    "encoding/json"
    "strings"
    "strconv"
    "fmt"
)

type walStruct struct {
    Wallpaper string
    Alpha string
    Special Special
    Colors Colors
}

type Special struct {
    Background string
    Foreground string
    Cursor string
}

type Colors struct {
    Color0 string
    Color1 string
    Color2 string
    Color3 string
    Color4 string
    Color5 string
    Color6 string
    Color7 string
    Color8 string
    Color9 string
    Color10 string
    Color11 string
    Color12 string
    Color13 string
    Color14 string
    Color15 string
}

func CalculateTextColor(_inColor string) string {
    // colors are in rgb format
    red := _inColor[1:3]
    green := _inColor[3:5]
    blue := _inColor[5:7]

    redVal, err := strconv.ParseInt(red, 16, 32);
    if err != nil {
        panic("failed to parse red value of string: " + _inColor)
    }
    greenVal, err := strconv.ParseInt(green, 16, 64)
    if err != nil {
        panic("failed to parse green value of string: " + _inColor)
    }
    blueVal, err := strconv.ParseInt(blue, 16, 64)
    if err != nil {
        panic("failed to parse blue value of string: " + _inColor)
    }

    // calculate luminosity (brightness)
    fmt.Println(redVal, ", ", greenVal, ", ", blueVal, ", ");
    luminosity := (0.21 * float32(redVal)) + (0.72 * float32(greenVal)) + (0.07 * float32(blueVal))

    fmt.Println("in color: ", _inColor, " out color: ", luminosity);

    if luminosity < 120 { // if color is dark
        return "#ffffff" // white
    } else {
        return "#000000" // else black
    }
}

func main () {
    userHome, err := os.UserHomeDir()
    waldir := userHome + "/.cache/wal/"
    println(waldir + "colors.json")

    jsonData, err := os.ReadFile(waldir + "colors.json")
    if err != nil {
        panic(err)
    }

    //var data map[string]interface{}
    var data walStruct
    json.Unmarshal([]byte(jsonData), &data)

    var textColors Colors
    textColors.Color0 = CalculateTextColor(data.Colors.Color0)
    textColors.Color1 = CalculateTextColor(data.Colors.Color1)
    textColors.Color2 = CalculateTextColor(data.Colors.Color2)
    textColors.Color3 = CalculateTextColor(data.Colors.Color3)
    textColors.Color4 = CalculateTextColor(data.Colors.Color4)
    textColors.Color5 = CalculateTextColor(data.Colors.Color5)
    textColors.Color6 = CalculateTextColor(data.Colors.Color6)
    textColors.Color7 = CalculateTextColor(data.Colors.Color7)
    textColors.Color8 = CalculateTextColor(data.Colors.Color8)

    genColorsAlacritty(data, waldir + "colors-alacritty.yml")
    genColorsWaybar(data, waldir + "colors-waybar.css", textColors)
    genColorsHyprland(data, waldir + "colors-hyprland.conf")
    genColorsDunst(data, textColors, userHome + "/.config/dunst/dunstrc.d/99-colors.conf")
    genColorsHelix(data, textColors, userHome + "/.config/helix/themes/wal.toml")
    genColorsSpicetify(data, textColors, userHome + "/.config/spicetify/Themes/wal/color.ini")
    genCssTextColors(textColors, userHome + "/.cache/wal/colors-text.css")
}

func genColorsAlacritty(data walStruct, filepath string) {
    alacrittyColors := "colors:\n" +
    "  primary:\n" +
    "    background: '" + data.Special.Background + "'\n" +
    "    foreground: '" + data.Special.Foreground + "'\n" +
    "  normal:\n" + 
    "    black: '" + data.Colors.Color0 + "'\n" +
    "    red: '" + data.Colors.Color1 + "'\n" +
    "    green: '" + data.Colors.Color2 + "'\n" +
    "    yellow: '" + data.Colors.Color3 + "'\n" +
    "    blue: '" + data.Colors.Color4 + "'\n" +
    "    magenta: '" + data.Colors.Color5 + "'\n" +
    "    cyan: '" + data.Colors.Color6 + "'\n" +
    "    white: '" + data.Colors.Color7 + "'\n" +
    "  bright:\n" + 
    "    black: '" + data.Colors.Color0 + "'\n" +
    "    red: '" + data.Colors.Color1 + "'\n" +
    "    green: '" + data.Colors.Color2 + "'\n" +
    "    yellow: '" + data.Colors.Color3 + "'\n" +
    "    blue: '" + data.Colors.Color4 + "'\n" +
    "    magenta: '" + data.Colors.Color5 + "'\n" +
    "    cyan: '" + data.Colors.Color6 + "'\n" +
    "    white: '" + data.Colors.Color7 + "'\n" +
    "  dim:\n" + 
    "    black: '" + data.Colors.Color0 + "'\n" +
    "    red: '" + data.Colors.Color1 + "'\n" +
    "    green: '" + data.Colors.Color2 + "'\n" +
    "    yellow: '" + data.Colors.Color3 + "'\n" +
    "    blue: '" + data.Colors.Color4 + "'\n" +
    "    magenta: '" + data.Colors.Color5 + "'\n" +
    "    cyan: '" + data.Colors.Color6 + "'\n" +
    "    white: '" + data.Colors.Color7 + "'\n"

    os.WriteFile(filepath, []byte(alacrittyColors), 0664)
}

func genColorsWaybar(data walStruct, filepath string, textColors Colors) {
    waybarColors :=
    "@define-color background " + data.Special.Background  + ";\n" +
    "@define-color foreground " + data.Special.Foreground + ";\n" +
    "@define-color color0 " + data.Colors.Color0 + ";\n" +
    "@define-color color1 " + data.Colors.Color1 + ";\n" +
    "@define-color color2 " + data.Colors.Color2 + ";\n" +
    "@define-color color3 " + data.Colors.Color3 + ";\n" +
    "@define-color color4 " + data.Colors.Color4 + ";\n" +
    "@define-color color5 " + data.Colors.Color5 + ";\n" +
    "@define-color color6 " + data.Colors.Color6 + ";\n" +
    "@define-color color7 " + data.Colors.Color7 + ";\n" +
    "@define-color color8 " + data.Colors.Color8 + ";\n" +

    "@define-color tcolor0 " + textColors.Color0 + ";\n" +
    "@define-color tcolor1 " + textColors.Color1 + ";\n" +
    "@define-color tcolor2 " + textColors.Color2 + ";\n" +
    "@define-color tcolor3 " + textColors.Color3 + ";\n" +
    "@define-color tcolor4 " + textColors.Color4 + ";\n" +
    "@define-color tcolor5 " + textColors.Color5 + ";\n" +
    "@define-color tcolor6 " + textColors.Color6 + ";\n" +
    "@define-color tcolor7 " + textColors.Color7 + ";\n" +
    "@define-color tcolor8 " + textColors.Color8 + ";\n"

    os.WriteFile(filepath, []byte(waybarColors), 0664)
}

func genColorsHyprland(data walStruct, filepath string) {
    data.Colors.Color0 = strings.Replace(data.Colors.Color0, "#", "", 1)
    data.Colors.Color1 = strings.Replace(data.Colors.Color1, "#", "", 1)
    data.Colors.Color2 = strings.Replace(data.Colors.Color2, "#", "", 1)
    data.Colors.Color3 = strings.Replace(data.Colors.Color3, "#", "", 1)
    data.Colors.Color4 = strings.Replace(data.Colors.Color4, "#", "", 1)
    data.Colors.Color5 = strings.Replace(data.Colors.Color5, "#", "", 1)
    data.Colors.Color6 = strings.Replace(data.Colors.Color6, "#", "", 1)
    data.Colors.Color7 = strings.Replace(data.Colors.Color7, "#", "", 1)

    data.Special.Background = strings.Replace(data.Special.Background, "#", "", 1)
    data.Special.Foreground = strings.Replace(data.Special.Foreground, "#", "", 1)

    hyprlandColors := "$colorForeground = 0xff" + data.Special.Foreground + "\n" +
    "$colorBackground = 0xff" + data.Special.Background + "\n" +
    "$color0 = 0xff" + data.Colors.Color0 + "\n" +
    "$color1 = 0xff" + data.Colors.Color1 + "\n" +
    "$color2 = 0xff" + data.Colors.Color2 + "\n" +
    "$color3 = 0xff" + data.Colors.Color3 + "\n" +
    "$color4 = 0xff" + data.Colors.Color4 + "\n" +
    "$color5 = 0xff" + data.Colors.Color5 + "\n" +
    "$color6 = 0xff" + data.Colors.Color6 + "\n" +
    "$color7 = 0xff" + data.Colors.Color7 + "\n"

    os.WriteFile(filepath, []byte(hyprlandColors), 0664)
}

func genColorsDunst(data walStruct, textColors Colors, filepath string) {
    dunstColors :=
    "[urgency_low]\n" +
    "    background = \"" + data.Special.Background + "\"\n" +
    "    foreground = \"" + data.Special.Foreground + "\"\n" +
    "[urgency_normal]\n" +
    "    background = \"" + data.Special.Background + "\"\n" +
    "    foreground = \"" + data.Special.Foreground + "\"\n"

    os.WriteFile(filepath, []byte(dunstColors), 0664)
}

func genColorsHelix(data walStruct, textColors Colors, filepath string) {
    helixColors :=
    "inherits = \"base16_default\"" +
    "\n[pallete]\n\n" +
    "default = \"" + data.Colors.Color0 + "\"\n" +
    "black = \"" + data.Colors.Color1 + "\"\n" +
    "red = \"" + data.Colors.Color2 + "\"\n" +
    "green = \"" + data.Colors.Color3 + "\"\n" +
    "yellow = \"" + data.Colors.Color4 + "\"\n" +
    "blue = \"" + data.Colors.Color5 + "\"\n" +
    "magenta = \"" + data.Colors.Color6 + "\"\n" +
    "cyan = \"" + data.Colors.Color7 + "\"\n" +
    "gray = \"" + data.Colors.Color8 + "\"\n" +
    "light-red = \"" + data.Colors.Color9 + "\"\n" +
    "light-green = \"" + data.Colors.Color10 + "\"\n" +
    "light-yellow = \"" + data.Colors.Color11 + "\"\n" +
    "light-blue = \"" + data.Colors.Color12 + "\"\n" +
    "light-magenta = \"" + data.Colors.Color13 + "\"\n" +
    "light-cyan = \"" + data.Colors.Color14 + "\"\n"

    os.WriteFile(filepath, []byte(helixColors), 0664)
}

func genColorsSpicetify(data walStruct, textColors Colors, filepath string) {
    spicetifyColors :=
    "[Wal]" + "\n" +
    "main = " + data.Special.Background[1:] + "\n" +
    "accent = " + data.Colors.Color1[1:] + "\n" +
    "accent-active = " + data.Colors.Color1[1:] + "\n" +
    "accent-inactive = " + data.Special.Foreground[1:] + "\n" +
    "banner = " + data.Colors.Color1[1:] + "\n" +
    "border-active = " + data.Colors.Color1[1:] + "\n" +
    "border-inactive = " + data.Special.Foreground[1:] + "\n" +
    "header = " + data.Special.Background[1:] + "\n" +
    "highlight = " + data.Colors.Color1[1:] + "\n" +
    "notification = " + data.Special.Background[1:] + "\n" +
    "notification-error = " + data.Special.Foreground[1:] + "\n" +
    "subtext = " + textColors.Color0[1:] + "\n" +
    "text = " + textColors.Color0[1:] + "\n"

    os.WriteFile(filepath, []byte(spicetifyColors), 0664)
}

func genCssTextColors(textColors Colors, filepath string) {
    cssTextColors :=
    ":root {\n" +
    "    --tcolor0: " + textColors.Color0 + ";\n" +
    "    --tcolor1: " + textColors.Color1 + ";\n" +
    "    --tcolor2: " + textColors.Color2 + ";\n" +
    "    --tcolor3: " + textColors.Color3 + ";\n" +
    "    --tcolor4: " + textColors.Color4 + ";\n" +
    "    --tcolor5: " + textColors.Color5 + ";\n" +
    "    --tcolor6: " + textColors.Color6 + ";\n" +
    "    --tcolor7: " + textColors.Color7 + ";\n" +
    "    --tcolor8: " + textColors.Color8 + ";\n" +
    "    --tcolor9: " + textColors.Color9 + ";\n" +
    "    --tcolor10: " + textColors.Color10 + ";\n" +
    "    --tcolor11: " + textColors.Color11 + ";\n" +
    "    --tcolor12: " + textColors.Color12 + ";\n" +
    "    --tcolor13: " + textColors.Color13 + ";\n" +
    "    --tcolor14: " + textColors.Color14 + ";\n" +
    "    --tcolor15: " + textColors.Color15 + ";\n" +
    "}"

    os.WriteFile(filepath, []byte(cssTextColors), 0664)
}

