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
    
    func readExperience(completion: @escaping (Result<[Experience], Error>) -> Void) {
        DispatchQueue.global().async {
            let url = Bundle.main.url(forResource: "experience", withExtension: "json")!
            let localData = try! Data(contentsOf: url)
          
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let exp = try decoder.decode(Array<Experience>.self, from: localData)
                completion(.success(exp))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
