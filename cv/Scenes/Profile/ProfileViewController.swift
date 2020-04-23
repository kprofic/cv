//
//  ViewController.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var linkedInButton: UIButton!
    
    var viewModel: ProfileViewModel? {
        didSet {
            guard let vm = viewModel else { return }
            
            fullnameLabel.text = vm.fullname
            subtitleLabel.text = vm.subtitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profile = Profile(firstName: "Krzysztof",
                               lastName: "Profic",
                               positionName: "Senior iOS Developer",
                               experience: 9,
                               linkedInUrl: URL(string: "https://www.linkedin.com/in/krzysztof-profic-b73b4421/")!)
        
        self.viewModel = ProfileViewModel(profile: profile)
    }
    
    @IBAction func linkedInButtonTapped(_ sender: Any) {
        guard let profileUrl = viewModel?.linkedInURL else { return }
        
        UIApplication.shared.open(profileUrl, options: [:], completionHandler: nil)
    }
}

