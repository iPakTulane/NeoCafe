//
//  MainViewModel.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 22/02/24.
//

import UIKit

protocol MainViewModelType {
    var categories: [MockCategory] { get set }
    var populars: [MockPopular] { get set }
}

class MainViewModel: MainViewModelType {
    
    var categories: [MockCategory] = [
        MockCategory(title: "Кофе", image: "coffeeCategory"),
        MockCategory(title: "Десерты", image: "dessertCategory"),
        MockCategory(title: "Выпечка", image: "pastryCategory"),
        MockCategory(title: "Напитки", image: "drinksCategory"),
        MockCategory(title: "Чай", image: "teaCategory")
    ]
    
    var populars: [MockPopular] = [
        MockPopular(title: "americano",
                    description: "americano",
                    price: 10.00,
                    quantity: 1,
                    totalPrice: 10.0,
                    image: "americano"),
        MockPopular(title: "cappuccino",
                    description: "cappuccino",
                    price: 10.00,
                    quantity: 1,
                    totalPrice: 10.0,
                    image: "cappuccino"),
        MockPopular(title: "caramelRaf",
                    description: "caramelRaf",
                    price: 10.00,
                    quantity: 1,
                    totalPrice: 10.0,
                    image: "caramelRaf"),
    ]
}
