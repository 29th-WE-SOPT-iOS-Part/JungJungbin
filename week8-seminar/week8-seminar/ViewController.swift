//
//  ViewController.swift
//  week8-seminar
//
//  Created by 1v1 on 2021/12/18.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "seminar8-sample")
        animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        
        return animationView
    }()
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lottieView)
//        initAnimator()
    }
    
//    func initAnimator() {
//        animator = UIViewPropertyAnimator(duration: 3, curve: .easeInOut, animations: {
//            self.targetView.frame = CGRect(x: self.view.center.x - 50, y: self.view.center.y - 50, width: 100, height: 100)
//        })
//
//        animator?.addAnimations {
//            self.targetView.backgroundColor = .orange
//        }
//
//        animator?.addCompletion({ position in
//            print(position.rawValue)
//            print("completion 블록 호출됨")
//        })
//    }
    
    @IBAction func tapStartBtn(_ sender: Any) {
//        animator?.startAnimation()
//        animator?.addAnimations {
//            print("새로운 애니메이션 추가")
//        }
        lottieView.isHidden = false
        lottieView.play()
    }
    
    @IBAction func tapPauseBtn(_ sender: Any) {
//        animator?.pauseAnimation()
        lottieView.pause()
    }
    
    @IBAction func tapStopBtn(_ sender: Any) {
//        animator?.stopAnimation(true)
        lottieView.isHidden = true
        lottieView.stop()
//        animator?.stopAnimation(false)
//        animator?.finishAnimation(at: .current)
    }
}

