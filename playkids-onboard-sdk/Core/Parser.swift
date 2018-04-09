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
//                print (segments)
                let segCount: Int = segments.count
                
                var segArray = [Segment]()
                for i in 0...(segCount - 1){
                    let actualSeg = segments[i]
                    let seg = Segment()
                    seg.id = actualSeg["id"] as! String
                    seg.name = actualSeg["name"] as! String
                    seg.type = actualSeg["type"] as! String
                    
                    segArray.append(seg)
                }
            }
        }
    }
    
    open func parseContent(Data: Any) {
        
    }
}
