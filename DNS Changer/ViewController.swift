//
//  ViewController.swift
//  DNS Changer
//
//  Created by Sinan Kulen on 30.11.2021.
//

import UIKit
import NetworkExtension

class ViewController: UIViewController {

    let dnsSettingManager = DNSSettingManager()
    let proxyManager = DNSProxyManager()
    
    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeButtonClicked(_ sender: Any) {
        proxyManager.enable()
    }
    @IBAction func offButtonClicked(_ sender: Any) {
        proxyManager.disable()
    }
}


