//
//  DBModel.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 12/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

protocol DBModel{
    
    static func createTable(db: OpaquePointer?)
    static func populateTable(db: OpaquePointer?, data: [Any?])
    func readTable(db: OpaquePointer?, id: String)
    func delete(db: OpaquePointer?, id: String)
    
}
