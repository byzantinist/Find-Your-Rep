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

    

    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var filterSelector: UITextField!
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
    }
    
    let headers: HTTPHeaders = [
        "X-API-Key": "mxppcLKQTS3Cu2eMKrZsr2Kp3L795AIs2fc1jtCR"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //var abbreviation = stateField.text!
        var abbreviation = "Illinois"
        let roshaan = USStates()
        
        var URL = "https://api.propublica.org/congress/v1/members/senate/\(roshaan.statesDictionary[abbreviation]!)/current.json"
        print(abbreviation)
        print(URL)
        Alamofire.request(URL, headers: headers).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                print("Am I working")
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                print("I am NOT working!)")
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

