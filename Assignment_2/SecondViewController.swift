import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

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
    ];
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Laptops";
        
        self.navigationItem.hidesBackButton = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemInDataList));
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backToMain));
        table.dataSource = self;
        table.delegate = self;
    }
                                                                
        @objc func backToMain() {
            self.navigationController?.popViewController(animated: true)
        }
                                                                
    @objc func addItemInDataList() {
        // Define the new item
        let newItem = Datalist(Name: "IBM TABLETS", ImgName: "img1", detail: "Id: 9001415", price: "$999.99")
        data.insert(newItem, at: getFifthNumber(from: "9001415")! - 1)
        table.reloadData()
    }
    
    func getFifthNumber(from string: String) -> Int? {
        guard string.count > 4 else {
            return nil
        }
        let index = string.index(string.startIndex, offsetBy: 4)
        return Int(String(string[index]));
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let row = data[indexPath.row]
            let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeTableViewCell
            cell.NameOfProduct.text = row.Name
            cell.ImageOfProduct.image = UIImage(named: row.ImgName);
            cell.PriceOfProduct.text = row.price;
            cell.DetailOfProduct.text = row.detail;
            
            return cell;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 100;
        } else {
            return 100;
        }
    }
}
