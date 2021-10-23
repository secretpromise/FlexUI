//
//  ViewController.swift
//  example
//
//  Created by Felicity on 10/20/21.
//

import UIKit
import FlexUI
import YogaKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  @IBAction func pressAction(_ sender: Any) {
    let controller = HostingViewController {
      VStack {
        Text(verbatim: "hello world")
      }
      .alignItems(.center)
      .justifyContent(.center)
      .height(100%)
      .backgroundColor(.white)
    }
    navigationController?.pushViewController(controller, animated: true)
  }
  
}

