//
//  File.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

protocol ProfileDao {
    func readProfile(completion: (Result<Profile, Error>) -> Void)
}
