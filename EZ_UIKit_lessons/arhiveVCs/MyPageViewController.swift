//
//  MyPageViewController.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 18.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {

    var cars = [CarHelper]()
    
    let first = UIImage(named: "fry")
    let second = UIImage(named: "simpson")
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.title = "Cars?"
        
        let firstImg = CarHelper(name: "Its Fry", image: first!)
        let secondtImg = CarHelper(name: "Its S", image: second!)
        
        cars.append(firstImg)
        cars.append(secondtImg)
    }
    
    //Mark: create VC
    
   lazy var arrayCarViewController: [VC20_1] = {
       var carsVC = [VC20_1]()
        for car in cars{
            carsVC.append(VC20_1(carWith: car))
        }
       return carsVC
    }()
    
    //Mark: - init UIPageViewController
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = .green
        self.dataSource = self
        self.delegate = self
        setViewControllers([arrayCarViewController[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}

extension MyPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        guard let viewController = viewController as? VC20_1 else {return nil}
        if let index = arrayCarViewController.index(of: viewController){
        if index > 0 {
            return arrayCarViewController[index - 1]
        }
        }
        return nil
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
         guard let viewController = viewController as? VC20_1 else {return nil}
        if let index = arrayCarViewController.index(of: viewController){
            if index < cars.count - 1 {
                return arrayCarViewController[index + 1]
            }
        }
        return nil
    }
    
     func presentationCount(for pageViewController: UIPageViewController) -> Int{
    return cars.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
