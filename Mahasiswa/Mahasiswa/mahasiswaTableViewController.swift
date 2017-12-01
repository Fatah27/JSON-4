//
//  mahasiswaTableViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class mahasiswaTableViewController: UITableViewController {
    var nimSelected:String?
    var namaSelected:String?
    var jurusanSelected:String?
    var nilaiSelected:String?
    var alamatSelected:String?
    
    var Mahasiswa = [mahasiswa]()
    var arr = [[String: AnyObject]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/MahasiswaServer/index.php/mahasiswa/getMahasiswa").responseJSON{ (responseData) -> Void in
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMahasiswa", for: indexPath) as! mahasiswaTableViewCell
        var dict = arr[indexPath.row]
        cell.nama.text = dict["nama_mahasiswa"] as? String
        cell.nim.text = dict["nim"] as? String
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Row \(indexPath.row)selected")
        
        let task = arr[indexPath.row]
        nimSelected = task["nim"] as? String
        namaSelected = task["nama_mahasiswa"] as? String
        jurusanSelected = task["jurusan"] as? String
        nilaiSelected = task["nilai"] as? String
        alamatSelected = task["alamat"] as? String
        
        performSegue(withIdentifier: "passMahasiswa", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passMahasiswa"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! mahasiswadetailViewController
                let value = arr[indexPath.row]
                controller.passNim = value["nim"] as? String
                controller.passNama = value["nama"] as? String
                controller.passJurusan = value["jurusan"] as? String
                controller.passNilai = value["nilai"] as? String
                controller.passAlamat = value["alamat"] as? String
            }
        }
    }
}

