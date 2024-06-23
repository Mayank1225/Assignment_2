import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    
    struct Datalist {
        let Name: String
        let ImgName: String
        let detail: String
        let price: String
    }
    
    let data: [Datalist] = [
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil);
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil);
        table.dataSource = self;
        table.delegate = self;
        
           let cellNib = UINib(nibName: "SpecialTableViewCell", bundle: nil)
           table.register(cellNib, forCellReuseIdentifier: "specialcell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 3{
//            let specialcell = table.dequeueReusableCell(withIdentifier: "specialcell", for: indexPath) as! SpecialTableViewCell
//            specialcell.studentID.text = "IBM TABLET (9001415): $900.00";
//                                      
//            return specialcell;
//        } else {
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
