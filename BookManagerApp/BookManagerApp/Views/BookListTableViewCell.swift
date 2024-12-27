//
//  BookListTableViewCell.swift
//  BookManagerApp
//
//  Created by Anjali on 28/12/24.
//

import UIKit

class BookListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var statusButton: UIButton!
    
    var onButtonTap: () -> Void = { }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func didTapStatusButton(_ sender: Any) {
        onButtonTap()
    }
    
}
