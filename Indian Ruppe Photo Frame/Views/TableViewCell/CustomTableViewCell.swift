//
//  CustomTableViewCell.swift
//  Indian Ruppe Photo Frame
//
//  Created by Alpesh on 06/12/16.
//  Copyright © 2016 Cousins Infotech. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
     var myLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        myLabel.backgroundColor = UIColor.yellow
        self.contentView.addSubview(myLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 20, width: 70, height: 40)
    }

}
