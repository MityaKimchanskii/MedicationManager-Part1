//
//  MedicationController.swift
//  MedicationManager2
//
//  Created by Mitya Kim on 1/27/22.
//

import Foundation
import CoreData

class MedicationController {
    
    // MARK: - Properties
    static let shared = MedicationController()
    
    private init() {}
    
    private lazy var fetchRequest: NSFetchRequest<Medication> = {
        let request = NSFetchRequest<Medication>(entityName: "Medication")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    var medications: [Medication] = []
    
    // MARK: - CRUD
    func addMedication(title: String, timeOfDay: Date, body: String) {
        let medication = Medication(title: title, timeOfDay: timeOfDay, body: body)
        medications.append(medication)
        CoreDataStack.saveContext()
    }
    
    func fetchMedication() {
        let medications = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(medications.count)
        self.medications = medications
    }
    
    func updateMedication(medication: Medication, title: String, body: String, timeOfDay: Date) {
        medication.timeOfDay = timeOfDay
        medication.body = body
        medication.title = title
        CoreDataStack.saveContext()
    }
    
    func deleteMedication() {
        
    }
    
}
