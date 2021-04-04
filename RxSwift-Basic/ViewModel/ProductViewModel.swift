//
//  ProductViewModel.swift
//  RxSwift-Basic
//
//  Created by Admin on 04/04/21.
//

import RxSwift
import RxCocoa

struct ProductViewModel {
    
    var items = PublishSubject<[Product]>()
    
    func fetchItem() {
        let products = [
            Product(imageName: "gear", title: "Settings"),
            Product(imageName: "house", title: "Home"),
            Product(imageName: "person.circle", title: "Profile"),
            Product(imageName: "airplane", title: "Flights")
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
    
}
