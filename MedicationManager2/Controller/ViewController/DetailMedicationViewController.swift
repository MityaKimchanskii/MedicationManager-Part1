//
//  DetailMedicationViewController.swift
//  MedicationManager2
//
//  Created by Mitya Kim on 1/27/22.
//

import UIKit

class DetailMedicationViewController: UIViewController {
    
    var medication: Medication?

    // MARK: - IBOutlets
    @IBOutlet weak var medLabel: UILabel!
    @IBOutlet weak var titleMedTF: UITextField!
    @IBOutlet weak var bodyMedTV: UITextView!
    @IBOutlet weak var datePickerDP: UIDatePicker!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let medication = medication {
            medLabel.text = "Edit Medication"
            titleMedTF.text = medication.title
            bodyMedTV.text = medication.body
            datePickerDP.date = medication.timeOfDay ?? Date()
        } else {
            medLabel.text = "Add New Medication"
        }
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonTapper(_ sender: Any) {
        guard let title = titleMedTF.text, let body = bodyMedTV.text, !title.isEmpty else { return }
        let date = datePickerDP.date
        
        if let medication = medication {
            MedicationController.shared.updateMedication(medication: medication, title: title, body: body, timeOfDay: date)
        } else {
            MedicationController.shared.addMedication(title: title, timeOfDay: date, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
}
