//
//  ViewController.swift
//  CounterExample
//
//  Created by Colin Eberhardt on 04/08/2016.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

import UIKit
import ReSwift


class ViewController: UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = AppState
    
    @IBOutlet var decrementButton: UIButton!
    @IBOutlet var incrementButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.layer.borderWidth = 1
        counterLabel.layer.cornerRadius = 10
        counterLabel.layer.borderColor = UIColor.black.cgColor
        
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.setTitleColor(UIColor.black, for: .normal)
        
        incrementButton.layer.borderWidth = 1
        incrementButton.layer.borderColor = UIColor.black.cgColor
        incrementButton.setTitleColor(UIColor.black, for: .normal)
        
        decrementButton.layer.borderWidth = 1
        decrementButton.layer.borderColor = UIColor.black.cgColor
        decrementButton.setTitleColor(UIColor.black, for: .normal)
        // subscribe to state changes
        mainStore.subscribe(self)
    }
    
    func newState(state: AppState) {
        // when the state changes, the UI is updated to reflect the current state
        counterLabel.text = "\(mainStore.state.counter)"
    }
    
    // when either button is tapped, an action is dispatched to the store
    // in order to update the application state
    @IBAction func downTouch(_ sender: AnyObject) {
        mainStore.dispatch(CounterActionDecrease());
    }
    @IBAction func upTouch(_ sender: AnyObject) {
        mainStore.dispatch(CounterActionIncrease());
    }

    @IBAction func resetTouch(_ sender: Any) {
        mainStore.dispatch(CounterActionReset())
    }
}

