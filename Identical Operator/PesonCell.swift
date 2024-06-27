//
//  PesonCell.swift
//  Identical Operator
//
//  Created by E5000855 on 27/06/24.
//

import Foundation
import UIKit

class PersonCell: UITableViewCell {
    let nameLabel = UILabel()
    let detailLabel = UILabel()
    let selectionSwitch = UISwitch()
    
    var person: Person? {
        didSet {
            guard let person = person else { return }
            nameLabel.text = person.name
            detailLabel.text = "Age: \(person.age), ID: \(person.id)"
            selectionSwitch.isOn = person.isSelected
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        selectionSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
        addSubview(detailLabel)
        addSubview(selectionSwitch)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            detailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            selectionSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            selectionSwitch.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        selectionSwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func switchToggled() {
        person?.isSelected = selectionSwitch.isOn
    }
}
