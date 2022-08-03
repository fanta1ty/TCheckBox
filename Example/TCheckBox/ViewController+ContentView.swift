//
//  ViewController+ContentView.swift
//  TCheckBox_Example
//
//  Created by Nguyen, Thinh on 02/08/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import TCheckBox

extension ViewController {
    final class ContentView: UIView {
        private lazy var stackView = UIStackView(arrangedSubviews: [
            checkBox
        ])
        
        let checkBox = TCheckBox()
        
        init() {
            super.init(frame: .zero)
            addSubviews()
            setupSubviews()
            setupLayout()
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) { nil }
    }
}

extension ViewController.ContentView {
    private func addSubviews() {
        addSubview(stackView)
    }
    
    private func setupSubviews() {
        backgroundColor = .white
        
        /// stackView
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.isLayoutMarginsRelativeArrangement = true
        
        /// checkBox
        checkBox.contentLabel.text = "Hello TCheckBox. I understand that TCheckBox is a component used to allow a user to make multiple choices that are broadly used in forms and surveys. TCheckBoxes are used to select one or several options in a list"
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 40)
        ])
    }
}
