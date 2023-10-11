//
//  InfoEntity+CoreDataProperties.swift
//  FindWord
//
//  Created by Daniel Bond on 05.10.2023.
//
//

import Foundation
import CoreData


extension InfoEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InfoEntity> {
        return NSFetchRequest<InfoEntity>(entityName: "InfoEntity")
    }

    @NSManaged public var found_words: String?
    @NSManaged public var letter_set: [String]?
    @NSManaged public var words_number: String?
    @NSManaged public var words_found_today: Int32
    @NSManaged public var three_letters_today: Int32
    @NSManaged public var four_letters_today: Int32
    @NSManaged public var five_letters_today: Int32
    @NSManaged public var six_letters_today: Int32
    @NSManaged public var seven_letters_today: Int32
    @NSManaged public var games_played: Int32
    @NSManaged public var words_found_total: Int32
    @NSManaged public var average_words: Int32
    @NSManaged public var max_words: Int32
    @NSManaged public var min_words: Int32
    @NSManaged public var three_letters_total: Int32
    @NSManaged public var four_letters_total: Int32
    @NSManaged public var five_letters_total: Int32
    @NSManaged public var six_letters_total: Int32
    @NSManaged public var seven_letters_total: Int32

}

extension InfoEntity : Identifiable {

}
