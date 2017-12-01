//
//  mahasiswainputViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class mahasiswainputViewController: UIViewController {
    @IBOutlet weak var inputNama: UITextField!
    @IBOutlet weak var inputJurusan: UITextField!
    @IBOutlet weak var inputNilai: UITextField!
    @IBOutlet weak var inputAlamat: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnAdd(_ sender: Any) {
        let nNama = inputNama.text!
        let nJurusan = inputJurusan.text!
        let nNilai = inputNilai.text!
        let nAlamat = inputAlamat.text!
        if ((nNama.isEmpty) || (nJurusan.isEmpty) || (nNilai.isEmpty) || (nAlamat.isEmpty)) {
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            let params = ["nama_mahasiswa" : nNama, "jurusan" : nJurusan, "nilai" : nNilai, "alamat" : nAlamat]
            print (params)
            
            let url = "http://localhost/MahasiswaServer/index.php/mahasiswa/daftar"
            
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



