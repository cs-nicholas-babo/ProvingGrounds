//
//  PokemonProtocols.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingPokemon()
    func showDetailController(navigationController:UINavigationController)
}

protocol PresenterToViewProtocol: class{
    func showPokemon(pokemon:Array<Pokemon>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
//    static func createModule()-> NoticeViewController
    func pushToDetailScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchPokemon()
}

protocol InteractorToPresenterProtocol: class {
    func fetchedSuccess(pokemon:Array<Pokemon>)
    func fetchFailed()
}
