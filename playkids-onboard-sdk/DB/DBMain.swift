//
//  DBMain.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 12/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation
import SQLite3

internal class DBMain {
    
    var db: OpaquePointer?
    
    open func startDB(segArray: [Segment], pgArray: [PlaylistGroup]){
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("catalogDatabase.sqlite")
        
        sqlite3_open(fileURL.path, &db) == SQLITE_OK ? print("DB Okay") : print ("Error opening DB") /*{
            print("Error opening the database")
        }*/
        
        DBSegment.createTable(db: db)
        DBPlaylist.createTable(db: db)
        DBPlaylistGroup.createTable(db: db)
        
        DBSegment.populateTable(db: db, data: segArray)
        DBPlaylistGroup.populateTable(db: db, data: pgArray)
    }
}
