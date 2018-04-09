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
//                        print ("Segment ID: \(seg.id)")
//                        print ("Segment Type: \(seg.type)")
//                        print ("Segment Name: \(seg.name)")
                        segArray.append(seg)
                    }
                }
            }
        } else if (ContentType == "Content"){
            if let dictionary = Data as? [String: Any] {
                if let groups = dictionary["groups"] as? [[String: Any]]{
                    print("Groups Parsing Succesfull")
//                    print(groups)
                    
                    var groupsArray = [PlaylistGroup]()
                    groups.forEach { group in
                        if let lists = group["lists"] as? [[String: Any]]{
                            print("Lists Parsing Successfull")
//                            print(lists)
                            
                            var listArray = [Playlist]()
                            lists.forEach{ list in
                                let newList = Playlist(id: list["id"] as! String,
                                                       def: list["def"] as! String)
//                                print("List ID: \(newList.id)")
//                                print("List def: \(newList.def)")
                                
                                listArray.append(newList)
                            }
                            let playlistGroup = PlaylistGroup(id: group["id"] as! String,
                                                              name: group["name"] as! String,
                                                              headline: group["headline"] as! String,
                                                              desc: group["description"] as! String,
                                                              playlists: listArray)
//                            print("----------------------------------------------------------------------")
//                            print("Playlist ID: \(playlistGroup.id)")
//                            print("Playlist name: \(playlistGroup.name)")
//                            print("Playlist headline: \(playlistGroup.headline)")
//                            print("Playlist description: \(playlistGroup.desc)")
                            
                            groupsArray.append(playlistGroup)
                        }
                    }
                }
            }
        }
    }
}

