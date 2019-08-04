//
//  ViewController.swift
//  ParalaxEffectProject
//
//  Created by alekseykolesnik on 28/05/2019.
//  Copyright © 2019 alekseykolesnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let images = [UIImage(named: "05"), UIImage(named: "06"), UIImage(named: "07"), UIImage(named: "08"), UIImage(named: "09")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.layoutIfNeeded()
        setupScrollView()
    }

    private func setupScrollView() {
        
        scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(images.count)
        scrollView.backgroundColor = .green
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.bounces = false
        
        for (i, image) in images.enumerated() {
            
            let view = ParallaxView()
            
            view.frame = CGRect(x: self.scrollView.frame.width * CGFloat(i), y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
            
            view.imageView.image = image
            view.tag = i + 10
            self.scrollView.addSubview(view)
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let temp = 200 / scrollView.frame.width
        
        for i in 0 ..< images.count {
            let parallaxView = scrollView.viewWithTag(i + 10) as! ParallaxView
            let newX: CGFloat = temp * (scrollView.contentOffset.x - CGFloat(i) * scrollView.frame.width)
            parallaxView.imageView.frame = CGRect(x: newX, y: parallaxView.imageView.frame.origin.y, width: parallaxView.imageView.frame.width, height: parallaxView.imageView.frame.height)
        }
    }
}



