//
//  HomeViewController.swift
//  PetMyPet
//
//  Created by Tiago Oliveira on 02/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel?
    @IBOutlet weak var swipeableCardView: SwipeableCardView!
    
    @IBOutlet weak var resetButton: PMPButton!
    
    @IBAction func panView(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: self.view)
        let card = sender.view!
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: card.center.x + point.x,
                              y: card.center.y + point.y)
        
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
                return
            } else if card.center.x > (view.frame.width - 40) {
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            }
            
//            UIView.animate(withDuration: 0.2) {
//                sender.view?.center = self.view.center
//                self.swipeableCardView.feedbackImageView.alpha = 0
//            }
            resetCards()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    func resetCards() {
        UIView.animate(withDuration: 0.2) {
            self.swipeableCardView.center = self.view.center
            self.swipeableCardView.feedbackImageView.alpha = 0
            self.swipeableCardView.alpha = 1
        }
    }
    
}
