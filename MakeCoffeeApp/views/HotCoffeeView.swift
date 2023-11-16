//
//  HotCoffeeView.swift
//  MakeCoffeeApp
//
//  Created by macbook pro on 16.11.2023.
//

import UIKit

class HotCoffeeView: UIViewController,AnyView , UITableViewDelegate,UITableViewDataSource{
    var hotCoffeelist : [HotCoffee] = []
    
    func updateHot(with hotcoffee: [HotCoffee]) {
        print("update func called")
        DispatchQueue.main.async {
            self.hotCoffeelist = hotcoffee
            print("hotcoffeelist içi dolduruldu")
            
        }
        
    }
    
    func updateIced(with icedCoffee: [ColdCoffee]) {
        
    }
    
    var presenter: AnyPresenter?
    
    var chosenCoffeeType: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetUpUI()
        // Do any additional setup after loading the view.
    }
    
    func SetUpUI() {
        let tableView = makeTableView()
        let navbar = makeNavigationBar()
        view.addSubview(tableView)
        view.addSubview(navbar)
        let safeAreaHeight = view.safeAreaLayoutGuide.heightAnchor
        let safeAreaWidth = view.safeAreaLayoutGuide.widthAnchor
        
        NSLayoutConstraint.activate([
            navbar.topAnchor.constraint(equalTo: view.topAnchor),
            navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navbar.heightAnchor.constraint(equalTo: safeAreaHeight, multiplier: 0.15),
            
            tableView.topAnchor.constraint(equalTo: navbar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotCoffeelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTableViewCell(style: .default, reuseIdentifier: "cell")
        
        if let imagedata = Data(base64Encoded: self.hotCoffeelist[indexPath.row].image) {
            if let image = UIImage(data: imagedata) {
                cell.cellImageView.image = image
            } else {
                cell.cellImageView.image = UIImage(named: "hotcofee")
            }
        } else {
            cell.cellImageView.image = UIImage(named: "hotcofee")
        }
        
        return cell
    }

    
        
        func makeTableView() -> UITableView {
            var tableview = UITableView()
            tableview.translatesAutoresizingMaskIntoConstraints = false
            tableview.delegate = self
            tableview.delegate = self
            return tableview
        }
        func makeNavigationBar() -> UINavigationBar {
            let navbar = UINavigationBar()
            navbar.translatesAutoresizingMaskIntoConstraints = false
            navbar.backgroundColor = UIColor.black
            navbar.barTintColor = UIColor.black
            navbar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            return navbar
        }
        
        
        
    }

        
