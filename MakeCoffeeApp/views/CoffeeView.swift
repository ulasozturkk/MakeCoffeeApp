import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    var chosenCoffeeType: String? { get set }
}

class CoffeeView: UIViewController, AnyView {
    var chosenCoffeeType: String?
    var presenter: AnyPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
    }
    
    func setupUI() {
        let navbar = makeNavigationBar()
        let title = makeBoldLabel(withText: "Choose coffee type that you want to prepare")
        let hotCoffeeImage = makeImageView(imageName: "hotcofee")
        let icedCoffeeImage = makeImageView(imageName: "icedCoffee")
        let hotcoffeeLabel = makeLabel(withText: "Hot Coffee")
        let icedcoffeeLabel = makeLabel(withText: "Iced Cofee")
        
        view.addSubview(navbar)
        view.addSubview(title)
        view.addSubview(hotCoffeeImage)
        view.addSubview(icedCoffeeImage)
        view.addSubview(hotcoffeeLabel)
        view.addSubview(icedcoffeeLabel)
        
        let safeAreaHeight = view.safeAreaLayoutGuide.heightAnchor
        let safeAreaWidth = view.safeAreaLayoutGuide.widthAnchor
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        
        NSLayoutConstraint.activate([
        
            navbar.topAnchor.constraint(equalTo: view.topAnchor),
            navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navbar.heightAnchor.constraint(equalTo: safeAreaHeight,multiplier: 0.15),
            
            title.topAnchor.constraint(equalTo: navbar.bottomAnchor,constant: screenHeight * 0.05),
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            hotCoffeeImage.topAnchor.constraint(equalTo: title.bottomAnchor, constant: screenHeight * 0.2),
            hotCoffeeImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: screenWidth * 0.05),
            hotCoffeeImage.heightAnchor.constraint(equalTo: safeAreaHeight, multiplier: 0.2),
            hotCoffeeImage.widthAnchor.constraint(equalTo: safeAreaWidth, multiplier: 0.4),
            
            icedCoffeeImage.topAnchor.constraint(equalTo: title.bottomAnchor, constant: screenHeight * 0.2),
            icedCoffeeImage.leadingAnchor.constraint(equalTo: hotCoffeeImage.trailingAnchor,constant: screenWidth * 0.1),
            icedCoffeeImage.heightAnchor.constraint(equalTo: safeAreaHeight, multiplier: 0.2),
            icedCoffeeImage.widthAnchor.constraint(equalTo: safeAreaWidth, multiplier: 0.4),
            
            hotcoffeeLabel.topAnchor.constraint(equalTo: hotCoffeeImage.bottomAnchor, constant: screenHeight * 0.05),
            hotcoffeeLabel.centerXAnchor.constraint(equalTo: hotCoffeeImage.centerXAnchor),

            icedcoffeeLabel.topAnchor.constraint(equalTo: icedCoffeeImage.bottomAnchor, constant: screenHeight * 0.05),
            icedcoffeeLabel.centerXAnchor.constraint(equalTo: icedCoffeeImage.centerXAnchor)

    
        ])
        
        let hotCoffeeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hotCoffeeTapped))
        let icedCoffeeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(icedCoffeeTapped))
        hotCoffeeImage.addGestureRecognizer(hotCoffeeGestureRecognizer)
        icedCoffeeImage.addGestureRecognizer(icedCoffeeGestureRecognizer)
    }
    
    @objc func hotCoffeeTapped(){
        print("hot tapped")
    }
    @objc func icedCoffeeTapped(){
        print("cold tapped")
    }
    
    func makeBoldLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }
    
    func makeImageView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: imageName) {
            imageView.image = image
            imageView.isUserInteractionEnabled = true
        } else {
            print("Error: Image named \(imageName) not found.")
        }
        
        return imageView
    }
    
    func makeNavigationBar() -> UINavigationBar {
        let navbar = UINavigationBar()
        navbar.translatesAutoresizingMaskIntoConstraints = false
        navbar.backgroundColor = UIColor.black
        navbar.barTintColor = UIColor.black
        navbar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navbar
    }
    
    func makeLabel(withText text: String) -> UILabel {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }
}
