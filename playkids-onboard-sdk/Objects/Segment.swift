//
//  Segment.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 06/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

struct Segment {

    let id: String
    let type: String
    let name: String
    
    init(id: String, type: String, name: String) {
        self.id   = id
        self.type = type
        self.name  = name
    }

}
