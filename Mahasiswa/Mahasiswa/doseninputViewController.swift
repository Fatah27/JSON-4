//
//  doseninputViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class doseninputViewController: UIViewController {
    @IBOutlet weak var inputNim: UITextField!
    @IBOutlet weak var inputNama: UITextField!
    @IBOutlet weak var inputMatKul: UITextField!
    @IBOutlet weak var inputAlamat: UITextField!
    @IBOutlet weak var inputHp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnAdd(_ sender: Any) {
        let nNim = inputNim.text!
        let nNama = inputNama.text!
        let nMatKul = inputMatKul.text!
        let nAlamat = inputAlamat.text!
        let nHp = inputHp.text!
        if ((nNim.isEmpty) || (nNama.isEmpty) || (nMatKul.isEmpty) || (nAlamat.isEmpty) || (nHp.isEmpty)) {
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            let params = ["nim" : nNim, "nama_dosen" : nNama, "mata_kuliah" : nMatKul, "alamat" : nAlamat, "hp" : nHp]
            print (params)
            
            let url = "http://localhost/MahasiswaServer/index.php/Api/daftar"
            
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


