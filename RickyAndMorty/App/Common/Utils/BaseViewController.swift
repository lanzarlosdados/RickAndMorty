//
//  BaseViewController.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 29/07/2023.
//

import UIKit

enum LoadingViewState{
    case show
    case hide
}

protocol BaseViewProtocol{
    func loadingView(_ state : LoadingViewState)
    func showError(_ error : String, callback : (()->Void)?)
}

class BaseViewController: UIViewController {
    var loadingIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = UIColor.black

    }
    
}

extension BaseViewController{
    func showError(_ error : String, callback : (()->Void)?){
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        if let callback = callback{
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { action in
                if action.style == .default{
                    callback()
                    print("retry button pressed")
                }
            }))
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            if action.style == .cancel{
                print("ok button pressed")
            }
        }))
        
        present(alert, animated: true)
    }
    
    func loadingView(_ state : LoadingViewState){
        switch state {
        case .show:
            showLoading()
        case .hide:
            hideLoading()
        }
    }
    
    private func showLoading(){
        view.addSubview(loadingIndicator)
        loadingIndicator.center = view.center
        loadingIndicator.startAnimating()
    }
    
    private func hideLoading(){
        loadingIndicator.stopAnimating()
        loadingIndicator.removeFromSuperview()
    }
}
