//
//  ViewController.swift
//  Task
//
//  Created by Kishore kumar on 20/11/20.
//  Copyright © 2020 Kishore kumar. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let scrollView = UIScrollView()
    var images = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg","6.jpg"]
    var menu_items = ["All", "Inner Peace", "Productivity", "Self Growth", "Etc"]
    var newY:CGFloat = 0
    let tabBarCnt = UITabBarController()
    
    
    var scView:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 10
    var index : Int = 0
    weak var selectedButton: UIButton?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
        view.backgroundColor = UIColor.white
        navigationController?.isNavigationBarHidden = true
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 84)
        let imageViewHeight:CGFloat = view.frame.size.height
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: imageViewHeight*(CGFloat)(images.count))
        view.addSubview(scrollView)
        for i in 1...images.count {

            let image = UIImage(named: "\(i).jpg")
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: newY, width: view.frame.size.width, height: imageViewHeight)
            newY = newY + CGFloat(imageViewHeight)
            scrollView.addSubview(imageView)
        }
        
        scView = UIScrollView(frame: CGRect(x: 20, y: view.frame.size.height - 140, width: view.bounds.width - 40, height: 50))
        view.addSubview(scView)
        scView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        scView.translatesAutoresizingMaskIntoConstraints = false
        scView.layer.cornerRadius = scView.frame.size.height / 2.0
        scView.layer.borderWidth = 0.0
        
        for i in 0..<menu_items.count {
            let button = UIButton()
            button.tag = i
            button.setTitle("\(menu_items[i])", for: .normal)
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 150, height: 30)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            button.layer.cornerRadius = button.frame.size.height / 2.0
            button.layer.borderWidth = 0.0
            button.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            
            scView.addSubview(button)
        }
        scView.showsHorizontalScrollIndicator = false

        scView.contentSize = CGSize(width: xOffset, height: scView.frame.height)
        
        print("nech changes required")
    }
    func configUI(){
        cubNavigationBar()
        tabBarCnt.tabBar.tintColor = UIColor.red
        createTabBarController()
    }
    func createTabBarController() {
    
        let firstVc = UIViewController()
        firstVc.title = "Home"
        firstVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "HomeTab"), tag: 0)
        
        let secondVc = UIViewController()
        secondVc.title = "Mediate"
        secondVc.tabBarItem = UITabBarItem.init(title: "Mediate", image: UIImage(named: "mediate"), tag: 1)
        
        let workoutVc = UIViewController()
        workoutVc.title = "Workout"
        workoutVc.tabBarItem = UITabBarItem.init(title: "Workout", image: UIImage(named: "workout"), tag: 2)
        
        let sleepVc = UIViewController()
        sleepVc.title = "Sleep"
        sleepVc.tabBarItem = UITabBarItem.init(title: "Sleep", image: UIImage(named: "sleep"), tag: 3)
        
        let moreVc = UIViewController()
        moreVc.title = "More"
        moreVc.tabBarItem = UITabBarItem.init(title: "More", image: UIImage(named: "more"), tag: 4)

        let controllerArray = [firstVc, secondVc, workoutVc, sleepVc, moreVc]
        tabBarCnt.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}
        
        self.view.addSubview(tabBarCnt.view)
    }
    func cubNavigationBar(){
        
    }
    @objc func buttonSelected(button : UIButton){
         if let selectedButton = self.selectedButton {
             selectedButton.backgroundColor = UIColor.clear
         }
         button.backgroundColor = UIColor.white.withAlphaComponent(0.3)
         selectedButton = button
    }
}

