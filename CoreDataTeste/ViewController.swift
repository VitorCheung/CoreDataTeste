//
//  ViewController.swift
//  CoreDataTeste
//
//  Created by Vitor Cheung on 23/08/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Intervalo", in: context)
        let newIntervalo = NSManagedObject(entity: entity!, insertInto: context)
        newIntervalo.setValue(20, forKey: "lanche")
        do {
          try context.save()
         } catch {
          print("Error saving")
        }
        fetch(context: context)
        // Do any additional setup after loading the view.
    }
    
    func fetch(context:NSManagedObjectContext){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Intervalo")
                //request.predicate = NSPredicate(format: "age = %@", "21")
        request.returnsObjectsAsFaults = false
        do {
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject]
        {
                        print(data.value(forKey: "lanche") as Any )
          }

               } catch {

                   print("Failed")
        }
    }


}

