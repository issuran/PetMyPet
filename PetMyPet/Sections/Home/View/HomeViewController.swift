//
//  HomeViewController.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 02/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    @IBOutlet weak var swipeableCardView: SwipeableCardView!
    
    @IBOutlet weak var nextSwipeableCardView: SwipeableCardView!
    
    @IBOutlet weak var emptyView: UIView!
        
    @IBOutlet weak var resetButton: PMPButton!
        
    // Menu
    @IBOutlet weak var menuHideConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuView: UIView!
        
    var divisor: CGFloat!
    
    var last = false
    
    var blurredEffectView: UIVisualEffectView!
    
    func drawCurrentCard() {
        if let image = viewModel.cardImage(forItemAtIndex: viewModel.current) {
            swipeableCardView.animalImageView.image = image
            viewModel.current += 1
        }
    }
    
    func drawNextCard() {
        if let image = viewModel.cardImage(forItemAtIndex: viewModel.current) {
            nextSwipeableCardView.animalImageView.image = image
        } else {
            last = true
            nextSwipeableCardView.isHidden = true
            emptyView.isHidden = false
        }
    }
    
    func swipedToNext() {
        if !last {
            self.swipeableCardView.isHidden = true
            
            UIView.animate(withDuration: 0.5, animations: {
                self.swipeableCardView.transform = .identity
                self.swipeableCardView.center = self.view.center
                self.swipeableCardView.feedbackImageView.alpha = 0
                self.swipeableCardView.alpha = 1
            }) { _ in
                self.swipeableCardView.isHidden = false
                self.drawCurrentCard()
                self.drawNextCard()
            }
        } else {
            self.swipeableCardView.isHidden = true
        }
    }
    
    @IBAction func panView(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: self.view)
        let card = sender.view!
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: card.center.x + point.x,
                              y: card.center.y + point.y)
        
        let scale = min(100 / abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)
            .scaledBy(x: scale, y: scale)
        
        if xFromCenter > 0 {
            swipeableCardView.feedbackImageView.image = #imageLiteral(resourceName: "Happy")
            swipeableCardView.feedbackImageView.tintColor = .green
        } else {
            swipeableCardView.feedbackImageView.image = #imageLiteral(resourceName: "Sad")
            swipeableCardView.feedbackImageView.tintColor = .red
        }
        
        swipeableCardView.feedbackImageView.alpha = abs(xFromCenter) / view.center.x
        
        sender.setTranslation(CGPoint(x: 0, y: 0), in: card)
        
        if sender.state == .ended {
            
            if card.center.x < 40 {
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                swipedToNext()
                return
            } else if card.center.x > (view.frame.width - 40) {
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                swipedToNext()
                return
            }
            
            resetCards()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // size of the screen / 2 to find middle value of the screen, then divide to the degrees expected to be the divisor for rotate based on the x from center
        divisor = (view.frame.width / 2) / 0.30
        drawCurrentCard()
        drawNextCard()
        swipeableCardView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        menuView.isHidden = false
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func resetAction(_ sender: Any) {
        resetCards()
        viewModel.current = 0
        swipeableCardView.isHidden = false
        nextSwipeableCardView.isHidden = false
        last = false
        
        drawCurrentCard()
        drawNextCard()
    }
    
    @IBAction func openMenu(_ sender: Any) {
        menuHideConstraint.constant = 0

        swipeableCardView.isUserInteractionEnabled = false
        
        let blurEffect = UIBlurEffect(style: .light)
        blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = swipeableCardView.bounds
        swipeableCardView.addSubview(blurredEffectView)
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func closeMenu(_ sender: Any) {
        menuHideConstraint.constant = -250
        
        swipeableCardView.isUserInteractionEnabled = true
        blurredEffectView.removeFromSuperview()
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func resetCards() {
        UIView.animate(withDuration: 0.2) {
            self.swipeableCardView.transform = .identity
            self.swipeableCardView.center = self.view.center
            self.swipeableCardView.feedbackImageView.alpha = 0
            self.swipeableCardView.alpha = 1
        }
    }
}

extension HomeViewController: CustomSwipeableButtonsProtocol {
    func yesClicked() {
        UIView.animate(withDuration: 0.7, animations: {
            self.swipeableCardView.feedbackImageView.alpha = 1
            self.swipeableCardView.feedbackImageView.image = #imageLiteral(resourceName: "Happy")
            self.swipeableCardView.feedbackImageView.tintColor = .green
        }) { (_) in
            self.swipeableCardView.feedbackImageView.alpha = 0
            self.swipedToNext()
        }
    }
    
    func noClicked() {
        UIView.animate(withDuration: 0.7, animations: {
            self.swipeableCardView.feedbackImageView.alpha = 1
            self.swipeableCardView.feedbackImageView.image = #imageLiteral(resourceName: "Sad")
            self.swipeableCardView.feedbackImageView.tintColor = .red
        }) { (_) in
            self.swipeableCardView.feedbackImageView.alpha = 0
            self.swipedToNext()
        }
    }
}
