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

    init(with ocamon: Ocamon) {
        super.init(nibName: nil, bundle: nil)
        self.ocamon = ocamon
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
