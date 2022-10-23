//
//  XibView.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

class XibView: UIView {
    class var nibName: String {
        String(describing: self)
    }

    @IBOutlet private var _view: UIView! {
        didSet {
            _view.frame = bounds
            addSubview(_view)
            _view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        UINib(nibName: Self.nibName, bundle: Bundle(for: Self.self))
            .instantiate(withOwner: self, options: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        UINib(nibName: Self.nibName, bundle: Bundle(for: Self.self))
            .instantiate(withOwner: self, options: nil)
    }
}
