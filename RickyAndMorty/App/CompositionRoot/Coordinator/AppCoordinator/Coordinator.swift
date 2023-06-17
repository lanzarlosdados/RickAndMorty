//
//  Coordinator.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 17/06/2023.
//
import UIKit

protocol Coordinator {
    var navigation : UINavigationController { get }
    func start()
}
