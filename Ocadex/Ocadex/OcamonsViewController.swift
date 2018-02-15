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

    private var ocamonStore: Store!

    private var ocamonList: [Ocamon] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    static let cellReuseIdentifier: String = "Cell"

    init(store: Store) {
        super.init(nibName: nil, bundle: nil)
        self.ocamonStore = store
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: OcamonsViewController.cellReuseIdentifier)
        ocamonList = ocamonStore.loadOcamons()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OcamonsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ocamonList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OcamonsViewController.cellReuseIdentifier, for: indexPath)

        cell.textLabel?.text = ocamonList[indexPath.row].name

        return cell
    }
}
