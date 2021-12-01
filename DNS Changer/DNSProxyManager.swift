//
//  DNSProxyManager.swift
//  DNS Changer
//
//  Created by Sinan Kulen on 30.11.2021.
//

import Foundation
import NetworkExtension

class DNSProxyManager {
    let manager = NEDNSProxyManager.shared()
    
    func enable() {
        loadAndUpdatePreferences { [weak self] in
            self?.manager.localizedDescription = "DNSProxySample"
            
            let dnsProtocol = NEDNSProxyProviderProtocol()
            dnsProtocol.username = ""
            dnsProtocol.providerConfiguration = ["clientId" : Constants.dohUrl]
            dnsProtocol.providerBundleIdentifier = Constants.protocolIdentifier
            
            self?.manager.providerProtocol = dnsProtocol
            self?.manager.isEnabled = true
        }
    }
    
    func disable() {
        loadAndUpdatePreferences { [weak self] in
            self?.manager.isEnabled = false
        }
    }


    private func loadAndUpdatePreferences(_ completion: @escaping () -> Void) {
        manager.loadFromPreferences { [weak self] error in
            
            guard error == nil else {
                debugPrint("DNSProxySample.App: load error")
                return
            }
            
            completion()
            
            self?.manager.saveToPreferences(completionHandler: { (error) in
                guard error == nil else {
                    debugPrint("DNSProxySample.App: save error")
                    return
                }
                
                debugPrint("DNSProxySample.App: saved")
            })
        }
    }
}
