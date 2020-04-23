//
//  Experience.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import Foundation

struct Experience: Codable {
    let companyName: String
    let companyLogoName: String
    let position: String
    let dateStarted: Date
    let dateFinished: Date?
}
