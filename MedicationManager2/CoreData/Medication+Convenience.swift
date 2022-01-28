//
//  Medication+Convenience.swift
//  MedicationManager2
//
//  Created by Mitya Kim on 1/27/22.
//

import CoreData

extension Medication {
    convenience init(title: String, timeOfDay: Date, body: String = "Write description...", context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.timeOfDay = timeOfDay
        self.body = body
    }
}

