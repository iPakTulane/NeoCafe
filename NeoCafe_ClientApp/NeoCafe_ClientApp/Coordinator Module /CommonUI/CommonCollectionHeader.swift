//
//  CommonCollectionHeader.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//

import UIKit

class CommonCollectionHeader: UICollectionReusableView {
    static let identifier = "CommonCollectionHeader"
    
    private lazy var title = createTitle()
    private lazy var button = createButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommonCollectionHeader {
    
    private func setupSubviews() {
        addSubview(title)
        addSubview(button)
    }
    
    private func setupConstraints() {
        
        title.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
        }
    }
}

extension CommonCollectionHeader {
    
    private func createTitle() -> UILabel {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .blue
        return label
    }
    
    private func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.tintColor = .orange
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.isHidden = true
        return button
    }
}
