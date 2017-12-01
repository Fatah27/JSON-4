//
//  matkuldetailViewController.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit

class matkuldetailViewController: UIViewController {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var matKul: UILabel!
    @IBOutlet weak var jumlah: UILabel!
    
    var passId:String?
    var passMatKul:String?
    var passJumlah:String?
    
    override func viewDidLoad() {
        id.text = passId!
        matKul.text = passMatKul!
        jumlah.text = passMatKul!
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
