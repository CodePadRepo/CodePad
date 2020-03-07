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

struct ColorScheme: Equatable {
    var readableName: String
    var aceReadableName: String
    var type: ColorSchemeType
    
    init(_ tuple: (String, ColorSchemeType, String)) {
        self.readableName = tuple.0
        self.type = tuple.1
        self.aceReadableName = tuple.2
    }
    
    static func == (lhs: ColorScheme, rhs: ColorScheme) -> Bool {
        return lhs.readableName == rhs.readableName && lhs.aceReadableName == rhs.aceReadableName && lhs.type == rhs.type
    }
}

class ColorSchemeProvider {
    static let colorSchemes = [
        ColorScheme(("Chrome", ColorSchemeType.light, "chrome")),
        ColorScheme(("Clouds", ColorSchemeType.light, "clouds")),
        ColorScheme(("Crimson Editor", ColorSchemeType.light, "crimson_editor")),
        ColorScheme(("Dawn", ColorSchemeType.light, "dawn")),
        ColorScheme(("Dreamweaver", ColorSchemeType.light, "dreamweaver")),
        ColorScheme(("Eclipse", ColorSchemeType.light, "eclipse")),
        ColorScheme(("GitHub", ColorSchemeType.light, "github")),
        ColorScheme(("IPlastic", ColorSchemeType.light, "iplastic")),
        ColorScheme(("Solarized Light", ColorSchemeType.light, "solarized_light")),
        ColorScheme(("TextMate", ColorSchemeType.light, "textmate")),
        ColorScheme(("Tomorrow", ColorSchemeType.light, "tomorrow")),
        ColorScheme(("XCode", ColorSchemeType.light, "xcode")),
        ColorScheme(("Kuroir", ColorSchemeType.light, "kuroir")),
        ColorScheme(("KatzenMilch", ColorSchemeType.light, "katzenmilch")),
        ColorScheme(("SQL Server", ColorSchemeType.light, "sqlserver")),
        ColorScheme(("Ambiance", ColorSchemeType.dark, "ambiance")),
        ColorScheme(("Chaos", ColorSchemeType.dark, "chaos")),
        ColorScheme(("Clouds Midnight", ColorSchemeType.dark, "clouds_midnight")),
        ColorScheme(("Dracula", ColorSchemeType.dark, "dracula")),
        ColorScheme(("Cobalt", ColorSchemeType.dark, "cobalt")),
        ColorScheme(("Gruvbox", ColorSchemeType.dark, "gruvbox")),
        ColorScheme(("Green on Black", ColorSchemeType.dark, "gob")),
        ColorScheme(("idle Fingers", ColorSchemeType.dark, "idle_fingers")),
        ColorScheme(("krTheme", ColorSchemeType.dark, "kr_theme")),
        ColorScheme(("Merbivore", ColorSchemeType.dark, "merbivore")),
        ColorScheme(("Merbivore Soft", ColorSchemeType.dark, "merbivore_soft")),
        ColorScheme(("Mono Industrial", ColorSchemeType.dark, "mono_industrial")),
        ColorScheme(("Monokai", ColorSchemeType.dark, "monokai")),
        ColorScheme(("Pastel on dark", ColorSchemeType.dark, "pastel_on_dark")),
        ColorScheme(("Solarized Dark", ColorSchemeType.dark, "solarized_dark")),
        ColorScheme(("Terminal", ColorSchemeType.dark, "terminal")),
        ColorScheme(("Tomorrow Night", ColorSchemeType.dark, "tomorrow_night")),
        ColorScheme(("Tomorrow Night Blue", ColorSchemeType.dark, "tomorrow_night_blue")),
        ColorScheme(("Tomorrow Night Bright", ColorSchemeType.dark, "tomorrow_night_bright")),
        ColorScheme(("Tomorrow Night 80s", ColorSchemeType.dark, "tomorrow_night_eighties")),
        ColorScheme(("Twilight", ColorSchemeType.dark, "twilight"))
    ]
    
    static func schemes(forType type: ColorSchemeType) -> Array<ColorScheme> {
        return colorSchemes.filter({ $0.type == type })
    }
}
