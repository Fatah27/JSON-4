//
//  matkulinputViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class matkulinputViewController: UIViewController {
    @IBOutlet weak var inputMatkul: UITextField!
    @IBOutlet weak var inputJumlah: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnAdd(_ sender: Any) {
        let nMatkul = inputMatkul.text!
        let nJumlah = inputJumlah.text!
        if ((nMatkul.isEmpty) || (nJumlah.isEmpty)) {
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            let params = ["nama_matkul" : nMatkul, "jumlah_sks" : nJumlah]
            print (params)
            
            let url = "http://localhost/MahasiswaServer/index.php/matKul/daftar"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    let alertWarning = UIAlertController(title: "Congrats", message: "Data berhasil disimpan", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion: nil)
                    
                }
                
            })
        }
    }
}


