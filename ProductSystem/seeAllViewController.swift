import UIKit
protocol seeAllViewControllerDelegate: AnyObject {
    func seeAllViewController(_ controller: seeAllViewController, didUpdateProductList productList: [Product])
}

class seeAllViewController: UIViewController {
    
    @IBOutlet var overallPrice: UILabel!
    @IBOutlet var theView: UITableView!
    weak var delegate: seeAllViewControllerDelegate?
    var productList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addUp()
        print("Product List received:", productList)
        theView.delegate = self
        theView.dataSource = self
        theView.reloadData()
    }
    func addUp(){
        var totalPrice: Double = 0
            for product in productList {
                totalPrice += product.productPrice * Double(product.productQuantity)
            }
            overallPrice.text = String(format: "Total Inventory Value: $%.2f", totalPrice)
        
    }
    
}



extension seeAllViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        
        let product = productList[indexPath.row]
        cell.textLabel?.text = "\(product.productName) | $\(product.productPrice) | CAT: \(product.productCategory) CNT: \(product.productQuantity)"
        cell.detailTextLabel?.text = "Category: \(product.productCategory), Price: $\(product.productPrice), Quantity: \(product.productQuantity)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            productList.remove(at: indexPath.row)
            delegate?.seeAllViewController(self, didUpdateProductList: productList)
            tableView.deleteRows(at: [indexPath], with: .fade)
            addUp()
        }
    }
}
