//
//  ViewController.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let profileDao: ProfileDao = LocalDataManager()
    
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var linkedInButton: UIButton!
    
    var viewModel: ProfileViewModel? {
        didSet {
            guard let vm = viewModel else { return }
         
            OperationQueue.main.addOperation {
                self.fullnameLabel.text = vm.fullname
                self.subtitleLabel.text = vm.subtitle
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileDao.readProfile { [weak self] result in
            switch result {
            case .success(let profile):
                self?.viewModel = ProfileViewModel(profile: profile)
            case .failure(let error ):
                print("Error occured \(error)")
            }
        }
    }
    
    @IBAction func linkedInButtonTapped(_ sender: Any) {
        guard let profileUrl = viewModel?.linkedInURL else { return }
        
        UIApplication.shared.open(profileUrl, options: [:], completionHandler: nil)
    }
}

