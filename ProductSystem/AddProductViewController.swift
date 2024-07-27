//
//  AddProductViewController.swift
//  ProductSystem
//
//  Created by Luis Saravia on 7/15/24.
//

import UIKit
protocol AddProductViewControllerDelegate: AnyObject {
    func addProductViewController(_ controller: AddProductViewController, didAddProduct product: Product)
}

class AddProductViewController: UIViewController {
    var products : Product?
    weak var delegate: AddProductViewControllerDelegate?
    init?(product: Product, coder: NSCoder)
    {
        self.products = product
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.products = Product(productName: "", productCategory: "", productQuantity: 0, productPrice: 0.0)
        super.init(coder: coder)
    }
    @IBOutlet var productLabel: UITextField!
    @IBOutlet var categoryLabel: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var quantityTextField: UITextField!
    @IBOutlet var productWarning: UILabel!
    @IBOutlet var categoryWarning: UILabel!
    @IBOutlet var priceWarning: UILabel!
    @IBOutlet var quantityWarning: UILabel!
    var ViewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("We should be here")
        hideWarnings()
    }
    func showAlert(on viewController: UIViewController, title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK tapped")
        }
        alertController.addAction(okAction)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel tapped")
        }
        alertController.addAction(cancelAction)
        
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func hideWarnings() {
        productWarning.isHidden = true
        categoryWarning.isHidden = true
        priceWarning.isHidden = true
        quantityWarning.isHidden = true
    }
    
    func labelWarnings() {
        // Check product name
        if let productName = productLabel.text, productName.isEmpty {
            productWarning.text = "Product name is required."
            productWarning.isHidden = false
        } else {
            productWarning.isHidden = true
        }
        
        // Check product category
        if let productCategory = categoryLabel.text, productCategory.isEmpty {
            categoryWarning.text = "Category is required."
            categoryWarning.isHidden = false
        } else {
            categoryWarning.isHidden = true
        }
        
        // Check product price
        if let priceText = priceTextField.text, let _ = Double(priceText) {
            priceWarning.isHidden = true
        } else {
            priceWarning.text = "Valid price is required."
            priceWarning.isHidden = false
        }
        
        // Check product quantity
        if let quantityText = quantityTextField.text, let _ = Int(quantityText) {
            quantityWarning.isHidden = true
        } else {
            quantityWarning.text = "Valid quantity is required."
            quantityWarning.isHidden = false
        }
    }
    fileprivate func clear_text() {
        productLabel.text = ""
        categoryLabel.text = ""
        priceTextField.text = ""
        quantityTextField.text = ""
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        guard let productName = productLabel.text, !productName.isEmpty,
                      let productCategory = categoryLabel.text, !productCategory.isEmpty,
                      let priceText = priceTextField.text, let productPrice = Double(priceText),
                      let quantityText = quantityTextField.text, let productQuantity = Int(quantityText) else {
                    
                    showAlert(on: self, title: "Invalid Input", message: "Please enter valid product details.")
                    labelWarnings()
                    clear_text()
                    return
                }

                let newProduct = Product(productName: productName, productCategory: productCategory, productQuantity: productQuantity, productPrice: productPrice)
                delegate?.addProductViewController(self, didAddProduct: newProduct)

                clear_text()
                hideWarnings()
                showAlert(on: self, title: "Success!", message: "Item has been added")
                print(productName, productCategory, productPrice, productQuantity)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addProduct" {
                    if let destinationVC = segue.destination as? ViewController, let product = products {
                        destinationVC.productList.append(product)
                    }
                }
    }
    
    
}
