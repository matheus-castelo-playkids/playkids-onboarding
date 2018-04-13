//
//  PlaylistGroup.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 12/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation
import SQLite3

class DBPlaylistGroup: DBModel{
    
    static func createTable(db: OpaquePointer?){
        
        sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS PlaylistGroup (id TEXT PRIMARY KEY, name TEXT, headline TEXT, description TEXT)", nil, nil, nil) == SQLITE_OK ? print("Playlist Group table created") : print("Error creating Playlist Group table") 
    }
    
    static func populateTable(db: OpaquePointer?, data: [Any?]) {
        let pgArray = data as! [PlaylistGroup]
//        print ("received PG's:\n\(pgArray)")
        
        var stmt: OpaquePointer?
        
        let queryString = "INSERT INTO PlaylistGroup (id, name, headline, description) VALUES (?,?,?,?)"
        sqlite3_prepare(db, queryString, -1, &stmt, nil) == SQLITE_OK ? print("PG Table prepared") : print ("Error preparing PG Table")
        
        pgArray.forEach{ pg in
            let id = pg.id as NSString
            let name = pg.name as NSString
            let headline = pg.headline as NSString
            let description = pg.desc as NSString
            let playlists = pg.playlists as[Any?]
            
            print("\nSTARTED PLAYLIST GROUPS INSERTION")
            
            sqlite3_bind_text(stmt, 1, id.utf8String, -1, nil) == SQLITE_OK ? print("ID Binding Successfull") : print ("Error binding ID")
            sqlite3_bind_text(stmt, 2, name.utf8String, -1, nil) == SQLITE_OK ? print("Name Binding Successfull") : print ("Error binding name")
            sqlite3_bind_text(stmt, 3, headline.utf8String, -1, nil) == SQLITE_OK ? print("headline Binding Successfull") : print ("Error binding headline")
            sqlite3_bind_text(stmt, 4, description.utf8String, -1, nil) == SQLITE_OK ? print("Description Binding Successfull") : print ("Error binding Description")
            
            sqlite3_step(stmt) == SQLITE_DONE ? print ("PG Insertion Successfull\n") : print("Error inserting PG: \(String(cString: sqlite3_errmsg(db)))\n")
            sqlite3_finalize(stmt)
            
            DBPlaylist.populateTable(db: db, data: playlists)
        }
        
    }
    
    func readTable(db: OpaquePointer?, id: String) {
        
    }
    
    func delete(db: OpaquePointer?, id: String) {
        
    }
    
}
