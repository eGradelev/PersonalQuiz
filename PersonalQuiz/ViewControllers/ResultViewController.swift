//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    var answerChosen: [Answer]!
    
    
    @IBOutlet var animalResult: UILabel!
    
    @IBOutlet var animalDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        getResultOfTest()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getResultOfTest () {
        var animals: [Animal] = []
        var cats = 0
        var dogs = 0
        var rabbits = 0
        var turtles = 0
        for animal in answerChosen {
            animals.append(animal.animal)
        }
        for animal in animals {
            if animal.rawValue == Animal.cat.rawValue {
                cats += 1
            } else if animal.rawValue == Animal.dog.rawValue {
                dogs += 1
            } else if animal.rawValue == Animal.rabbit.rawValue {
                rabbits += 1
            } else if animal.rawValue == Animal.turtle.rawValue {
                turtles += 1
            }
        }
        if cats >= dogs && cats >= rabbits && cats >= turtles {
            animalResult.text = "Вы - \(Animal.cat.rawValue)"
            animalDescription.text = "\(Animal.cat.definition)"
        } else if dogs >= cats && dogs >= rabbits && dogs >= turtles {
            animalResult.text = "Вы - \(Animal.dog.rawValue)"
            animalDescription.text = "\(Animal.dog.definition)"
        } else if rabbits >= cats && rabbits >= dogs && rabbits >= turtles {
            animalResult.text = "Вы - \(Animal.rabbit.rawValue)"
            animalDescription.text = "\(Animal.rabbit.definition)"
        } else if turtles >= cats && turtles >= dogs && turtles >= rabbits {
            animalResult.text = "Вы - \(Animal.turtle.rawValue)"
            animalDescription.text = "\(Animal.turtle.definition)"
        }
    }
}
