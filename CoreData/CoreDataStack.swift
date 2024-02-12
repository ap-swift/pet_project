//
//  CoreDataStack.swift
//  Cards
//
//  Created by Артем Парфенов on 03.02.2024.
//

import CoreData

// Define an observable class to encapsulate all Core Data-related functionality.
class CoreDataStack: ObservableObject {

    static let shared = CoreDataStack()

    private init() { }

    // Create a persistent container as a lazy variable to defer instantiation until its first use.
    lazy var persistentContainer: NSPersistentContainer = {

        // Pass the data model filename to the container’s initializer.
        let container = NSPersistentContainer(name: "LanguageCardsDataModel")

        // Load any persistent stores, which creates a store if none exists.
        container.loadPersistentStores { _, error in
            if let error {
                // Handle the error appropriately. However, it's useful to use
                // `fatalError(_:file:line:)` during development.
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        return container
    }()

}


extension CoreDataStack {

    func save() {
        // Verify that the context has uncommitted changes.
        guard persistentContainer.viewContext.hasChanges else { return }

        do {
            // Attempt to save changes.
            try persistentContainer.viewContext.save()
        } catch {
            // Handle the error appropriately.
            persistentContainer.viewContext.rollback()
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }


    func addCard(englishText: String, spanishText: String, isTrue: Bool) {
        let card = Card(context: persistentContainer.viewContext)
        card.englishSentence = englishText
        card.spanishSentence = spanishText
        card.isTrue = isTrue
        card.id = UUID()
        save()
    }

    func updateCardWithUUID(uuid: UUID, englishText: String, spanishText: String, isTrue: Bool) {
        let fetchRequest: NSFetchRequest<Card> = Card.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", uuid as CVarArg)

        do {
            if let card = try persistentContainer.viewContext.fetch(fetchRequest).first {
                card.englishSentence = englishText
                card.spanishSentence = spanishText
                card.isTrue = isTrue
                save()
            }
        } catch {
            print("Error updating card: \(error.localizedDescription)")
        }
    }

    func fetchAllCards() -> [Card] {
        do {
            let cards = try persistentContainer.viewContext.fetch(Card.fetchRequest()) as? [Card]
            return cards ?? []
        } catch {
            print("Error fetching cards: \(error.localizedDescription)")
            return []
        }
    }

    func deleteAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Card")

        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to delete all data: \(error)")
        }
    }

    func deleteCardWithUUID(uuid: UUID) {
        let fetchRequest: NSFetchRequest<Card> = Card.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", uuid as CVarArg)

        do {
            if let card = try persistentContainer.viewContext.fetch(fetchRequest).first {
                persistentContainer.viewContext.delete(card)
                save()
            }
        } catch {
            print("Error deleting card: \(error.localizedDescription)")
        }
    }

}
