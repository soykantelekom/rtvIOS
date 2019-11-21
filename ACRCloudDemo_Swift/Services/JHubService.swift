//
//  JHubService.swift
//  nuevoIOSProject
//
//  Created by Habib Ghafarzadeh on 1/8/1398 AP.
//  Copyright © 1398 nuevo. All rights reserved.
//

import Foundation

let baseUrl = "https://jsonplaceholder.typicode.com"

class JHubService: JSonService {
    
    func photosList(finished: @escaping ((Data)->Void)) {

        callJSonSyncService(serviceurl: baseUrl, serviceName: "/photos", args: nil, finished: { isSuccess in
            finished(isSuccess)
        })
    }
    
    func comments(postid: Int, finished: @escaping ((Data)->Void)) {
        callJSonSyncService(serviceurl: baseUrl, serviceName: "/comments?postId=\(postid)", args: nil, finished: { isSuccess in
            finished(isSuccess)
        })
    }
}
