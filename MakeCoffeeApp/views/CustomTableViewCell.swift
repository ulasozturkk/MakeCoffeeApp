//
//  CustomTableViewCell.swift
//  MakeCoffeeApp
//
//  Created by macbook pro on 16.11.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var cellImageView : UIImageView {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        return imageview
    }
    
    var CellLabel : UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        return label
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(cellImageView)
        addSubview(CellLabel)
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellImageView.widthAnchor.constraint(equalToConstant: 50),
            cellImageView.heightAnchor.constraint(equalToConstant: 50),
            
            CellLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            CellLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
