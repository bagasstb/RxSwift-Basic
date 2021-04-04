//
//  ViewController.swift
//  RxSwift-Basic
//
//  Created by Admin on 04/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel = ProductViewModel()
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        bindTableData()
    }
    
    private func bindTableData() {
        
        // Bind items to table
        viewModel.items.bind(
            to: tableView.rx.items(
                cellIdentifier: "cell",
                cellType: UITableViewCell.self)
        ) { row, model, cell in
            cell.imageView?.image = UIImage(systemName: model.imageName)
            cell.textLabel?.text = model.title
        }.disposed(by: bag)
        
        // Bind a model selected handler
        cellSelected()
        
        // fetch item
        viewModel.fetchItem()
    }
    
    private func cellSelected() {
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.title)
        }.disposed(by: bag)
    }
}

