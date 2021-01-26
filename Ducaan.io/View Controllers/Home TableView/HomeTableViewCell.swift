//
//  HomeTableViewCell.swift
//  Ducaan.io
//
//  Created by leyo babu on 26/01/21.
//  Copyright © 2021 leyo babu. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var menuItemsContainerView: UIView!
    @IBOutlet weak var menuItemImage: UIImageView!
    @IBOutlet weak var menuItemName: UILabel!
    @IBOutlet weak var menuItemQuantity: UILabel!
    @IBOutlet weak var menuItemOfferPrice: UILabel!
    @IBOutlet weak var menuItemPrice: UILabel!
    @IBOutlet weak var menuItemAddView: UIView!
    @IBOutlet weak var menuItemAdd: UIButton!
    @IBOutlet weak var menuItemAlreadyAddedView: UIView!
    @IBOutlet weak var menuItemDecrease: UIButton!
    @IBOutlet weak var menuItemIncrease: UIButton!
    @IBOutlet weak var menuItemCount: UILabel!
    @IBOutlet weak var noMenuItemText: UILabel!
    @IBOutlet weak var menuOfferView: UIView!
    @IBOutlet weak var menuOfferValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuItemAddView.layer.borderWidth = 1
        menuItemAddView.layer.borderColor = UIColor(hexFromString: "#146eb4").cgColor
        menuItemAddView.layer.cornerRadius = 5
        menuItemAlreadyAddedView.layer.borderWidth = 1
        menuItemAlreadyAddedView.layer.borderColor = UIColor(hexFromString: "#146eb4").cgColor
        menuItemAlreadyAddedView.layer.cornerRadius = 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func tappedMenuItemAdd(_ sender: UIButton) {
        
    }
    
    @IBAction func tappedMenuItemDecrease(_ sender: UIButton) {
    }
    
    @IBAction func tappedMenuItemIncrease(_ sender: UIButton) {
    }
    
    
}
