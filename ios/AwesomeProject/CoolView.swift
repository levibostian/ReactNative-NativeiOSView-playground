//
//  CoolView.swift
//  AwesomeProject
//
//  Created by Levi Bostian on 4/30/24.
//

import Foundation
import UIKit
import React

class CoolView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
 
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
 
  private func setupView() {
    self.addSubview(valueLabel)
    self.addSubview(buttonsView)
    
    buttonsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
      .isActive = true
    buttonsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
      .isActive = true
    buttonsView.heightAnchor.constraint(equalToConstant: 48)
      .isActive = true
    
    buttonsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
      .isActive = true
    
    buttonsView.addArrangedSubview(leftButton)
    buttonsView.addArrangedSubview(rightButton)
    
    setupEvents()
  }
  
  private func setupEvents() {
    let leftButtonTap = UITapGestureRecognizer(
      target: self,
      action: #selector(pressLeftButton)
    )
    leftButton.addGestureRecognizer(leftButtonTap)
    
    let rightButtonTap = UITapGestureRecognizer(
      target: self,
      action: #selector(pressRightButton)
    )
    rightButton.addGestureRecognizer(rightButtonTap)
  }
  
  
  
  let valueLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textAlignment = .center
    label.font = label.font.withSize(36)
    label.autoresizingMask = [.flexibleWidth, .flexibleHeight] // 화면의 중앙에 숫자 보여주기
    return label
  }()
  
  let buttonsView: UIStackView = {
    let view = UIStackView()
    view.axis = .horizontal
    view.distribution = .fillEqually
    view.spacing = 8
    view.alignment = .fill
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let leftButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.setTitle("Button", for: .normal)
    button.showsTouchWhenHighlighted = true

    return button
  }()

  let rightButton: UIButton = {
    let button = UIButton()
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.setTitle("Button", for: .normal)
    button.showsTouchWhenHighlighted = true
  
    return button
  }()
  
  
  @objc func setValue(_ val: NSNumber) {
    valueLabel.text = val.stringValue
  }
  
  @objc func setLeftButtonText(_ val: NSString) {
    leftButton.setTitle(val as String, for: .normal)
  }
  
  @objc func setRightButtonText(_ val: NSString) {
    rightButton.setTitle(val as String, for: .normal)
  }
  
  @objc var onPressLeftButton: RCTDirectEventBlock?
  @objc var onPressRightButton: RCTDirectEventBlock?
  
  @objc func pressLeftButton(sender: UIButton) {
    if onPressLeftButton == nil {
      return
    }
    let event = [AnyHashable: Any]()
    onPressLeftButton!(event)
  }

  @objc func pressRightButton(sender: UIButton) {
    if onPressRightButton == nil {
      return
    }
    let event = [AnyHashable: Any]()
    onPressRightButton!(event)
  }
}


