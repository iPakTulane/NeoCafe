//
//  SegmentedControl.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//


import UIKit

class ViewController: UIViewController {
    private let customSegmentedControl = CustomSegmentedControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomSegmentedControl()
    }

    private func setupCustomSegmentedControl() {
        view.addSubview(customSegmentedControl)
        customSegmentedControl.layer.cornerRadius = 24

        // You can customize the frame as per your requirement
        customSegmentedControl.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }
}

import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        let viewController = ViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        ViewControllerWrapper()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//import UIKit
//import SnapKit
//
//class CustomSegmentedControl: UIView {
//    
//    var selectedIndex = 0
//    
//    private lazy var createButton: (String) -> UIButton = { title in
//        let button = UIButton()
//        button.layer.cornerRadius = 24
//        button.setTitle(title, for: .normal)
//        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
//        return button
//    }
//    
//    private lazy var firstButton: UIButton = createButton("Войти")
//    private lazy var secondButton: UIButton = createButton("Регистрация")
//    
//    private lazy var stackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [firstButton, secondButton])
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        return stack
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .gray
//        setupConstraints()
//        setupTargets()
//        updateSelectedState()
//    }
//    
//    private func setupConstraints() {
//        addSubview(stackView)
//        stackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//    
//    private func selectionChanges(isFirst: Bool) {
//        let firstColor = isFirst ? UIColor.orange : UIColor.gray
//        let secondColor = isFirst ? UIColor.gray : UIColor.orange
//        let firstTitleColor = isFirst ? UIColor.white : UIColor.blue
//        let secondTitleColor = isFirst ? UIColor.blue : UIColor.white
//        
//        firstButton.backgroundColor = firstColor
//        firstButton.setTitleColor(firstTitleColor, for: .normal)
//        secondButton.backgroundColor = secondColor
//        secondButton.setTitleColor(secondTitleColor, for: .normal)
//    }
//    
//    private func setupTargets() {
//        firstButton.addTarget(self, action: #selector(optionButtonTapped), for: .touchUpInside)
//        secondButton.addTarget(self, action: #selector(optionButtonTapped), for: .touchUpInside)
//    }
//    
//    @objc private func optionButtonTapped(_ sender: UIButton) {
//        selectedIndex = sender == firstButton ? 0 : 1
//        updateSelectedState()
//    }
//    
//    private func updateSelectedState() {
//        selectionChanges(isFirst: selectedIndex == 0)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}



//import SwiftUI
//
//struct CustomSegmentedControlWrapper: UIViewRepresentable {
//    let customSegmentedControl = CustomSegmentedControl()
//
//    func makeUIView(context: Context) -> UIView {
//        return customSegmentedControl
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        // Update any necessary configurations
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        CustomSegmentedControlWrapper()
//            .frame(width: 300, height: 50) // Set your desired frame size
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
















//import UIKit
//
//protocol SegmentedControlDelegate: AnyObject {
//    func valueChanged(selectedIndex: Int)
//}
//
//class CustomSegmentedControl: UIView {
//
//    // MARK: - Properties
//    
//    var selectedIndex = 0 {
//        didSet {
//            updateSelectedState()
//        }
//    }
//    
//    weak var delegate: SegmentedControlDelegate?
//    
//    private lazy var firstButton: UIButton = {
//        return createSegmentButton(title: "Войти")
//    }()
//    
//    private lazy var secondButton: UIButton = {
//        return createSegmentButton(title: "Регистрация")
//    }()
//    
//    private lazy var stackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [firstButton, secondButton])
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        return stack
//    }()
//    
//    // MARK: - Initialization
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = Asset.colorGray.color
//        setupConstraints()
//        setupTargets()
//        updateSelectedState()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Private Methods
//    
//    private func createSegmentButton(title: String) -> UIButton {
//        let button = UIButton()
//        button.layer.cornerRadius = 24
//        button.setTitle(title, for: .normal)
//        button.titleLabel?.font = UIFont(name: FontFamily.Poppins.bold.name, size: 15)
//        return button
//    }
//    
//    private func setupConstraints() {
//        addSubview(stackView)
//        stackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//    
//    private func setupTargets() {
//        firstButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
//        secondButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
//    }
//    
//    private func updateSelectedState() {
//        let isFirstSelected = selectedIndex == 0
//        selectionChanges(isFirst: isFirstSelected)
//        delegate?.valueChanged(selectedIndex: selectedIndex)
//    }
//    
//    private func selectionChanges(isFirst: Bool) {
//        firstButton.backgroundColor = isFirst ? Asset.colorOrange.color : Asset.colorGray.color
//        firstButton.setTitleColor(isFirst ? Asset.colorWhite.color : Asset.colorDarkBlue.color, for: .normal)
//        
//        secondButton.backgroundColor = isFirst ? Asset.colorGray.color : Asset.colorOrange.color
//        secondButton.setTitleColor(isFirst ? Asset.colorDarkBlue.color : Asset.colorWhite.color, for: .normal)
//    }
//    
//    @objc private func optionButtonTapped(_ sender: UIButton) {
//        selectedIndex = (sender == firstButton) ? 0 : 1
//    }
//}
//
//


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
import UIKit

protocol SegmentedControlDelegate: AnyObject {
    func valueChanged(selectedIndex: Int)
}

class CustomSegmentedControl: UIView {
    
    var selectedIndex = 0
    var delegate: SegmentedControlDelegate?
    
    lazy var firstButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    lazy var secondButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        stack.clipsToBounds = true
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        setupConstraints()
        setupTargets()
        updateSelectedState()
    }
    
    func setupConstraints() {
        addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func selectionChanges(isFirst: Bool) {
        if isFirst {
            firstButton.backgroundColor = .orange
            firstButton.setTitleColor(.white, for: .normal)
            secondButton.backgroundColor = .gray
            secondButton.setTitleColor(.black, for: .normal)
        } else {
            firstButton.backgroundColor = .gray
            firstButton.setTitleColor(.black, for: .normal)
            secondButton.backgroundColor = .orange
            secondButton.setTitleColor(.white, for: .normal)
        }
    }
    
    func setupTargets() {
        firstButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(optionButtonTapped(_:)), for: .touchUpInside)
    }
    
    func updateSelectedState() {
        selectionChanges(isFirst: selectedIndex == 0)
        delegate?.valueChanged(selectedIndex: selectedIndex)
    }
    
    @objc private func optionButtonTapped(_ sender: UIButton) {
        selectedIndex = sender == firstButton ? 0 : 1
        updateSelectedState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
