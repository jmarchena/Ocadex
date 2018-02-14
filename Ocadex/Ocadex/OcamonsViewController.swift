//
//  OcamonsViewController.swift
//  Ocadex
//
//  Created by Jose Marchena on 13/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

class OcamonsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var ocamonStore: Store! {
        didSet {
            ocamonList = ocamonStore.loadOcamons()
        }
    }

    private var ocamonList: [Ocamon] = []

    init(store: Store) {
        super.init(nibName: nil, bundle: nil)
        self.ocamonStore = store
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

