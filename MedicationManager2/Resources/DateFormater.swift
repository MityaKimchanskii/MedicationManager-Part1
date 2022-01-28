//
//  DateFormater.swift
//  MedicationManager2
//
//  Created by Mitya Kim on 1/27/22.
//

import Foundation

extension DateFormatter {
    static let medDateFormatter: DateFormatter = {
        let formatter =  DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
}
