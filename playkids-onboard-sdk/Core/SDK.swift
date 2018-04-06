//
//  SDK.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 05/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

public final class SDK {
    public static func startSDK() {

        //Making requests
        let s = Requests()
        
        let requestMainURL = "https://s3.amazonaws.com/dev.bojack.pkds.it/pk4/r4v1/br/main.json"
        let requestContentURL = "https://s3.amazonaws.com/dev.bojack.pkds.it/pk4/r4v1/br/content.json"
        
        s.requestContent(requestURL: requestContentURL)
        s.requestMain(requestURL: requestMainURL)
    }
}
