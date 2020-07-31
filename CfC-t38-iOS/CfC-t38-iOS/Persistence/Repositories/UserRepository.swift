//
//  UserRepository.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/31/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

class UserRepository {
    
    let pm = PersistenceManager()
    let userPersName = "user"
    
    func get() throws -> User {
        return try pm.getObject(fileName: userPersName) as! User
    }
    
    func set(user: User) throws {
        try pm.saveObject(fileName: userPersName, object: user)
    }
    
}
