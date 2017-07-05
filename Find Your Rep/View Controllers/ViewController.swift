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
        print("This works. Yay!")

        var abbreviation = "Illinois"
        let roshaan = USStates()
        
        var URL = "https://api.propublica.org/congress/v1/members/senate/\(roshaan.stateDictionary[abbreviation]!)/current.json"
        print(abbreviation)
        print(URL)
        print(stateField.text)
        
        var secondtest = roshaan.stateDictionary[stateField.text!]
        print(secondtest)
        print("I hope it worked!")
        
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
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

