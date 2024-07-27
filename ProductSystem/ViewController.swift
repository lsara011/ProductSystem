import UIKit

class ViewController: UIViewController {
    var productList: [Product] = []{
        didSet {
            saveProductList()
        }
    }
    
    @IBOutlet var whiteView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProductList()
        whiteView.layer.cornerRadius = 15
    }
    @IBAction func addPressed(_ sender: UIButton) {
        print("AddButton Pressed")

    }
    
    @IBAction func removePressed(_ sender: UIButton) {
        print("RemoveButton Pressed")
    }
    
    
    @IBAction func seeAllPressed(_ sender: UIButton) {
        print("SeeAllButton Pressed")
        if !productList.isEmpty {
            for product in productList {
                print(product.productName)
            }
        }
    }
    
    func saveProductList() {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(productList)
                UserDefaults.standard.set(data, forKey: "productList")
            } catch {
                print("Failed to save product list: \(error)")
            }
        }
        
        func loadProductList() {
            if let data = UserDefaults.standard.data(forKey: "productList") {
                do {
                    let decoder = JSONDecoder()
                    productList = try decoder.decode([Product].self, from: data)
                } catch {
                    print("Failed to load product list: \(error)")
                }
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddProduct" {
            if let destinationVC = segue.destination as? AddProductViewController {
                destinationVC.delegate = self
            }
        }else if segue.identifier == "seeAll" {
            if let destinationVC = segue.destination as? seeAllViewController {
                destinationVC.productList = productList
                destinationVC.delegate = self
            }
        }
    }
}

extension ViewController: AddProductViewControllerDelegate {
    func addProductViewController(_ controller: AddProductViewController, didAddProduct product: Product) {
        productList.append(product)
        saveProductList()
        print(product.productName, product.productCategory, product.productPrice, product.productQuantity)
    }
}
extension ViewController: seeAllViewControllerDelegate {
    func seeAllViewController(_ controller: seeAllViewController, didUpdateProductList productList: [Product]) {
        self.productList = productList
        saveProductList()
        print("Product list updated from SeeAllViewController.")
    }
}
