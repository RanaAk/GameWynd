//
//  WebView.swift
//  GameWynd
//
//  Created by RANA  on 22/10/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url : URL?
    
    func makeUIView(context: Context) -> some WKWebView{
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        
        let config =  WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        
        return WKWebView(frame: .zero, configuration: config)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let _url = url else {
            return
        }
        
        let request = URLRequest(url: _url)
        uiView.load(request)
    }
}
