//
//  ViewContainer.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

protocol ViewContainer: AnyObject {
    var view: UIView { get }
}

extension ViewContainer where Self: UIView {
    var view: UIView { self }
}
