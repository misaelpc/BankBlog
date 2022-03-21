//
//  ViewController.swift
//  bankblog
//
//  Created by Misael Pérez Chamorro on 18/03/22.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    Post.fetch {
      
    } onFailure: {
      
    }
    // Do any additional setup after loading the view.
  }


}

