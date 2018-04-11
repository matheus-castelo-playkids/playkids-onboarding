//
//  Parser.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 06/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

internal class Parser {
    open func parse(Data: Any, ContentType: String) -> [Any?] {
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
                    return segArray
                }
            }
        } else if (ContentType == "Content") {
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
                    return groupsArray
                }
            }
        } else if (ContentType == "Assets"){
            if let dictionary = Data as? [String: Any] {
                let PLname = dictionary["name"] as! String
                var assetsArray = [Asset]()
                
                if let assets = dictionary["assets"] as? [[String: Any]]{
                    print("Assets parsing Successfull")
                    assets.forEach { newAsset in
                        let type = newAsset["type"] as! String
                        
                        if type == "video"{
                            let videoID = newAsset["id"] as! String
                            var name: String = ""
                            var desc: String = ""
                            var img: String = ""
                            let tagsArray = newAsset["tags"] as! [String]
                            
                            if let data = newAsset["data"] as? [String: Any]{
                                name = data["title"] as! String
                                desc = data["desc"] as! String
                                if let imgs = data["imgs"] as? [String: Any]{
                                    img = imgs["w"] as! String
                                }
                            }
                            
                            let newVideo = video()
                            newVideo.type = type
                            newVideo.id = videoID
                            newVideo.img = img
                            newVideo.name = name
                            newVideo.desc = desc
                            newVideo.tags = tagsArray
                            
                            /*print("\nvideo ID: \(newVideo.id)\nvideo name: \(newVideo.name)\nvideo img link: \(newVideo.img)\nvideo description: \(newVideo.desc)\nVideo tags:")
                            tagsArray.forEach{tag in
                                print(tag)
                            }*/
                            assetsArray.append(newVideo)
                            
                        } else if type == "pack" {
                            let gameID = newAsset["id"] as! String
                            var name: String = ""
                            var img: String = ""
                            let player = newAsset["player"] as! String
                            
                            if let data = newAsset["data"] as? [String: Any]{
                                name = data["name"] as! String
                                img = data["img"] as! String
                            }
                            
                            
                            let newGame = game()
                            newGame.type = type
                            newGame.id = gameID
                            newGame.name = name
                            newGame.img = img
                            newGame.player = player
//                            print("\nGame ID: \(newGame.id)\nGame name: \(newGame.name)\nGame img link: \(newGame.img)\nGame type: \(newGame.player)")
                            
                            assetsArray.append(newGame)
                        } else if type == "story" {
                            let bookID = newAsset["id"] as! String
                            var name: String = ""
                            var desc: String = ""
                            var img: String = ""
                            let tagsArray = newAsset["tags"] as! [String]
                            var format: String = ""
                            var lang: String = ""
                            
                            let newBook = books()
                            if let data = newAsset["data"] as? [String: Any]{
                                format = data["format"] as! String
                                if let loc = data["loc"] as? [[String: Any]] {
                                    loc.forEach{ newLoc in
                                        lang = newLoc["lang"] as! String
                                        name = newLoc["title"] as! String
                                        desc = newLoc["synopsis"] as! String
                                        img = newLoc["thumbnail"] as! String
                                    }
                                }
                            }
                            
                            newBook.type = type
                            newBook.id = bookID
                            newBook.name = name
                            newBook.desc = desc
                            newBook.img = img
                            newBook.tags = tagsArray
                            newBook.format = format
                            newBook.lang = lang
                            
                            /*print("\nBook ID: \(newBook.id)\nBook name: \(newBook.name)\nBook img link: \(newBook.img)\nBook description: \(newBook.desc)\nBook format: \(newBook.format)\nBook language: \(newBook.lang)\nVideo tags:")
                             tagsArray.forEach{tag in
                                print(tag)
                             }*/
                            
                            assetsArray.append(newBook)
                        }
                    }
                }
                let PLReturn = [PLname,assetsArray] as [Any]
//                print("\nArray Returned from second playlist parsing:\n \(PLReturn)\n")
                return PLReturn
            }
        }
        return [nil]
    }
}

