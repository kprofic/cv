//
//  ExperienceTableViewController.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import UIKit

class ExperienceTableViewController: UITableViewController {
    let experienceDao: ExperienceDao = LocalDataManager()
    
    var model: ExperienceViewModel = .idle {
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
            case .success(let experiences):
                self?.model = .loaded(experience: ExperienceViewModelData.from(experiences: experiences))
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
        guard case .loaded(let exps) = model else { return 0 }
        
        return exps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard case .loaded(let exps) = model else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpRow", for: indexPath) as! ExperienceTableViewCell
        let exp = exps[indexPath.row]
        
        // todo load from url
        cell.companyLogoImageView.image = UIImage(named: "talixo")
        cell.companyNameLabel.text = exp.companyName
        cell.positionLabel.text = exp.position
        cell.timeDescriptionLabel.text = exp.periodDescription

        return cell
    }
}
