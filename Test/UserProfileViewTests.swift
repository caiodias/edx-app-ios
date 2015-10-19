//
//  UserProfileViewTests.swift
//  edX
//
//  Created by Michael Katz on 9/28/15.
//  Copyright © 2015 edX. All rights reserved.
//

import XCTest
import edX

class UserProfileViewTests: SnapshotTestCase {

    let networkManager = MockNetworkManager(baseURL: NSURL(string: "www.example.com")!)
    var profile: UserProfile!
    
    override func setUp() {
        super.setUp()
        
        let profileJSON = JSON(["username": "test", "language":"de", "country": "ch"])
        profile = UserProfile(json: profileJSON)
    }
    
    
    func testSnapshotContent() {
        let env = UserProfileViewController.Environment(networkManager: networkManager)
        let controller = UserProfileViewController(username: "test", environment: env)
        inScreenNavigationContext(controller, action: { () -> () in
            assertSnapshotValidWithContent(controller.navigationController!)
        })
        
    }
}