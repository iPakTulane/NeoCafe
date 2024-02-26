//
//  CommonHeader.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//

import UIKit

class CommonHeader: UIView {
    lazy var view = createView()
    lazy var title = createTitle()
    lazy var leftButton = createLeftButton()
    lazy var rightButton = createRightButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommonHeader {
    private func setupSubviews() {
        addSubview(view)
        view.addSubview(title)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
    }
    
    private func setupConstraints() {

        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        leftButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(40)
        }
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(40)
        }
    }
}

extension CommonHeader {
    
    private func createView() -> UIView {
        let image = UIImage(named: "header")
        let view = UIImageView(image: image)
        view.contentMode = .scaleToFill
        view.isHidden = false
        return view
    }

    private func createTitle() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.isHidden = false
        return label
    }

    private func createLeftButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.tintColor = .none
        button.setImage(UIImage(systemName: ""), for: .normal)
        button.backgroundColor = .none
        button.isHidden = true
        return button
    }

    private func createRightButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.tintColor = .none
        button.setImage(UIImage(systemName: ""), for: .normal)
        button.backgroundColor = .none
        button.isHidden = true
        return button
    }
    
}

