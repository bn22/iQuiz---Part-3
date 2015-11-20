//
//  subjectCell.swift
//  iQuiz Part1
//
//  Created by Bruce Ng on 11/3/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import UIKit

class subjectCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var title: String = "" {
        didSet {
            if (title != oldValue) {
                titleLabel.text = title
            }
        }
    }
    
    var descript: String = "" {
        didSet {
            if (descript != oldValue) {
                descriptLabel.text = descript
            }
        }
    }
    
    var subject: String = "" {
        didSet {
            if (subject != oldValue) {
                subjectLabel.text = subject
            }
        }
    }
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
}
