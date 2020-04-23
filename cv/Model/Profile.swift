//
//  Profile.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import Foundation

struct Profile: Codable {
    let firstName: String
    let lastName: String
    let positionName: String
    let experience: UInt
    let linkedInUrl: URL
}
