//
//  ProductTableViewCell.swift
//  ProductSystem
//
//  Created by Luis Saravia on 7/27/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var categoryLabel: UILabel!
        @IBOutlet weak var priceLabel: UILabel!
        @IBOutlet weak var quantityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with product: Product) {
            nameLabel.text = product.productName
            categoryLabel.text = product.productCategory
            priceLabel.text = "Price: $\(product.productPrice)"
            quantityLabel.text = "Quantity: \(product.productQuantity)"
        }
}
