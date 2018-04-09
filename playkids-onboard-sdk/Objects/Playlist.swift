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
    
    init(id: String, def: String){
        self.id = id
        self.def = def
    }
}
