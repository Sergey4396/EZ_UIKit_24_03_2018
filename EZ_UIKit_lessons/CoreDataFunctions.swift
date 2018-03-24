//
//  CoreDataFunctions.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 21.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import Foundation
import UIKit

//проверка существования объекта
func chekIfAnyEntityExist() -> Bool{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    do{
        allEntityVC6_2Array = try context.fetch(EntityVC6_2.fetchRequest()) as! [EntityVC6_2]

    } catch{
        print ("OOPS Error")
    }
  
    if allEntityVC6_2Array.count == 0 {
        return false
    }
    else {
        return true
    }
}
//создание пустых данных при первоначальной загрузке
func newEntity(){
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let entity = EntityVC6_2(context: context)
    
    let x = Float(0.5)
    entity.hue = x
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
}
//изменение оттенка
func changeCurrentHue(hue: Float){
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    do{
        allEntityVC6_2Array = try context.fetch(EntityVC6_2.fetchRequest()) as! [EntityVC6_2]

    } catch{
        print ("OOPS Error")
    }
    
    allEntityVC6_2Array[0].hue = hue
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}
//получение оттенка
func getHue() -> Float{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    do{
        allEntityVC6_2Array = try context.fetch(EntityVC6_2.fetchRequest()) as! [EntityVC6_2]
        
    } catch{
        print ("OOPS Error")
    }
    
    return allEntityVC6_2Array[0].hue
}


