//
//  modifyViewController.swift
//  ProductSystem
//
//  Created by Luis Saravia on 7/26/24.
//

import UIKit

class modifyViewController: UIViewController {
    @IBOutlet var pickerView: UIPickerView!
    var productList : [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print(productList)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
