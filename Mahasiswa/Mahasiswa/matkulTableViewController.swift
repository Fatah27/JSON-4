//
//  matkulTableViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class matkulTableViewController: UITableViewController {
    var idSelected:String?
    var matkulSelected:String?
    var jumlahSelected:String?
    
    var Matkul = [matkul]()
    var arr = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/MahasiswaServer/index.php/matKul/getMatkul").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.arr = resData as! [[String:AnyObject]]
                }
                if self.arr.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMatkul", for: indexPath) as! matkulTableViewCell
        var dict = arr[indexPath.row]
        cell.matkul.text = dict["nama_matkul"] as? String
        cell.jumlah.text = dict["jumlah_sks"] as? String
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Row \(indexPath.row)selected")
        
        let task = arr[indexPath.row]
        idSelected = task["id_matkul"] as? String
        matkulSelected = task["nama_matkul"] as? String
        jumlahSelected = task["jumlah_sks"] as? String
        performSegue(withIdentifier: "passMatkul", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passMatkul"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! matkuldetailViewController
                let value = arr[indexPath.row]
                controller.passMatKul = value["nama_matkul"] as? String
                controller.passJumlah = value["jumlah_sks"] as? String
                controller.passId = value["id_matkul"] as? String
            }
        }
    }
}

