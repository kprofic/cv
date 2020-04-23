//
//  ExperienceViewModel.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import Foundation
import UIKit

enum ExperienceViewModel {
    case idle
    case loading
    case loaded(experience: [ExperienceViewModelData])
    case failed(message: String)
}

struct ExperienceViewModelData {
    let companyName: String
    let companyLogo: UIImage
    let position: String
    let periodDescription: String
}

// Adapter from model to view-model
extension ExperienceViewModelData {
    init(experience: Experience) {
        // INFO - localized strings to be added for app handling more than one language
        let from = dateFormatter.string(from: experience.dateStarted)
        let to = experience.dateFinished.flatMap(dateFormatter.string(from:)) ?? "Present"
        let desc = "\(from) - \(to)"
        
        self.init(companyName: experience.companyName,
                  companyLogo: UIImage(named: experience.companyLogoName)!,
                  position: experience.position,
                  periodDescription: desc)
    }
    
    static func from(experiences: [Experience]) -> [ExperienceViewModelData] {
        return experiences.map(ExperienceViewModelData.init(experience:))
    }
}

private let dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.timeStyle = .none
    df.dateStyle = .medium
    return df
}()
