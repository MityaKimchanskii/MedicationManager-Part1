//
//  MedicationTableViewCell.swift
//  MedicationManager2
//
//  Created by Mitya Kim on 1/27/22.
//

import UIKit

class MedicationTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var wasTakenButton: UIButton!
    
    // MARK: - IBActions
    @IBAction func markButtonTapped(_ sender: UIButton) {
        
    }
    
    func configure(with medication: Medication) {
        titleLabel.text = medication.title
        dateLabel.text = DateFormatter.medDateFormatter.string(from: medication.timeOfDay ?? Date())
    }
}

