//
//  Segment.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 12/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation
import SQLite3

class DBSegment: DBModel{
    
    static func createTable(db: OpaquePointer?){
    
        sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS Segments (id TEXT PRIMARY KEY, name TEXT, type TEXT)", nil, nil, nil) == SQLITE_OK ? print("Segment table created") : print("Error creating segment table")
    }
    
    static func populateTable(db: OpaquePointer?, data: [Any?]) {
        let segArray = data as! [Segment]
//        print ("received segments:\n\(segArray)")
        
        var stmt: OpaquePointer?
        
        let queryString = "INSERT INTO Segments (id, name, type) VALUES (?,?,?)"
        sqlite3_prepare(db, queryString, -1, &stmt, nil) == SQLITE_OK ? print("DB prepared") : print ("Error preparing DB")
        
        segArray.forEach{ segment in
            let id = segment.id as NSString
            let name = segment.name as NSString
            let type = segment.type
            
            print("\nSTARTED SEGMENT INSERTION")
            
            sqlite3_bind_text(stmt, 1, id.utf8String, -1, nil) == SQLITE_OK ? print("ID Binding Successfull") : print ("Error binding ID")
            sqlite3_bind_text(stmt, 2, name.utf8String, -1, nil) == SQLITE_OK ? print("Name Binding Successfull") : print ("Error binding name")
            sqlite3_bind_text(stmt, 3, type, -1, nil) == SQLITE_OK ? print("Type Binding Successfull") : print ("Error binding type")
            
            sqlite3_step(stmt) == SQLITE_DONE ? print ("Segment Insertion Successfull\n") : print("Error inserting segment: \(String(cString: sqlite3_errmsg(db)))\n")
            sqlite3_finalize(stmt)
            
        }
    }
    
    func readTable(db: OpaquePointer?, id: String) {
        
    }
    
    func delete(db: OpaquePointer?, id: String) {
        
    }
    
}
