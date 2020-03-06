//
//  ColorSchemeHelper.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/03/05.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

enum ColorSchemeType: Int {
    case light
    case dark
}

class ColorSchemeHelper {
    static let colorSchemes = [
        ("Chrome", ColorSchemeType.light, "chrome"),
        ("Clouds", ColorSchemeType.light, "clouds"),
        ("Crimson Editor", ColorSchemeType.light, "crimson_editor"),
        ("Dawn", ColorSchemeType.light, "dawn"),
        ("Dreamweaver", ColorSchemeType.light, "dreamweaver"),
        ("Eclipse", ColorSchemeType.light, "eclipse"),
        ("GitHub", ColorSchemeType.light, "github"),
        ("IPlastic", ColorSchemeType.light, "iplastic"),
        ("Solarized Light", ColorSchemeType.light, "solarized_light"),
        ("TextMate", ColorSchemeType.light, "textmate"),
        ("Tomorrow", ColorSchemeType.light, "tomorrow"),
        ("XCode", ColorSchemeType.light, "xcode"),
        ("Kuroir", ColorSchemeType.light, "kuroir"),
        ("KatzenMilch", ColorSchemeType.light, "katzenmilch"),
        ("SQL Server", ColorSchemeType.light, "sqlserver"),
        ("Ambiance", ColorSchemeType.dark, "ambiance"),
        ("Chaos", ColorSchemeType.dark, "chaos"),
        ("Clouds Midnight", ColorSchemeType.dark, "clouds_midnight"),
        ("Dracula", ColorSchemeType.dark, "dracula"),
        ("Cobalt", ColorSchemeType.dark, "cobalt"),
        ("Gruvbox", ColorSchemeType.dark, "gruvbox"),
        ("Green on Black", ColorSchemeType.dark, "gob"),
        ("idle Fingers", ColorSchemeType.dark, "idle_fingers"),
        ("krTheme", ColorSchemeType.dark, "kr_theme"),
        ("Merbivore", ColorSchemeType.dark, "merbivore"),
        ("Merbivore Soft", ColorSchemeType.dark, "merbivore_soft"),
        ("Mono Industrial", ColorSchemeType.dark, "mono_industrial"),
        ("Monokai", ColorSchemeType.dark, "monokai"),
        ("Pastel on dark", ColorSchemeType.dark, "pastel_on_dark"),
        ("Solarized Dark", ColorSchemeType.dark, "solarized_dark"),
        ("Terminal", ColorSchemeType.dark, "terminal"),
        ("Tomorrow Night", ColorSchemeType.dark, "tomorrow_night"),
        ("Tomorrow Night Blue", ColorSchemeType.dark, "tomorrow_night_blue"),
        ("Tomorrow Night Bright", ColorSchemeType.dark, "tomorrow_night_bright"),
        ("Tomorrow Night 80s", ColorSchemeType.dark, "tomorrow_night_eighties"),
        ("Twilight", ColorSchemeType.dark, "twilight")
    ]
}
