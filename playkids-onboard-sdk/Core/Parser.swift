//
//  Parser.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 06/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

internal class Parser {
    
    open func parseMain(Data: Any) {
        if let dictionary = Data as? [String: Any] {
            if let segments = dictionary["segments"] as? [[String: Any]]{
                print ("Main Segment Parse Succesfull")
                print (segments)
                
            }
        }
    }
    
    open func parseContent(Data: Any) {
        
    }
}
