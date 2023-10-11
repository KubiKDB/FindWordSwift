//
//  DataController.swift
//  FindWord
//
//  Created by Daniel Bond on 01.10.2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let container = NSPersistentContainer(name: "Database")
    
    init() {
        DataController.container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Saved")
        } catch {
            print("Not saved")
        }
    }
    
    func addEntity(
        found_words:String,
        letter_set:[String],
        words_number:String,
        words_found_today:Int,
        three_letters_today:Int,
        four_letters_today:Int,
        five_letters_today:Int,
        six_letters_today:Int,
        seven_letters_today:Int,
        games_played:Int,
        words_found_total:Int,
        average_words:Int,
        max_words:Int,
        min_words:Int,
        three_letters_total:Int,
        four_letters_total:Int,
        five_letters_total:Int,
        six_letters_total:Int,
        seven_letters_total:Int,
        context:NSManagedObjectContext
    ){
        let infoEntity = InfoEntity(context: context)
        infoEntity.found_words = found_words
        infoEntity.letter_set = letter_set
        infoEntity.words_number = words_number
        
        infoEntity.words_found_today = Int32(words_found_today)
        infoEntity.three_letters_today = Int32(three_letters_today)
        infoEntity.four_letters_today = Int32(four_letters_today)
        infoEntity.five_letters_today = Int32(five_letters_today)
        infoEntity.six_letters_today = Int32(six_letters_today)
        infoEntity.seven_letters_today = Int32(seven_letters_today)

        infoEntity.games_played = Int32(games_played)
        infoEntity.words_found_total = Int32(words_found_total)
        infoEntity.average_words = Int32(average_words)
        infoEntity.max_words = Int32(max_words)
        infoEntity.min_words = Int32(min_words)
        infoEntity.three_letters_total = Int32(three_letters_total)
        infoEntity.four_letters_total = Int32(four_letters_total)
        infoEntity.five_letters_total = Int32(five_letters_total)
        infoEntity.six_letters_total = Int32(six_letters_total)
        infoEntity.seven_letters_total = Int32(seven_letters_total)
        
        save(context: context)
    }
    
    func editEntity(
        infoEntity:InfoEntity,
        found_words:String,
        letter_set:[String],
        words_number:String,
        words_found_today:Int,
        three_letters_today:Int,
        four_letters_today:Int,
        five_letters_today:Int,
        six_letters_today:Int,
        seven_letters_today:Int,
        games_played:Int,
        words_found_total:Int,
        average_words:Int,
        max_words:Int,
        min_words:Int,
        three_letters_total:Int,
        four_letters_total:Int,
        five_letters_total:Int,
        six_letters_total:Int,
        seven_letters_total:Int,
        context:NSManagedObjectContext
    ){
        infoEntity.found_words = found_words
        infoEntity.letter_set = letter_set
        infoEntity.words_number = words_number
        
        infoEntity.words_found_today = Int32(words_found_today)
        infoEntity.three_letters_today = Int32(three_letters_today)
        infoEntity.four_letters_today = Int32(four_letters_today)
        infoEntity.five_letters_today = Int32(five_letters_today)
        infoEntity.six_letters_today = Int32(six_letters_today)
        infoEntity.seven_letters_today = Int32(seven_letters_today)

        infoEntity.games_played = Int32(games_played)
        infoEntity.words_found_total = Int32(words_found_total)
        infoEntity.average_words = Int32(average_words)
        infoEntity.max_words = Int32(max_words)
        infoEntity.min_words = Int32(min_words)
        infoEntity.three_letters_total = Int32(three_letters_total)
        infoEntity.four_letters_total = Int32(four_letters_total)
        infoEntity.five_letters_total = Int32(five_letters_total)
        infoEntity.six_letters_total = Int32(six_letters_total)
        infoEntity.seven_letters_total = Int32(seven_letters_total)
        
        save(context: context)
    }
}
