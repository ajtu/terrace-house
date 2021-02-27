//
//  MemberTableViewCell.swift
//  
//
//  Created by Alvin Tu on 5/31/20.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    @IBOutlet var englishNameLabel: UILabel!
    @IBOutlet var professionLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var japaneseNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var memberViewModel: HouseMemberViewModel! {
        didSet {
            englishNameLabel?.text = memberViewModel.englishnameLabelString
            japaneseNameLabel?.text = memberViewModel.japaneseNameLabelString
            ageLabel?.text = memberViewModel.ageLabelString
            professionLabel?.text = memberViewModel.professionLabelString
        }
    }
    
}
