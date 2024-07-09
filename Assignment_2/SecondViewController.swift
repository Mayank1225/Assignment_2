import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!

    struct Datalist {
        let Name: String
        let ImgName: String
        let detail: String
        let price: String
    }

    var data: [Datalist] = [
        Datalist(Name: "Dell", ImgName: "img1", detail: "RAM 4GB", price: "$299.99"),
        Datalist(Name: "Hp", ImgName: "img2", detail: "RAM 8GB", price: "$499.99"),
        Datalist(Name: "Lenovo", ImgName: "img3", detail: "RAM 8GB", price: "$179.99"),
        Datalist(Name: "Asus", ImgName: "img4", detail: "RAM 8GB", price: "$799.99"),
        Datalist(Name: "Rog", ImgName: "img5", detail: "RAM 16GB", price: "$1249.99"),
        Datalist(Name: "Acer", ImgName: "img1", detail: "RAM 16GB", price: "$1499.99"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Laptops"
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showPopup))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backToMain))
        table.dataSource = self
        table.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeTableViewCell
        cell.NameOfProduct.text = row.Name
        cell.ImageOfProduct.image = UIImage(named: row.ImgName)
        cell.PriceOfProduct.text = row.price
        cell.DetailOfProduct.text = row.detail
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    @objc func showPopup() {
        let alertController = UIAlertController(title: "Input", message: "Please Enter your ID", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter your studentId here"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let applyAction = UIAlertAction(title: "Apply", style: .default) { _ in
            if let textField = alertController.textFields?.first, let value = textField.text {
                if value.count == 7{
                    self.addItemInDataList(Id: value)
                } else {
                    let alert = UIAlertController(title: "Try Again", message: "Please Enter Valid Id", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style:.cancel))
                    self.present(alert, animated: true)
                }
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(applyAction)
        
        self.present(alertController, animated: true)
    }

    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }

    func getFifthNumber(from string: String) -> Int? {
        guard string.count > 4 else {
            return nil
        }
        let index = string.index(string.startIndex, offsetBy: 4)
        return Int(String(string[index]))
    }
    func checkIndex(index: Int) -> Int {
        if index > 0 {
            return index - 1;
        }
        return 0;
    }
    
    func addItemInDataList(Id: String) {
        let newItem = Datalist(Name: "IBM TABLETS", ImgName: "img1", detail: "Id: \(Id)", price: "$999.99")
        if let index = getFifthNumber(from: Id) {
            data.insert(newItem, at: min(checkIndex(index: index), data.count))
            table.reloadData()
        } else {
            print("Invalid ID must be 7 digit valid number")
        }
    }
}
