//
//  JSonService.swift
//  nuevoIOSProject
//
//  Created by Habib Ghafarzadeh on 1/8/1398 AP.
//  Copyright © 1398 nuevo. All rights reserved.
//

import Foundation

class JSonService {
    var returnObj: AnyObject? = nil
    public func callJSonSyncService(serviceurl: String, serviceName: String, args: AnyObject?, finished: @escaping ((Data)->Void)) {
        
        return callStreamSyncService(Serviceurl: serviceurl, ServiceName: serviceName, Args: args, finished: { isSuccess in
            finished(isSuccess)
        })
    }
    
    public func callStreamSyncService(Serviceurl: String, ServiceName: String, Args: AnyObject?, finished: @escaping ((Data)->Void)) {
        
        let urlString = Serviceurl + ServiceName
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 60
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {                
                if response != nil {
                    let httpResponse = response as! HTTPURLResponse
                    print("response code = \(httpResponse.statusCode)")
                    if httpResponse.statusCode == 200{
                        self.returnObj = try JSONSerialization.jsonObject(with: data!) as AnyObject
                        
                        finished(data as! Data)
                    }else if httpResponse.statusCode == 500 {
                        
                    }else {
                        
                    }
                }else {

                    
                }
            } catch {
                DispatchQueue.main.async {

                }
            }
        })
        task.resume()
    }
}

//Alamofire Or URLSession
