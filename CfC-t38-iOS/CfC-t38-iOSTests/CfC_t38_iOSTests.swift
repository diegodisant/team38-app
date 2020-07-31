//
//  CfC_t38_iOSTests.swift
//  CfC-t38-iOSTests
//
//  Created by Armando Brito on 7/30/20.
//  Copyright © 2020 Call For Code Team 38. All rights reserved.
//

import XCTest
@testable import CfC_t38_iOS

class CfC_t38_iOSTests: XCTestCase {
    
    var pm: PersistenceManager!

    override func setUp() {
        pm = PersistenceManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPersistence() {
        do {
            let user = ExampleData.aUser
            let _ = try pm.saveObject(fileName: "user", object: user)
            let loadeduser = try pm.getObject(fileName: "user") as! User
            XCTAssertTrue(loadeduser.curp == user.curp)
            
            let survey = ExampleData.aSurvey
            let _ = try pm.saveObject(fileName: "survey", object: survey)
            let loadedsurvey = try pm.getObject(fileName: "survey") as! Survey
            XCTAssertTrue(loadedsurvey.questions?.count == survey.questions?.count)
            
            let exposure = ExampleData.anExposure
            let _ = try pm.saveObject(fileName: "exposure", object: exposure)
            let loadedexposure = try pm.getObject(fileName: "exposure") as! Exposure
            XCTAssertTrue(loadedexposure.deviceId == exposure.deviceId)
            
            let lastExposures = ExampleData.lastExposures
            let _ = try pm.saveObject(fileName: "lastexposures", object: lastExposures)
            let loadedlastexposures = try pm.getObject(fileName: "lastexposures") as! LastExposures
            XCTAssertTrue(loadedlastexposures.exposures?.count == lastExposures.exposures?.count)
        } catch {
            XCTFail(error as! String)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
