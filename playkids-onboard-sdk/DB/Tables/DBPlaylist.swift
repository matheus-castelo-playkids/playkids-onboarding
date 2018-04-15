//
//  Playlist.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 12/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation
import SQLite3

class DBPlaylist: DBModel{
    
    static func createTable(db: OpaquePointer?){
        
        sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Playlist (id TEXT PRIMARY KEY, def TEXT, name TEXT)", nil, nil, nil) == SQLITE_OK ? print("Playlist table created") : print("Error creating Playlist table")
    }
    
    static func populateTable(db: OpaquePointer?, data: [Any?]) {
        let playlistArray = data as! [Playlist]
//        print ("received PG's:\n\(pgArray)")
        
        var stmt: OpaquePointer?
        
        playlistArray.forEach{ pl in
            let id = pl.id as NSString
            let name = pl.name as NSString
            let def = pl.def as NSString
            
            print("\nSTARTED PLAYLIST INSERTION")
            
            let queryString = "INSERT INTO Playlist (id, name, def) VALUES (?,?,?)"
            sqlite3_prepare(db, queryString, -1, &stmt, nil) == SQLITE_OK ? print("Playlist Table prepared") : print ("Error preparing Playlist Table")
            
            sqlite3_bind_text(stmt, 1, id.utf8String, -1, nil) == SQLITE_OK ? print("ID Binding Successfull") : print ("Error binding ID")
            sqlite3_bind_text(stmt, 2, name.utf8String, -1, nil) == SQLITE_OK ? print("Name Binding Successfull") : print ("Error binding name")
            sqlite3_bind_text(stmt, 3, def.utf8String, -1, nil) == SQLITE_OK ? print("Def Binding Successfull") : print ("Error binding Def")
            
            sqlite3_step(stmt) == SQLITE_DONE ? print ("Playlist Insertion Successfull\n") : print("Error inserting Playlist: \(String(cString: sqlite3_errmsg(db)))\n")
            sqlite3_finalize(stmt)
        }
    }
    
    func readTable(db: OpaquePointer?, id: String) {
        
    }
    
    func delete(db: OpaquePointer?, id: String) {
        
    }
    
}
