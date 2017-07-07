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

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
      var URL: String?
    
      let headers: HTTPHeaders = [
        "X-API-Key": "mxppcLKQTS3Cu2eMKrZsr2Kp3L795AIs2fc1jtCR"
    ]
   
    @IBOutlet weak var pickerSelector: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        

            }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pickerSelector?.delegate = self
        self.pickerSelector?.dataSource = self
        pickerData = ["Alabama",
                      "Alaska",
                      "Arizona",
                      "Arkansas",
                      "California",
                      "Colorado",
                      "Connecticut",
                      "Delaware",
                      "Florida",
                      "Georgia",
                      "Hawaii",
                      "Idaho",
                      "Illinois",
                      "Indiana",
                      "Iowa",
                      "Kansas",
                      "Kentucky",
                      "Louisiana",
                      "Maine",
                      "Maryland",
                      "Massachusetts",
                      "Michigan",
                      "Minnesota",
                      "Mississippi",
                      "Missouri",
                      "Montana",
                      "Nebraska",
                      "Nevada",
                      "New Hampshire",
                      "New Jersey",
                      "New Mexico",
                      "New York",
                      "North Carolina",
                      "North Dakota",
                      "Ohio",
                      "Oklahoma",
                      "Oregon",
                      "Pennsylvania",
                      "Rhode Island",
                      "South Carolina",
                      "South Dakota",
                      "Tennessee",
                      "Texas",
                      "Utah",
                      "Vermont",
                      "Virginia",
                      "Washington",
                      "West Virginia",
                      "Wisconsin",
                      "Wyoming"]

        let roshaan = USStates()
        
        let selectedValue = self.pickerData[self.pickerSelector.selectedRow(inComponent: 0)]
        
        /* Old code            guard let USState = selectedValue, let dictionaryWrap = roshaan.stateDictionary[USState] else {
         return
         }*/
        
        guard let dictionaryWrap = roshaan.stateDictionary[selectedValue] else {
            return
        }
        
        self.URL = "https://api.propublica.org/congress/v1/members/senate/\(dictionaryWrap)/current.json"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "showTable" {
                print("Transitioning")
                let tableViewController = segue.destination as! TableViewController
                tableViewController.URL = self.URL
            }
        }
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
}

