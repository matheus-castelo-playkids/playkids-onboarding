//
//  PlaylistGroup.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 09/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

struct PlaylistGroup {
    
    var id: String
    var name: String
    var headline: String
    var desc: String
    var playlists: [Playlist]
    
    init(id: String, name: String, headline: String, desc: String, playlists: [Playlist]){
        self.id = id
        self.name = name
        self.headline = headline
        self.desc = desc
        self.playlists = playlists
    }
}
