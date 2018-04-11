//
//  SDK.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 05/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

public final class SDK {
    
    //Setting Variables
    static var segArray = [Segment]()
    static var mutablePL = Playlist(id: "", def: "")
    static var groupsArray = [PlaylistGroup]()
    static let s = Requests()
    
    public static func startSDK() {

        //Making requests
        let requestMainURL = "https://s3.amazonaws.com/dev.bojack.pkds.it/pk4/r4v1/br/main.json"
        let requestContentURL = "https://s3.amazonaws.com/dev.bojack.pkds.it/pk4/r4v1/br/content.json"
        
        let CTmain: String = "Main"
        s.request(requestURL: requestMainURL, contentType: CTmain) { (completion : Any) in
            let answerMain = completion
            
            segArray = parse(Data: answerMain, ContentType: CTmain) as! [Segment]
        }
        
        let CTContent: String = "Content"
        
        s.request(requestURL: requestContentURL, contentType: CTContent) { (completion : Any) in
            let answerContent = completion
            
            groupsArray = parse(Data: answerContent, ContentType: CTContent) as! [PlaylistGroup]
        }
    }
    
    public static func parse(Data: Any, ContentType: String) -> [Any?] {
        
        let p = Parser()
        var segArray = [Segment]()
        var groupsArray = [PlaylistGroup]()
        var assetsArray = [Any?]()
        let CTAssets = "Assets"
        
        print ("Requested parsing for \(ContentType)")
        let answer = p.parse(Data: Data, ContentType: ContentType)
        
        if ContentType == "Main"{
            segArray = answer as! [Segment]
            return segArray
        } else if ContentType == "Content"{
            groupsArray = answer as! [PlaylistGroup]
            
            groupsArray.forEach { group in
                group.playlists.forEach { pl in
                    let def = pl.def
                    let defLink = "https://s3.amazonaws.com/dev.bojack.pkds.it/pk4/r4v1/br/\(def)"
                    
                    mutablePL = pl
                    
                    requestAndParseVideo(requestURL: defLink, ContentType: CTAssets)
                }
            }
            return groupsArray
        } else if ContentType == "Assets"{
            assetsArray = answer
            return assetsArray
        }
        return [nil]
    }
    
    public static func requestAndParseVideo(requestURL: String, ContentType: String){ //} -> [Any?] {
        var newInfo = [Any?]()
        
        s.request(requestURL: requestURL, contentType: ContentType){ (completion: Any) in
            let answerVideo = completion
            newInfo = parse(Data: answerVideo, ContentType: ContentType)
            updatePlaylistInfo(newInfo: newInfo)
        }
    }
    
    public static func updatePlaylistInfo(newInfo: [Any?]){
        let name = newInfo[0] as! String
        let assets = newInfo[1] as! [Asset]
        
        mutablePL.update(nameSent: name, assetsSent: assets)
        
        print("\nPlaylist ID:\(mutablePL.id)\nPlaylist Name:\(mutablePL.name)\nPlaylist def:\(mutablePL.def)\nPlaylist assets:\n\(mutablePL.assets)")
    }
}
