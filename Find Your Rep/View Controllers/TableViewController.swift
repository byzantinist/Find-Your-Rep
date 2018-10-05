//
//  TableViewController.swift
//  Find Your Rep
//
//  Created by Eric Chiang on 7/5/17.
//  Copyright © 2017 Eric Chiang. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire



var myIndex = 0

class TableViewController: UITableViewController {
    
    let headers: HTTPHeaders = [
        "X-API-Key": "mxppcLKQTS3Cu2eMKrZsr2Kp3L795AIs2fc1jtCR"
    ]

    
    var senatorArray: [SenatorModel] = []
    
    func loadData() {
        //loadedData
        Alamofire.request(URL!, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                if let json = response.result.value {
                    let info = JSON(json)
                    //print(info["results"][0]["name"].stringValue)
                    //print(info["results"][1]["name"].stringValue)
                    //self.senators.append("\(info["results"][0]["name"].stringValue)")
                    //self.senators.append("\(info["results"][1]["name"].stringValue)")
                    //print(self.senators)
                   
                    let senator1 = SenatorModel(senatorModelName: info["results"][0]["name"].stringValue, senatorModelParty: info["results"][0]["party"].stringValue, senatorModelGender: info["results"][0]["gender"].stringValue )
                    let senator2 = SenatorModel(senatorModelName: info["results"][1]["name"].stringValue, senatorModelParty: info["results"][1]["party"].stringValue, senatorModelGender: info["results"][1]["gender"].stringValue )
                    
                
                    self.senatorArray.append(senator1)
                    self.senatorArray.append(senator2)
                    //print("You selected \(selectedValue)")
                     print(info["results"][0])
                    
                    
                    self.tableView.reloadData()
                    
                    
                }
            case .failure(let error):
                print(error)
            }
            
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                
               // var testjson = JSON(data: data)
            }
            
        }

    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        
        loadData()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        // #warning Incomplete implementation, return the number of rows
        return senatorArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "senatorCell", for: indexPath) as! SenatorCell
        
        let row = indexPath.row
        
            let senator = senatorArray[row]
            print(senator.senatorModelName)
            cell.senatorName.text = senator.senatorModelName
  //          cell.senatorState.text = senator.senatorModelName
        
        
        
        
  //      cell.senatorState.text = senator.senatorState
        cell.senatorParty.text = senator.senatorModelParty
        cell.senatorGender.text = senator.senatorModelGender

       
        
        
       
//        senatorCell.textLabel?.text = "Yay it's working!"
        //  cell.textLabel?.text = testing.senators[indexPath.row]
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "showSenator", sender: self)
    }
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }*/
}

class SenatorCell: UITableViewCell {
    
    @IBOutlet weak var senatorName: UILabel!
    @IBOutlet weak var senatorState: UILabel!
    @IBOutlet weak var senatorParty: UILabel!
    @IBOutlet weak var senatorGender: UILabel!
}


