//
//  GlobalConstsHelper.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/02/03.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import Foundation

enum ColorSchemeType: Int {
    case light
    case dark
}

class GlobalConstsHelper {
    static let colorSchemes = [
        ("Chrome", ColorSchemeType.light),
        ("Clouds", ColorSchemeType.light),
        ("Crimson Editor", ColorSchemeType.light),
        ("Dawn", ColorSchemeType.light),
        ("Dreamweaver", ColorSchemeType.light),
        ("Eclipse", ColorSchemeType.light),
        ("GitHub", ColorSchemeType.light),
        ("IPlastic", ColorSchemeType.light),
        ("Solarized Light", ColorSchemeType.light),
        ("TextMate", ColorSchemeType.light),
        ("Tomorrow", ColorSchemeType.light),
        ("XCode", ColorSchemeType.light),
        ("Kuroir", ColorSchemeType.light),
        ("KatzenMilch", ColorSchemeType.light),
        ("SQL Server", ColorSchemeType.light),
        ("Ambiance", ColorSchemeType.dark),
        ("Chaos", ColorSchemeType.dark),
        ("Clouds Midnight", ColorSchemeType.dark),
        ("Dracula", ColorSchemeType.dark),
        ("Cobalt", ColorSchemeType.dark),
        ("Gruvbox", ColorSchemeType.dark),
        ("Green on Black", ColorSchemeType.dark),
        ("idle Fingers", ColorSchemeType.dark),
        ("krTheme", ColorSchemeType.dark),
        ("Merbivore", ColorSchemeType.dark),
        ("Merbivore Soft", ColorSchemeType.dark),
        ("Mono Industrial", ColorSchemeType.dark),
        ("Monokai", ColorSchemeType.dark),
        ("Pastel on dark", ColorSchemeType.dark),
        ("Solarized Dark", ColorSchemeType.dark),
        ("Terminal", ColorSchemeType.dark),
        ("Tomorrow Night", ColorSchemeType.dark),
        ("Tomorrow Night Blue", ColorSchemeType.dark),
        ("Tomorrow Night Bright", ColorSchemeType.dark),
        ("Tomorrow Night 80s", ColorSchemeType.dark),
        ("Twilight", ColorSchemeType.dark)
    ]
}
