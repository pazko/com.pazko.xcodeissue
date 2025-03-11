//
//  ViewController.swift
//  xcode_issue
//
//  Created by 박동혁 on 3/11/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

// MARK: issue 모음
extension MainViewController {
    private func testOpenUrl(_ urlString: String) {
        if let url = URL(string: urlString) {
//            UIApplication.shared.open(url) // XCode16, iOS 18, deprecated func 인식 아래의 func 이용
            
            UIApplication.shared.open(url, options: [:])
            
            UIApplication.shared.open(url) { result in
                if result {
                    
                }
            }
        }
    }
}

