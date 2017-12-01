//
//  mahasiswadetailViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit

class mahasiswadetailViewController: UIViewController {
    @IBOutlet weak var nim: UILabel!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var jurusan: UILabel!
    @IBOutlet weak var nilai: UILabel!
    @IBOutlet weak var alamat: UILabel!
    
    var passNim:String?
    var passNama:String?
    var passJurusan:String?
    var passNilai:String?
    var passAlamat:String?
    
    override func viewDidLoad() {
        nim.text = passNim!
        nama.text = passNama!
        jurusan.text = passJurusan!
        nilai.text = passNilai!
        alamat.text = passAlamat!
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
