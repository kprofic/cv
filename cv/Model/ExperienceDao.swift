//
//  ExperienceDao.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import Foundation

protocol ExperienceDao {
    func readExperience(completion: @escaping (Result<[Experience], Error>) -> Void)
}
