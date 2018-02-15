//
//  Store.swift
//  Ocadex
//
//  Created by Jose Marchena on 13/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

struct Store {
    func loadOcamons() -> [Ocamon] {
        return buildOcamons()
    }

    private func buildOcamons() -> [Ocamon] {
        let montyzard = Ocamon(name: "Montyzard", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let xavimander = Ocamon(name: "Xavimander", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let ricarchu = Ocamon(name: "Ricarchu", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let rothkoman = Ocamon(name: "Rothkoman", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let pedrobur = Ocamon(name: "Pedrobur", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let luiseon = Ocamon(name: "Luiseon", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let gregorfly = Ocamon(name: "Gregorfly", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let nintenxevi = Ocamon(name: "Nintenxevi", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let bohomarc = Ocamon(name: "Bohomarc", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let cristibreaker = Ocamon(name: "Cristibreaker", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let elidroid = Ocamon(name: "Elidroid", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let raskatraveler = Ocamon(name: "Raskatraveler", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let danimaker = Ocamon(name: "Danimaker", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let jugman = Ocamon(name: "Jugman", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let metalana = Ocamon(name: "Metalana", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let jsondiego = Ocamon(name: "Jsondiego", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let folchbot = Ocamon(name: "Folchbot", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let joanahope = Ocamon(name: "Joanahope", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let coalicionman = Ocamon(name: "Coalicionman", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let mikeclimb = Ocamon(name: "Mikeclimb", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))
        let christdd = Ocamon(name: "Christdd", type: .soviet, info: "Storyteller", image: UIImage(named: "GenericImage"))

        return [montyzard, xavimander, ricarchu, rothkoman, pedrobur, luiseon, gregorfly, nintenxevi, bohomarc, cristibreaker, elidroid, raskatraveler, danimaker, jugman, metalana, jsondiego, folchbot, joanahope, coalicionman, mikeclimb, christdd]
    }
}
