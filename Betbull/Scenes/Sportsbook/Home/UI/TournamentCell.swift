//
//  TournamentCell.swift
//  Betbull
//
//  Created by AryaOmnitalk MDA on 31/01/21.
//  Copyright © 2021 Betbull. All rights reserved.
//

import UIKit

class TournamentCell: UITableViewCell {
    
    @IBOutlet var lblOutcomesPrice1: UILabel!
    @IBOutlet var lblOutcomesName1: UILabel!
    
    @IBOutlet var lblOutcomesPrice2: UILabel!
    @IBOutlet var lblOutcomesName2: UILabel!
    
    @IBOutlet var lblOutcomesPrice3: UILabel!
    @IBOutlet var lblOutcomesName3: UILabel!
    
    @IBOutlet var lblStartTime: UILabel!
    @IBOutlet var lblEventName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
