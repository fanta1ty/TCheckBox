//
//  ViewController.swift
//  TCheckBox
//
//  Created by thinhnguyen12389 on 08/02/2022.
//  Copyright (c) 2022 thinhnguyen12389. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var contentView = ContentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.checkBox.checkButton.addTarget(self, action: #selector(handleCheckBtn), for: .touchDown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func loadView() {
        view = contentView
    }
}

extension ViewController {
    @objc func handleCheckBtn() {
        contentView.checkBox.checkButton.isSelected.toggle()
    }
}
