//
//  AuthorizeMyQiitaViewController.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-23.
//

import UIKit

protocol AuthorizeMyQiitaPresenter: AnyObject {
    func openAuthorizeUrl() 
}

class AuthorizeMyQiitaViewController: UIViewController {
    private let viewContainer: AuthorizeMyQiitaViewLike
    private let model: AuthorizeMyQiitaModel
    
    init(viewContainer: AuthorizeMyQiitaViewLike, model: AuthorizeMyQiitaModel) {
        self.viewContainer = viewContainer
        self.model = model
        
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewContainer.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewContainer.presenterLike = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AuthorizeMyQiitaViewController: AuthorizeMyQiitaPresenter {
    func openAuthorizeUrl() {
        model.openAuthorizeURL { [weak self] in
            let alertViewController = UIAlertController(title: "エラー発生しました", message: nil, preferredStyle: .alert)
            
            self?.present(alertViewController, animated: true)
        }
    }
}
