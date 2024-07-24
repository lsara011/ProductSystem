//
//  ViewController.swift
//  ProductSystem
//
//  Created by Luis Saravia on 7/11/24.
//

import UIKit

class ViewController: UIViewController {
    var products :  Product
    var productList : [Product] = []
    init?(coder: NSCoder, products: Product, productList: [Product], whiteView: UIView!) {
            self.products = products
            self.whiteView = whiteView
            super.init(coder: coder)
        }

        required init?(coder: NSCoder) {
            self.products = Product(productName: "", productCategory: "", productQuantity: 0, productPrice: 0.0)
            self.whiteView = UIView()
            super.init(coder: coder)
        }
    
    
    @IBOutlet var whiteView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        whiteView.layer.cornerRadius = 15
        print("THIS SHOULD DO SOMETHING")
        if productList.isEmpty{
            print("productList is Empty")
        }
        else{
            for product in productList{
                print(product.productCategory, product.productName, product.productPrice,
                      product.productQuantity)
            }
        }
    }

    @IBAction func unwindToMainSegue(_ sender: UIButton) {
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        print("AddButton Pressed")
    }
    
    @IBAction func removePressed(_ sender: UIButton) {
        print("RemoveButton Pressed")
    }
    
    
    @IBAction func seeAllPressed(_ sender: UIButton) {
        print("SeeAllButton Pressed")
        if !productList.isEmpty{
            for product in productList{
                print(product.productName)
            }
        }
    }
    
    
}
