
import UIKit


class OnboardingView: UIViewController, AnyView {
    func updateHot(with hotcoffee: [HotCoffee]) {
        
    }
    
    func updateIced(with icedCoffee: [ColdCoffee]) {
        
    }
    
    var chosenCoffeeType: String?
    
    var presenter: AnyPresenter?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        print("başlatıldı")
        SetupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }

   
    @objc func segueButton(){
        
        navigationController?.pushViewController(CoffeeView(), animated: true)

    }
    
    func SetupUI() {
        let titleLabel = makeBoldLabel(withText: "Let's Make Coffee")
        let descLabel = makeLabel(withText: "Coffee Recipes that popular worldwide")
        let button = makeButton(title: "Go To Recipes", target: self, action: #selector(segueButton))
        view.addSubview(titleLabel)
        view.addSubview(descLabel)
        view.addSubview(button)
        let height = view.safeAreaLayoutGuide.heightAnchor
        let width = view.safeAreaLayoutGuide.widthAnchor
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            
            
        ])
    }
    
    
    
    
    
    
    func makeBoldLabel  (withText text : String) -> UILabel{
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }
    
    func makeLabel(withText text : String) -> UILabel {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        return label
    }
    
    func makeButton(title: String, target: Any?, action: Selector) -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)  // Buton metin rengini özelleştirebilirsiniz
        button.addTarget(target, action: action, for: .touchUpInside)
        
        container.addSubview(button)

        // Container ve buton için kısıtlamaları ayarla
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: container.topAnchor),
            button.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            button.widthAnchor.constraint(equalTo: button.titleLabel!.widthAnchor, constant: 30),
            button.heightAnchor.constraint(equalTo: button.titleLabel!.heightAnchor,constant: 30)
        ])
        container.layer.borderWidth = 3
        container.layer.borderColor = UIColor.gray.cgColor
        container.layer.cornerRadius = 12

        return container
    }

}
