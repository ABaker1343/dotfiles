package main

import(
    "os"
    "encoding/json"
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

    /*alacrittyColors := "colors:\n" +
    "  primary:\n" +
    "    background: '" + data["special"]["background"] + "'\n" +
    "    foreground: '" + data["special"]["foreground"] + "'\n" +
    "  normal:\n" + 
    "    black: '" + data["colors"]["color0"] + "'\n" +
    "    red: '" + data["colors"]["color1"] + "'\n" +
    "    green: '" + data["colors"]["color2"] + "'\n" +
    "    yellow: '" + data["colors"]["color3"] + "'\n" +
    "    blue: '" + data["colors"]["color4"] + "'\n" +
    "    magenta: '" + data["colors"]["color5"] + "'\n" +
    "    cyan: '" + data["colors"]["color6"] + "'\n" +
    "    white: '" + data["colors"]["color7"] + "'\n"*/


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

    os.WriteFile(waldir + "colors-alacritty.yml", []byte(alacrittyColors), 0664)
    fmt.Println(alacrittyColors)

}
