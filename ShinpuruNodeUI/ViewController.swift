//
//  ViewController.swift
//  ShinpuruNodeUI
//
//  Created by Simon Gladman on 01/09/2015.
//  Copyright © 2015 Simon Gladman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SNDelegate
{
    let shinpuruNodeUI: SNView = SNView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        view.addSubview(shinpuruNodeUI)
        
        let one = DemoNode(name: "One", position: CGPoint(x: 10, y: 10), value: DemoNodeValue.Number(1))
        
        let two = DemoNode(name: "Two", position: CGPoint(x: 20, y: 150), value: DemoNodeValue.Number(2))
        
        let result = DemoNode(name: "Result", position: CGPoint(x: 170, y: 70), type: DemoNodeType.Addition, inputs: [one, two])
        
        shinpuruNodeUI.nodeDelegate = self 
        
        shinpuruNodeUI.nodes = [one, two, result]
    }

    // MARK: SNDelegate
    
    func itemRenderer(view:SNView) -> SNItemRenderer
    {
        return DemoRenderer()
    }
    
    func nodeMoved(view: SNView, node: SNNode)
    {
        // handle a node move - save to CoreData?
    }
 
    // MARK: System layout
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        shinpuruNodeUI.frame = view.bounds.insetBy(dx: 20, dy: 20)
    }
    
}
