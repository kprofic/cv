//
//  ExperienceTableViewCell.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
    @IBOutlet weak var companyLogoImageView: UIImageView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var timeDescriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        companyLogoImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
