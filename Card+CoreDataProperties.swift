//
//  Card+CoreDataProperties.swift
//  LanguageCards
//
//  Created by Артем Парфенов on 06.02.2024.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var englishSentence: String
    @NSManaged public var id: UUID
    @NSManaged public var isTrue: Bool
    @NSManaged public var spanishSentence: String

}

extension Card : Identifiable {

}
