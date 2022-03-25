// Created by Mirror Team
// Copyright (с) 2020 Mirror AI Inc. All rights reserved.

import Foundation

extension NSError {
    static func textError(_ localizedDescription: String) -> NSError {
        return NSError(
            domain: Bundle.main.bundleIdentifier ?? "com.metacomics.unknown",
            code: 0,
            userInfo: [NSLocalizedDescriptionKey: localizedDescription]
        )
    }
}
