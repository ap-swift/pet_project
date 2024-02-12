//
//  ViewModel.swift
//  LanguageCards
//
//  Created by Артем Парфенов on 03.02.2024.
//

import UIKit
import CoreData

class GameViewModel {

    var coreDataStack = CoreDataStack.shared

    func addTrueCards(dictionary: Dictionary<String,String>) {
        for element in dictionary {
            coreDataStack.addCard(englishText: element.key, spanishText: element.value, isTrue: true)
        }
    }

    func addFalseCards(dictionary: Dictionary<String,String>) {
        for element in dictionary {
            coreDataStack.addCard(englishText: element.key, spanishText: element.value, isTrue: false)
        }
    }

    func showAllCards() {
        let allCards = coreDataStack.fetchAllCards()
        for card in allCards {
            print("englishSentence: \(card.englishSentence), spanishSentence: \(card.spanishSentence)")
        }
    }

    func deleteAll() {
        coreDataStack.deleteAllData()
        print("Все удалил")
    }

    func deleteCard(uuid: UUID) {
        coreDataStack.deleteCardWithUUID(uuid: uuid)
    }

}

extension GameViewModel {

    func addAllCards() {
        deleteAll()
        addTrueCards(dictionary: ["King": "Rey", "Kingdom": "Reino", "How is it going?": "Como estas?"])
        addFalseCards(dictionary: ["King": "Reina", "Where are you?": "Que tal?", "What's your name?": "Que calor, si?"])
    }

    func arrayOfCards() -> [CardStruct] {
        let myCards = coreDataStack.fetchAllCards()
        var cardStructArray: [CardStruct] = []

        for card in myCards {
            let cardStruct = CardStruct(englishSentence: card.englishSentence, id: card.id, isTrue: card.isTrue, spanishSentence: card.spanishSentence)
            cardStructArray.append(cardStruct)
            print(card)
        }

        return cardStructArray
    }
}

struct CardStruct {
    var englishSentence: String
    var id: UUID
    var isTrue: Bool
    var spanishSentence: String
}
