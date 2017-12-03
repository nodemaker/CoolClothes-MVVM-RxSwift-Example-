//
//  DateFormatter+Extensions.swift
//  CoolClothes
//
//  Created by Chatterjee, Sumeru(AWF) on 12/3/17.
//  Copyright © 2017 Chatterjee, Sumeru. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let `default`: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "yy/MM/dd HH:mm"
        
        return formatter
    }()
    
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        return formatter
    }()
    
    static let iso8601noneMilliSec: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        return formatter
    }()
}
