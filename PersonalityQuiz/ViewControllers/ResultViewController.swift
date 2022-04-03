//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answersChosen: [Answer]!
    
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var textAboutAnimal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        labelResult.text = "Вы - \(getAnimal().rawValue)"
        textAboutAnimal.text = getAnimal().definition
    }
}


extension ResultViewController {
    
    private func getAnimal() -> Animal {
        
        var resultAnswer: Animal!
        
        var numberOfDog = 0
        var numberOfCat = 0
        var numberOfRabbit = 0
        var numberOfTurtle = 0
        
        var countOfAnimalsOfArray: [Animal: Int] = [:]
        
        for answersChosen in answersChosen {
            switch answersChosen.animal {
            case .dog:
                numberOfDog += 1
                countOfAnimalsOfArray.updateValue(numberOfDog, forKey: .dog)
            case .cat:
                numberOfCat += 1
                countOfAnimalsOfArray.updateValue(numberOfCat, forKey: .cat)
            case .rabbit:
                numberOfRabbit += 1
                countOfAnimalsOfArray.updateValue(numberOfRabbit, forKey: .rabbit)
            case .turtle:
                numberOfTurtle += 1
                countOfAnimalsOfArray.updateValue(numberOfTurtle, forKey: .turtle)
            }
        }
        
        let sortedCountAnimals = countOfAnimalsOfArray.sorted {$0.value > $1.value}
        if let mostTimeRepeat = sortedCountAnimals.first?.key {
            resultAnswer = mostTimeRepeat
        }
        return resultAnswer
    }
}
