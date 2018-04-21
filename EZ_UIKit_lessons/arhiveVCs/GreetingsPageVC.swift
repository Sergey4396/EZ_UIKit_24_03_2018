//
//  GreetingsPageVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class GreetingsPageVC: UIPageViewController {

    var greetings = [GreetingsHelper]()
    
    let first = UIImage(named: "fry")
    let second = UIImage(named: "simpson")
    let third = UIImage(named: "pooh")
    override func viewDidLoad() {
        super.viewDidLoad()
        
let text1 =
"""
Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.
"""
        let text2 =
"""
Многие думают, что Lorem Ipsum - взятый с потолка псевдо-латинский набор слов, но это не совсем так. Его корни уходят в один фрагмент классической латыни 45 года н.э., то есть более двух тысячелетий назад. Ричард МакКлинток, профессор латыни из колледжа Hampden-Sydney, штат Вирджиния, взял одно из самых странных слов в Lorem Ipsum, "consectetur", и занялся его поисками в классической латинской литературе. В результате он нашёл неоспоримый первоисточник Lorem Ipsum в разделах 1.10.32 и 1.10.33 книги "de Finibus Bonorum et Malorum" ("О пределах добра и зла"), написанной Цицероном в 45 году н.э. Этот трактат по теории этики был очень популярен в эпоху Возрождения. Первая строка Lorem Ipsum, "Lorem ipsum dolor sit amet..", происходит от одной из строк в разделе 1.10.32

Классический текст Lorem Ipsum, используемый с XVI века, приведён ниже. Также даны разделы 1.10.32 и 1.10.33 "de Finibus Bonorum et Malorum" Цицерона и их английский перевод, сделанный H. Rackham, 1914 год.
"""
        let text3 =
"""
Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).
"""
        let text4 =
        """
Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или "невозможных" слов.
"""
        
        
        let firstGreeting = GreetingsHelper(name: "Что такое Lorem Ipsum?", image: first!, text: text1)
        let secondGreeting = GreetingsHelper(name: "Откуда он появился?", image: second!, text: text2)
        let thirdGreeting = GreetingsHelper(name: "Почему он используется?", image: third!, text: text3)
        let fourthGreeting = GreetingsHelper(name: "Где его взять?", image: third!, text: text4)
        
        greetings.append(firstGreeting)
        greetings.append(secondGreeting)
        greetings.append(thirdGreeting)
        greetings.append(fourthGreeting)
    }
    
    //Mark: create VC
    
    lazy var greetingsViewControllersArray: [VC20_2] = {
        var greetingsVCArray = [VC20_2]()
        for greeting in greetings{
            greetingsVCArray.append(VC20_2(greetingWith: greeting))
        }
        return greetingsVCArray
    }()
    
    //Mark: - init UIPageViewController
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        self.view.backgroundColor = .red
        self.dataSource = self
        self.delegate = self
        setViewControllers([greetingsViewControllersArray[0]], direction: .forward, animated: true, completion: nil)
        
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = .gray
        appearance.currentPageIndicatorTintColor = .white
//        appearance.backgroundColor = UIColor.darkGray
        

        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    
}

extension GreetingsPageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        guard let viewController = viewController as? VC20_2 else {return nil}
        if let index = greetingsViewControllersArray.index(of: viewController){
            if index > 0 {
                return greetingsViewControllersArray[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        guard let viewController = viewController as? VC20_2 else {return nil}
        if let index = greetingsViewControllersArray.index(of: viewController){
            
            if index < greetings.count - 1 {
                return greetingsViewControllersArray[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int{
        return greetings.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
   
}

