//
//  TableViewCell.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 20.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabelField: UILabel!
    @IBOutlet weak var districtLabelField: UILabel!
    @IBOutlet weak var genderLabelField: UILabel!
    @IBOutlet weak var ageLabelField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
