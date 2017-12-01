//
//  matkulTableViewCell.swift
//  Mahasiswa
//
//  Created by FatahKhair on 11/23/17.
//  Copyright © 2017 Nando Septian Husni. All rights reserved.
//

import UIKit

class matkulTableViewCell: UITableViewCell {
    @IBOutlet weak var matkul: UILabel!
    @IBOutlet weak var jumlah: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
