//
//  NetworkExtension.swift
//  DNS Changer
//
//  Created by Sinan Kulen on 30.11.2021.
//

import Foundation
import NetworkExtension

class DNSSettingManager {
    let manager = NEDNSSettingsManager.shared()
    
    func configure() {
        loadAndUpdatePreferences {[weak self] in
            self?.manager.localizedDescription = "DNSSettingsSample"
        }
    }
    
    func removeSettings() {
        manager.removeFromPreferences { error in
            debugPrint("DNSProxySample \(String(describing: error))")
        }
    }


    private func loadAndUpdatePreferences(_ completion: @escaping () -> Void) {
        manager.loadFromPreferences { [weak self] error in
            guard error == nil else {
                debugPrint("DNSProxySample: load error")
                return
            }
            let dohSettings = NEDNSOverHTTPSSettings(servers: ["8.8.4.4"])
            dohSettings.serverURL = URL(string: Constants.dohUrl + "dns-query")
            self?.manager.dnsSettings = dohSettings
            
            completion()
            self?.manager.saveToPreferences { (error) in
                guard error == nil else {
                    debugPrint("DNSProxySample: save error")
                    return
                }
                debugPrint("DNSProxySample: saved")
            }
        }
    }
}

