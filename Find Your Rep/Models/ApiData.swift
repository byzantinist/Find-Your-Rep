////
////  ApiData.swift
////  Find Your Rep
////
////  Created by Eric Chiang on 7/6/17.
////  Copyright © 2017 Eric Chiang. All rights reserved.
////
//
//import UIKit
//import SwiftyJSON
//import Alamofire
//import AlamofireImage
//import AlamofireNetworkActivityIndicator
//
//
//struct ApiData {
//   
//let headers: HTTPHeaders = [
//        "X-API-Key": "mxppcLKQTS3Cu2eMKrZsr2Kp3L795AIs2fc1jtCR"
//    ]
//
//
//    
//    let roshaan = USStates()
//
//   /// guard let USState = stateField.text, let dictionaryWrap = roshaan.stateDictionary[USState] else //{
//   // return
//   // }
//    
//    var URL = "https://api.propublica.org/congress/v1/members/senate/\(dictionaryWrap)/current.json"
//    
//    let test = ViewController()
//
//    Alamofire.request(URL, headers: headers).responseJSON { response in
//    
//    if let json = response.result.value {
//    let info = JSON(json)
//    print(info["results"][0]["name"].stringValue)
//    }
//    
//    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//    
//    var testjson = JSON(data: data)
//    }
//    
//    }
//
//}
