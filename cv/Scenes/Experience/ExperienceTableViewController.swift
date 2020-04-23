//
//  ExperienceTableViewController.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import UIKit

let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.timeStyle = .none
    df.dateStyle = .medium
    return df
}()



class ExperienceTableViewController: UITableViewController {
    let experienceDao: ExperienceDao = LocalDataManager()
    
    var model: [Experience] = [] {
        didSet {
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
    }
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        experienceDao.readExperience { [weak self] result in
            switch result {
            case .success(let experience):
                self?.model = experience
            case .failure(let error ):
                print("Error loading experience: \(error)")
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpRow", for: indexPath) as! ExperienceTableViewCell
        let exp = model[indexPath.row]
        
        cell.companyLogoImageView.image = UIImage(named: "talixo")
        cell.companyNameLabel.text = exp.companyName
        cell.positionLabel.text = exp.position
        
        let from = dateFormatter.string(from: exp.dateStarted)
        let to = exp.dateFinished.flatMap(dateFormatter.string(from:)) ?? "Present"
        cell.timeDescriptionLabel.text = "\(from) - \(to)"

        return cell
    }
}
