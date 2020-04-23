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
        DispatchQueue.global().async {
            let url = Bundle.main.url(forResource: "profile", withExtension: "json")!
            let localProfileData = try! Data(contentsOf: url)
          
            do {
                let profile = try JSONDecoder().decode(Profile.self, from: localProfileData)
                completion(.success(profile))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
