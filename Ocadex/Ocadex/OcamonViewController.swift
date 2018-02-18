//
//  OcamonViewController.swift
//  Ocadex
//
//  Created by Jose Marchena on 15/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

class OcamonViewController: UIViewController {

    private var ocamon: Ocamon!

    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = ocamon.name
        }
    }
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.image = ocamon.image
        }
    }
    @IBOutlet weak var typeLabel: UILabel! {
        didSet {
            typeLabel.text = ocamon.type.rawValue
        }
    }
    @IBOutlet weak var whereLabel: UILabel! {
        didSet {
            whereLabel.text = ocamon.name
        }
    }
    @IBOutlet weak var informationLabel: UILabel! {
        didSet {
            informationLabel.text = ocamon.info
        }
    }

    init(with ocamon: Ocamon) {
        super.init(nibName: nil, bundle: nil)
        self.ocamon = ocamon
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
