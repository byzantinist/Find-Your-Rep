//
//  TableViewController.swift
//  Find Your Rep
//
//  Created by Eric Chiang on 7/5/17.
//  Copyright © 2017 Eric Chiang. All rights reserved.
//

import UIKit


var myIndex = 0

class TableViewController: UITableViewController {

    var test2 = [String]()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        // #warning Incomplete implementation, return the number of rows
         print(testing.senators)
        return 2
       
    }
    let testing = ViewController()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let senatorCell = tableView.dequeueReusableCell(withIdentifier: "senatorCell", for: indexPath)
        print(testing.senators)
//        senatorCell.textLabel?.text = "Yay it's working!"
        //  cell.textLabel?.text = testing.senators[indexPath.row]
            return senatorCell
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


