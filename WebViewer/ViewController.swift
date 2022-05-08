//
//  ViewController.swift
//  WebViewer
//
//  Created by 堅書 on 2022/05/08.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var statusBarBackgroundView: UIView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        let color = statusBarBackgroundView.backgroundColor?.rgba
        let r = color!.red * 255 * 0.299
        let g = color!.green * 255 * 0.587
        let b = color!.blue * 255 * 0.114
        if r + g + b > 186 {
            return .darkContent
        } else {
            return .lightContent
        }
    }
    
    var url: URL = URL(string: "https://www.apple.com")!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        
        if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist"),
           let dictionary: NSDictionary = NSDictionary(contentsOfFile: path),
           let homeURL: String = dictionary.value(forKey: "Home") as? String,
           let url = NSURL(string: homeURL) {
            self.url = url as URL
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            UIView.animate(withDuration: 0.25, delay: 0) { [self] in
                statusBarBackgroundView.backgroundColor = webView.colorOfPoint(point: .init(x: 0, y: 0))
                setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        UIView.animate(withDuration: 0.25, delay: 0) { [self] in
            statusBarBackgroundView.backgroundColor = .systemRed
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIView.animate(withDuration: 0.25, delay: 0) { [self] in
            statusBarBackgroundView.backgroundColor = .systemBlue
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
}

