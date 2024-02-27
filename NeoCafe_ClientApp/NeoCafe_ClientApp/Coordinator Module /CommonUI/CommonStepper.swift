//
//  CommonStepper.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 23/02/24.
//


import UIKit
import SnapKit

class CommonStepper: UIStepper {
    lazy var valueLabel = createValueLabel()
    lazy var minusButton = createMinusButton()
    lazy var plusButton = createPlusButton()
    
    var stepperValue: Int = 0 {
        didSet {
            valueLabel.text = "\(stepperValue)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommonStepper {
    private func setupSubviews() {
        addSubview(valueLabel)
        addSubview(minusButton)
        addSubview(plusButton)
    }
    
    private func setupConstraints() {
        
        valueLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        minusButton.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
            make.height.width.equalTo(40)
        }
        
        plusButton.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
            make.height.width.equalTo(40)
        }
    }
}

extension CommonStepper {
    
    private func createValueLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.isHidden = false
        return label
    }

    private func createMinusButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 100
        button.tintColor = .none
        button.setImage(UIImage(systemName: "minusStepper"), for: .normal)
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.isHidden = false
        return button
    }

    private func createPlusButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 100
        button.tintColor = .none
        button.setImage(UIImage(systemName: "plusStepper"), for: .normal)
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.isHidden = false
        return button
    }
    
    @objc private func minusButtonTapped() {
        stepperValue -= 1
    }
    
    @objc private func plusButtonTapped() {
        stepperValue += 1
    }
    
}

