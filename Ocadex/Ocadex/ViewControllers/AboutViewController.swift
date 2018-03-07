//
//  AboutViewController.swift
//  Ocadex
//
//  Created by Jose Marchena on 19/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var didTapClose: () -> () = { }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About"
        setupNavigationItem()
    }

    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.closeTapped))
    }

    @objc func closeTapped() {
        didTapClose()
    }
}
