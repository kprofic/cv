//
//  LocalDataManager.swift
//  cv
//
//  Created by Krzysiek on 23/04/2020.
//  Copyright © 2020 kprofic. All rights reserved.
//

import Foundation



struct LocalDataManager: DaoFacade {
    func readProfile(completion: @escaping (Result<Profile, Error>) -> Void) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(800)) {
          let profile = Profile(firstName: "Krzysztof",
          lastName: "Profic",
          positionName: "Senior iOS Developer",
          experience: 9,
          linkedInUrl: URL(string: "https://www.linkedin.com/in/krzysztof-profic-b73b4421/")!)
          
          completion(.success(profile))

        }

    }
}
