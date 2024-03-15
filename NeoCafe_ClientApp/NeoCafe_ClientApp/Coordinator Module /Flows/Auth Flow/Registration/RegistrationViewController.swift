//
//  RegistrationViewController.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 11/02/24.
//  

import UIKit

class RegistrationViewController: UIViewController, FlowCompletion {
    
    var completionHandler: ((String?) -> ())?
    
    private var userData: MockUser!
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Registration"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    func setup(userData: MockUser) {
        self.userData = userData
    }
    
    func addSubviews() {
        
        view.backgroundColor = .orange
        title = "Enter Name"
        
        let stackView = UIStackView(arrangedSubviews: [textField, nextButton])
        stackView.frame.size = CGSize(width: 200, height: 120)
        stackView.axis = .vertical
//        stackView.spacing = 20
        stackView.distribution = .equalCentering
        stackView.center = view.center
        view.addSubview(stackView)
    }
    
    
    @objc private func didTapNextButton() {
        completionHandler?(textField.text)
    }
    
}
