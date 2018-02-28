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

    var didSelect: (Ocamon) -> () = { _ in }
    var didTapAbout: () -> () = { }

    private var ocamonStore: Store

    private var ocamonList: [Ocamon] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    static let cellReuseIdentifier: String = "Cell"

    init(store: Store) {
        self.ocamonStore = store
        super.init(nibName: nil, bundle: nil)
        title = "Ocadex"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupTableView()
        ocamonList = ocamonStore.loadOcamons()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: OcamonsViewController.cellReuseIdentifier)
    }

    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "About", style: .plain, target: self, action: #selector(self.aboutTapped))
    }

    private func ocamon(at indexPath: IndexPath) -> Ocamon {
        return ocamonList[indexPath.row]
    }

    @objc private func aboutTapped() {
        didTapAbout()
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

extension OcamonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ocamonSelected = ocamon(at: indexPath)
        didSelect(ocamonSelected)
    }
}
