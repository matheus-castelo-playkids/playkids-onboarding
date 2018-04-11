//
//  Playlist.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 09/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

struct Playlist {
    var id: String
    var def: String
    var name: String = ""
    var assets = [Asset]()
    
    init(id: String, def: String){
        self.id = id
        self.def = def
    }
    
    mutating func update (nameSent: String, assetsSent: [Asset]){
        name = nameSent
        assets = assetsSent
    }
}
