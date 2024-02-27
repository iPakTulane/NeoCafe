//
//  TabBarController.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 21/02/24.
//

import UIKit


class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = TabBar.allCases.map {$0.viewController}
        addCustomTabBarView()
        hideTabBarBorder()
        view.backgroundColor = .white
        self.selectedIndex = 0
        tabBar.tintColor = .orange
    }
    
    private lazy var customTabBarView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -4.0)
        view.layer.shadowOpacity = 0.12
        view.layer.shadowRadius = 5.0
        return view
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customTabBarView.frame = tabBar.frame
    }
    
    private func addCustomTabBarView() {
        customTabBarView.frame = tabBar.frame
        view.addSubview(customTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    
    private func hideTabBarBorder() {
        let tabBar = self.tabBar
//        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
    }
}

enum TabBar: String, CaseIterable {
    case main
    case basket
    case branches
    case profile
    
    var viewController: UINavigationController {
        var vc = UINavigationController()
        switch self {
        case .main:
            vc = UINavigationController(rootViewController: MainViewController())
        case .basket:
            vc = UINavigationController(rootViewController: BasketViewController())
            vc.navigationBar.topItem?.title = "Корзина"
        case .branches:
            vc = UINavigationController(rootViewController: BranchesViewController())
            vc.navigationBar.topItem?.title = "Филиалы"
        case .profile:
            vc = UINavigationController(rootViewController: ProfileViewController())
            vc.navigationBar.topItem?.title = "Профиль"
        }
        
        vc.setNavigationBarHidden(false, animated: true)
        vc.tabBarItem = tabBarItem
        vc.tabBarItem.imageInsets.top = 5
        vc.navigationController?.view.backgroundColor = .purple
        return vc
    }
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .main:
            return .init(title: "Главная",
                         image: UIImage(named: "mainTabBar")?.withTintColor(.darkGray),
                         selectedImage: UIImage(named: "mainTabBar")?.withTintColor(.orange))
        case .basket:
            return .init(title: "Корзина",
                         image: UIImage(named: "basketTabBar")?.withTintColor(.darkGray),
                         selectedImage: UIImage(named: "basketTabBar")?.withTintColor(.orange))
        case .branches:
            return .init(title: "Филиалы",
                         image: UIImage(named: "branchesTabBar")?.withTintColor(.darkGray),
                         selectedImage: UIImage(named: "branchesTabBar")?.withTintColor(.orange))
        case .profile:
            return .init(title: "Профиль",
                         image: UIImage(named: "profileTabBar")?.withTintColor(.darkGray),
                         selectedImage: UIImage(named: "profileTabBar")?.withTintColor(.orange))
        }
    }
}


//#if DEBUG
//import SwiftUI
//
//struct TabBarControllerPreview: UIViewControllerRepresentable {
//    typealias UIViewControllerType = TabBarController
//
//    func makeUIViewController(context: Context) -> TabBarController {
//        let tabBarController = TabBarController()
//        return tabBarController
//    }
//
//    func updateUIViewController(_ uiViewController: TabBarController, context: Context) {
//        // Update the view controller if needed
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarControllerPreview()
//            .edgesIgnoringSafeArea(.all)
//            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
//            .previewDisplayName("TabBarController Preview")
//    }
//}
//#endif
