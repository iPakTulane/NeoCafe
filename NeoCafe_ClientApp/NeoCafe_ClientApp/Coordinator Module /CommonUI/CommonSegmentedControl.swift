//
//  CommonSegmentedControl.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//

import UIKit

protocol CommonSegmentedControlDelegate: AnyObject {
    func valueChanged(selectedIndex: Int)
}

class CommonSegmentedControl: UIView {
    var selectedIndex = 0
    var delegate: CommonSegmentedControlDelegate?
    
    private lazy var leftButton = createLeftButton()
    private lazy var rightButton = createLeftButton()
    private lazy var stackView = createStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setupConstraints()
        setupTargets()
        updateSelectedState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommonSegmentedControl {
    
    func setupView() {
        layer.cornerRadius = 24
        backgroundColor = .gray
    }
    
    func setupSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(rightButton)
    }
    
    func setupConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // TODO: -
        leftButton.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
            make.height.equalTo(48)
        }
        
        // TODO: -
        rightButton.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
    }
    
    func selectionChanges(isFirst: Bool) {
        if isFirst {
            leftButton.backgroundColor = .orange
            leftButton.setTitleColor(.white, for: .normal)
            rightButton.backgroundColor = .gray
            rightButton.setTitleColor(.black, for: .normal)
        } else {
            leftButton.backgroundColor = .gray
            leftButton.setTitleColor(.black, for: .normal)
            rightButton.backgroundColor = .orange
            rightButton.setTitleColor(.white, for: .normal)
        }
    }
    
    func setupTargets() {
        leftButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
    }
    
    func updateSelectedState() {
        selectionChanges(isFirst: selectedIndex == 0)
        delegate?.valueChanged(selectedIndex: selectedIndex)
    }
    
    @objc private func optionButtonTapped(_ sender: UIButton) {
        selectedIndex = sender == leftButton ? 0 : 1
        updateSelectedState()
    }
}

extension CommonSegmentedControl {
    
    private func createLeftButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }
    
    private func createRightButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }
    
    private func createStackView() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        stack.clipsToBounds = true
        return stack
    }
    
}
