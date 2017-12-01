//
//  dosenTableViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class dosenTableViewController: UITableViewController {
    var nipSelected:String?
    var nimSelected:String?
    var namaSelected:String?
    var matKulSeleceted:String?
    var alamatSelected:String?
    var hpSelected:String?
    
    var Dosen = [dosen]()
    var arr = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/MahasiswaServer/index.php/Api/getDosen").responseJSON{ (responseData) -> Void in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDosen", for: indexPath) as! dosenTableViewCell
        var dict = arr[indexPath.row]
        cell.nama.text = dict["nama_dosen"] as? String
        cell.nim.text = dict["nim"] as? String

        // Configure the cell...

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Row \(indexPath.row)selected")
        
        let task = arr[indexPath.row]
        nipSelected = task["nip"] as? String
        nimSelected = task["nim"] as? String
        namaSelected = task["nama_dosen"] as? String
        matKulSeleceted = task["mata_kuliah"] as? String
        alamatSelected = task["alamat"] as? String
        hpSelected = task["hp"] as? String

        performSegue(withIdentifier: "pass", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pass"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! dosendetailViewController
                let value = arr[indexPath.row]
                controller.passNip = value["nip"] as? String
                controller.passNim = value["nim"] as? String
                controller.passNama = value["nama_dosen"] as? String
                controller.passMatKul = value["mata_kuliah"] as? String
                controller.passAlamat = value["alamat"] as? String
                controller.passhp = value["hp"] as? String
            }
        }
    }
}
