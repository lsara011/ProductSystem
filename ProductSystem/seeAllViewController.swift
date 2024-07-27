import UIKit

class seeAllViewController: UIViewController {
    
    @IBOutlet var theView: UITableView!
    
    var productList: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Product List received:", productList)
        theView.delegate = self
        theView.dataSource = self
        theView.reloadData()
    }
}

extension seeAllViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a cell and configure it with the product data
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        
        let product = productList[indexPath.row]
        
        cell.textLabel?.text = product.productName
        cell.detailTextLabel?.text = "Category: \(product.productCategory), Price: $\(product.productPrice), Quantity: \(product.productQuantity)"
        
        return cell
    }
}
