//
//  ProfileViewModel.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import Foundation

enum ProfileViewModel {
    case idle
    case loading
    case loaded(profile: ProfileViewModelData)
    case failed(message: String)
}

struct ProfileViewModelData {
    let fullname: String
    let subtitle: String
    let linkedInURL: URL
}

// Adapter from model to view-model
extension ProfileViewModelData {
    init(profile: Profile) {
        // INFO - localized strings to be added for app handling more than one language
        
        let fullname = profile.firstName + " " + profile.lastName
        let subtitle = profile.positionName + " with \(profile.experience) years of experience"
        
        self.init(fullname: fullname, subtitle: subtitle, linkedInURL: profile.linkedInUrl)
    }
}
