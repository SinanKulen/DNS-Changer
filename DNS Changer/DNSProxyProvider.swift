//
//  DNSProxyProvider.swift
//  DNS Changer
//
//  Created by Sinan Kulen on 30.11.2021.
//

import NetworkExtension
import os

class DNSProxyProvider : NEDNSProxyProvider{
    override func startProxy(options:[String: Any]? = nil, completionHandler: @escaping (Error?) -> Void) {
        completionHandler(nil)
    }
    
    override func stopProxy(with reason: NEProviderStopReason, completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    override func sleep(completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    override func wake() {
        
    }
    
    
}

