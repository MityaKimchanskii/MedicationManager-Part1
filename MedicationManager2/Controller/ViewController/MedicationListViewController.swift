//
//  MedicationListViewController.swift
//  MedicationManager2
//
//  Created by Mitya Kim on 1/27/22.
//

import UIKit

class MedicationListViewController: UIViewController {

    @IBOutlet weak var medTableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        MedicationController.shared.fetchMedication()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        medTableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue",
           let indexPath = medTableView.indexPathForSelectedRow,
           let destinationVC = segue.destination as? DetailMedicationViewController {
                let medication = MedicationController.shared.medications[indexPath.row]
            destinationVC.medication = medication
        } 
    }
}

extension MedicationListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MedicationController.shared.medications.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "medCell", for: indexPath) as? MedicationTableViewCell else { return UITableViewCell() }
        
        let medication = MedicationController.shared.medications[indexPath.row]
        
        cell.configure(with: medication)
        
        return cell
    }
}

extension MedicationListViewController: UITableViewDelegate {}

