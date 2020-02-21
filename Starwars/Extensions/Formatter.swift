//
//  Formatter.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import Foundation

extension Formatter {
    public func dateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-DD"
        return dateFormatter
    }
}
