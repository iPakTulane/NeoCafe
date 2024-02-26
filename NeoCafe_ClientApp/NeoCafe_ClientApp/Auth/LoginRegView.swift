//
//  LoginRegView.swift
//  NeoCafe_ClientApp
//
//  Created by iPak Tulane on 12/02/24.
//

import UIKit
import SwiftUI
import SnapKit


class ViewController1: UIViewController {
    
    // headerView
    lazy var headerView: UIImageView = {
        let image = UIImage(named: "header")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // headerLabel
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .app1St
        label.textAlignment = .center
        return label
    }()
    
    private lazy var segmentedControlBackground: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .appGrey
        backgroundView.layer.cornerRadius = 25
        backgroundView.clipsToBounds = true
        return backgroundView
    }()

    private lazy var toggleSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login", "Registration"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(toggleSegmentedControlValueChanged), for: .valueChanged)

        // Customize segmented control appearance
        segmentedControl.selectedSegmentTintColor = .orange
        let font = UIFont.systemFont(ofSize: 15)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)

        return segmentedControl
    }()

    @objc private func toggleSegmentedControlValueChanged() {
        // Handle segmented control value change
        let isLogin = toggleSegmentedControl.selectedSegmentIndex == 0
        // Perform actions based on the toggle state
        print("Toggle is \(isLogin ? "Login" : "Registration")")
    }
    
    /// button
    let placeholderView: UIView = {
        let view = UIView()
        view.backgroundColor = .appGrey
        return view
    }()
    
    /// button
    let buttonView: UIButton = {
        let button = UIButton()
        button.setTitle("Получить код", for: .normal)
        button.layer.cornerRadius = 13
        button.backgroundColor = .appBlack
        return button
    }()

    /// timerLabel
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "Отправить еще раз"
        label.textColor = .appDarkGrey
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }

    func setupSubviews() {
        view.addSubview(headerView)
        headerView.addSubview(headerLabel)
        
        view.addSubview(segmentedControlBackground)
        segmentedControlBackground.addSubview(toggleSegmentedControl)

        view.addSubview(placeholderView)
        view.addSubview(buttonView)
        view.addSubview(timerLabel)
    }
    
    func setupConstraints() {
        
//        headerView
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(140)
        }
        
//        headerLabel
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        segmentedControlBackground.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(-25)
            make.width.equalTo(343) // Adjust the width as needed
            make.height.equalTo(48) // Adjust the height as needed
        }

        toggleSegmentedControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
//        placeholderView
        placeholderView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(70)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(120)
        }
        
//        buttonView
        buttonView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(placeholderView.snp.bottom).offset(25)
            make.width.equalTo(343)
            make.height.equalTo(48)
        }
        
//        timerLabel
        timerLabel.snp.makeConstraints { make in
//            make.leading.trailing.bottom.equalToSuperview()
//            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonView.snp.bottom).offset(20)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
    }
    
}

#if DEBUG
@available(iOS 13.0, *)
struct ViewController1_Provider: PreviewProvider {
    static var previews: some View {
        ViewController1().showPreview()
    }
}
#endif
