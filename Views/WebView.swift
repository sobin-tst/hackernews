//
//  WebView.swift
//  H4ckerNexz
//
//  Created by Sobin Thomas on 06/12/21.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{

    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let safeURL = urlString {
            
            if let url = URL(string: safeURL){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
            
        }
        
    }
    
    
}
