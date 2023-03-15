//
//  CustomCell.swift
//  indukfood
//
//  Created by seungbeom on 2023/02/06.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
