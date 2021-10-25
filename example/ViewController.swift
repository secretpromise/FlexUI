//
//  ViewController.swift
//  example
//
//  Created by Felicity on 10/20/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  @IBAction func pressAction(_ sender: Any) {
    let a = Text("").buttonStyle(DefaultButtonStyle.automatic)
    print(type(of: a))
  }
//  func pushText() {
//    let controller = HostingViewController {
//      VStack {
//        Text(verbatim: "hello world")
//      }
//      .yoga {
//        .alignItems(.center)
//        .justifyContent(.center)
//        .height(100%)
//      }
//      .cocoa {
//        .backgroundColor(.white)
//      }
//    }
//    navigationController?.pushViewController(controller, animated: true)
//  }
  
}

