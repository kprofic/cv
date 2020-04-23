//
//  ViewController.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    // INFO
    // this should be injected for proper DI
    let profileDao: ProfileDao = LocalDataManager()
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var linkedInButton: UIButton!
    
    var viewModel: ProfileViewModel = .idle {
        didSet {
            OperationQueue.main.addOperation {
                switch self.viewModel {
                case .idle, .loading:
                    break
                case .failed(let message):
                    let alert = UIAlertController(title: NSLocalizedString("Error", comment: ""),
                                                  message: message,
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.show(alert, sender: nil)
                case .loaded(let vm):
                    UIView.transition(with: self.view, duration: 0.6, options: .transitionCrossDissolve, animations: {
                        self.fullnameLabel.text = vm.fullname
                        self.subtitleLabel.text = vm.subtitle
                        self.avatarImageView.alpha = 1
                    })
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startLoadingData()
    }
    
    @IBAction func linkedInButtonTapped(_ sender: Any) {
        guard case .loaded(let vm) = viewModel else { return }
        
        UIApplication.shared.open(vm.linkedInURL, options: [:], completionHandler: nil)
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        startLoadingData()
    }
    
    // MARK: Private
    
    func startLoadingData(){
        viewModel = .loading
        profileDao.readProfile { [weak self] result in
            switch result {
            case .success(let profile):
                self?.viewModel = .loaded(profile: ProfileViewModelData(profile: profile))
            case .failure(let error ):
                print("Error loading profile: \(error)")
                self?.viewModel = .failed(message: NSLocalizedString("Can't load profile, tap to try again...", comment: ""))
            }
        }
    }
}

