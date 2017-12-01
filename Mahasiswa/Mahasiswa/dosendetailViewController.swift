//
//  dosendetailViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit

class dosendetailViewController: UIViewController {
    @IBOutlet weak var nip: UILabel!
    @IBOutlet weak var nim: UILabel!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var matKul: UILabel!
    @IBOutlet weak var alamat: UILabel!
    @IBOutlet weak var hp: UILabel!
    
    var passNip:String?
    var passNim:String?
    var passNama:String?
    var passMatKul:String?
    var passAlamat:String?
    var passhp:String?
    
    
    override func viewDidLoad() {
        nip.text = passNip!
        nim.text = passNim!
        nama.text = passNama!
        matKul.text = passMatKul!
        alamat.text = passAlamat!
        hp.text = passhp!
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
