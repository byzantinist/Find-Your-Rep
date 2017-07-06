//
//  ViewController.swift
//  Find Your Rep
//
//  Created by Eric Chiang on 7/5/17.
//  Copyright © 2017 Eric Chiang. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator


// API Key:
// mxppcLKQTS3Cu2eMKrZsr2Kp3L795AIs2fc1jtCR





class ViewController: UIViewController {

    let headers: HTTPHeaders = [
        "X-API-Key": "mxppcLKQTS3Cu2eMKrZsr2Kp3L795AIs2fc1jtCR"
    ]

    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var filterSelector: UITextField!
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {

        let roshaan = USStates()
        
        guard let USState = stateField.text, let dictionaryWrap = roshaan.stateDictionary[USState] else {
            return
        }
        
        var URL = "https://api.propublica.org/congress/v1/members/senate/\(dictionaryWrap)/current.json"
        
        Alamofire.request(URL, headers: headers).responseJSON { response in
            
            if let json = response.result.value {
                let info = JSON(json)
                print(info["results"][1]["name"].stringValue)
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                
                var testjson = JSON(data: data)
             }

        }
        
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

