//
//  PersistenceManager.swift
//  CfC-t38-iOS
//
//  Created by Armando Brito on 7/31/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import Foundation

class PersistenceManager {
    
    init() {
        print("files directory", getDirectoryPath())
    }
    
    // Save object in document directory
    func saveObject(fileName: String, object: Any) throws {
        
        let filePath = self.getDirectoryPath().appendingPathComponent(fileName)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            try data.write(to: filePath)
        } catch {
            print("error is: \(error.localizedDescription)")
            throw error
        }
    }
    
    // Get object from document directory
    func getObject(fileName: String) throws -> Any? {
        
        let filePath = self.getDirectoryPath().appendingPathComponent(fileName)
        do {
            let data = try Data(contentsOf: filePath)
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            return object
        } catch {
            print("error is: \(error.localizedDescription)")
            throw error
        }
    }
    
    //Get the document directory path
    private func getDirectoryPath() -> URL {
        let arrayPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return arrayPaths[0]
    }
}
