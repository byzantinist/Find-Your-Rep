//
//  SenatorModel.swift
//  Find Your Rep
//
//  Created by Eric Chiang on 7/7/17.
//  Copyright © 2017 Eric Chiang. All rights reserved.
//

import UIKit

class SenatorModel: NSObject {
    var senatorModelName: String
    var senatorModelParty: String
    var senatorModelGender: String
    
    init(senatorModelName: String, senatorModelParty: String, senatorModelGender: String) {
        self.senatorModelName = senatorModelName
        self.senatorModelParty = senatorModelParty
        self.senatorModelGender = senatorModelGender
        
    }
    
}
