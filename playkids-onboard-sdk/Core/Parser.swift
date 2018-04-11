//
//  Parser.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 06/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

internal class Parser {

    open func parse(Data: Any, ContentType: String) {
        if (ContentType == "Main"){
            if let dictionary = Data as? [String: Any] {
                if let segments = dictionary["segments"] as? [[String: Any]]{
                    print ("Main Segment Parse Succesfull")
    //                print (segments)
                    
                    var segArray = [Segment]()
                    segments.forEach { segment in
                        let seg = Segment(id: segment["id"] as! String,
                                          type: segment["name"] as! String,
                                          name: segment["type"] as! String)
                        print ("ID: \(seg.id)")
                        print ("Type: \(seg.type)")
                        print ("Name: \(seg.name)")
                        segArray.append(seg)
                    }
                }
            }
        } else if (ContentType == "Content"){
        
        }
    }
}
