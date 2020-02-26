//
//  URLHelper.swift
//  CodePad
//
//  Created by Ryang Sohn on 2020/02/05.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit

extension UIApplication {
    static func cacheURL() -> URL {
        let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return cacheURL
    }
}
