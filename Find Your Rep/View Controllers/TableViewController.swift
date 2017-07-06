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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print(testing.senators)
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
    
    

