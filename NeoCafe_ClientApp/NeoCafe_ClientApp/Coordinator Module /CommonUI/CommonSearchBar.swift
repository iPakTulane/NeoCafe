//
//  CommonSearchBar.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//

import UIKit
import SnapKit

class CommonSearchBar: UIView {
    
    lazy var textField = createTextField()
    lazy var button = createButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommonSearchBar {
    
    func setupView() {
        layer.cornerRadius = 24
        backgroundColor = .gray
    }
    
    func setupSubviews() {
        addSubview(textField)
        textField.addSubview(button)
    }
    
    func setupConstraints() {
        
        textField.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.leading.trailing.equalToSuperview().offset(16)
            make.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
            make.width.height.equalTo(48)
        }
    }
}

extension CommonSearchBar {
    
    private func createTextField() -> UITextField {
        let textField = UITextField()
        
        // Set the font for the text field
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        // Set attributes for the placeholder text
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 15, weight: .regular)
        ]
        
        // Apply the attributed placeholder
        textField.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: placeholderAttributes)
        
        // Other text field configurations
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        return textField
    }

    
    private func createButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setImage(UIImage(systemName: "searchButton"), for: .normal)
        button.layer.cornerRadius = 24
        button.tintColor = .white
        return button
    }

}
