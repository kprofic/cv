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
    
    var viewModel: Profile? {
        didSet {
            guard let vm = viewModel else { return }
            
            fullnameLabel.text = vm.firstName + " " + vm.lastName
            subtitleLabel.text = vm.positionName + " with \(vm.experience) years of experience"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = Profile(firstName: "Krzysztof",
                            lastName: "Profic",
                            positionName: "Senior iOS Developer",
                            experience: 9,
                            linkedInUrl: URL(string: "https://www.linkedin.com/in/krzysztof-profic-b73b4421/")!)
    }
}

