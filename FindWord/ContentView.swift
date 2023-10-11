//
//  ContentView.swift
//  FindWord
//
//  Created by Daniel Bond on 18.09.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.words_number, order: .forward)]) var entity:FetchedResults<InfoEntity>
    
    @State var submit_letters:[String] = ["","","","","","",""]
    @State var submit_index:[Int] = [0,0,0,0,0,0,0]
    
    @State var current_letter = 0;
    
    @State private var fgColor:[Color] = Array(repeating: .white, count: 144)
    
    @State var letter_set:[String]
    
    @State var found_words = ""
    @State var word_number:String = "000"
    @State var error_string = ""
    @State var error_visibility:Double = 0
    
    @State var blur_radius:CGFloat = 0
    
    @State var stat_opacity:Double = 0
    
    @State var rules_opacity:Double = 0
    
    @State var starting_date:String = ""
    
    @State var words_found_today:Int = 0
    @State var three_letters_today:Int = 0
    @State var four_letters_today:Int = 0
    @State var five_letters_today:Int = 0
    @State var six_letters_today:Int = 0
    @State var seven_letters_today:Int = 0
    
    @State var games_played:Int = 0
    @State var words_found_total:Int = 0
    @State var average_words:Int = 0
    @State var max_words:Int = 0
    @State var min_words:Int = 0
    @State var three_letters_total:Int = 0
    @State var four_letters_total:Int = 0
    @State var five_letters_total:Int = 0
    @State var six_letters_total:Int = 0
    @State var seven_letters_total:Int = 0

    
    func startDatabase(){
        if entity.count == 0 {
            DataController().addEntity(
                found_words: found_words,
                letter_set: letter_set,
                words_number: word_number,
                
                words_found_today: words_found_today,
                three_letters_today: three_letters_today,
                four_letters_today: four_letters_today,
                five_letters_today: five_letters_today,
                six_letters_today: six_letters_today,
                seven_letters_today: seven_letters_today,
                
                games_played: games_played,
                words_found_total: words_found_total,
                average_words: average_words,
                max_words: max_words,
                min_words: min_words,
                three_letters_total: three_letters_total,
                four_letters_total: four_letters_total,
                five_letters_total: five_letters_total,
                six_letters_total: six_letters_total,
                seven_letters_total: seven_letters_total,
                
                context: managedObjectContext)
        } else if entity.count == 1 {
            if entity[0].letter_set == letter_set{
                found_words = entity[0].found_words!
                word_number = entity[0].words_number!
                
                words_found_today = Int(entity[0].words_found_today)
                three_letters_today = Int(entity[0].three_letters_today)
                four_letters_today = Int(entity[0].four_letters_today)
                five_letters_today = Int(entity[0].five_letters_today)
                six_letters_today = Int(entity[0].six_letters_today)
                seven_letters_today = Int(entity[0].seven_letters_today)
                
                games_played = Int(entity[0].games_played)
                words_found_total = Int(entity[0].words_found_total)
                average_words = Int(entity[0].average_words)
                max_words = Int(entity[0].max_words)
                min_words = Int(entity[0].min_words)
                three_letters_total = Int(entity[0].three_letters_total)
                four_letters_total = Int(entity[0].four_letters_total)
                five_letters_total = Int(entity[0].five_letters_total)
                six_letters_total = Int(entity[0].six_letters_total)
                seven_letters_total = Int(entity[0].seven_letters_total)

            } else {
                found_words = ""
                word_number = "000"
                
                games_played = Int(entity[0].games_played)
                words_found_total = Int(entity[0].words_found_total)
                average_words = Int(entity[0].average_words)
                max_words = Int(entity[0].max_words)
                min_words = Int(entity[0].min_words)
                three_letters_total = Int(entity[0].three_letters_total)
                four_letters_total = Int(entity[0].four_letters_total)
                five_letters_total = Int(entity[0].five_letters_total)
                six_letters_total = Int(entity[0].six_letters_total)
                seven_letters_total = Int(entity[0].seven_letters_total)
                
                if entity[0].words_found_today < entity[0].min_words {
                    min_words = Int(entity[0].words_found_today)
                }
                
                DataController().editEntity(
                        infoEntity: entity[0],
                        found_words: found_words,
                        letter_set: letter_set,
                        words_number: word_number,
                        
                        words_found_today: words_found_today,
                        three_letters_today: three_letters_today,
                        four_letters_today: four_letters_today,
                        five_letters_today: five_letters_today,
                        six_letters_today: six_letters_today,
                        seven_letters_today: seven_letters_today,
                        
                        games_played: games_played,
                        words_found_total: words_found_total,
                        average_words: average_words,
                        max_words: max_words,
                        min_words: min_words,
                        three_letters_total: three_letters_total,
                        four_letters_total: four_letters_total,
                        five_letters_total: five_letters_total,
                        six_letters_total: six_letters_total,
                        seven_letters_total: seven_letters_total,
                        
                        context: managedObjectContext)
            }
        }
    }
    
    func databaseAction(){
        if word_number == "001" {
            games_played += 1
        }
        
        average_words = Int(words_found_total / games_played)
        DataController().editEntity(
                infoEntity: entity[0],
                found_words: found_words,
                letter_set: letter_set,
                words_number: word_number,
                
                words_found_today: words_found_today,
                three_letters_today: three_letters_today,
                four_letters_today: four_letters_today,
                five_letters_today: five_letters_today,
                six_letters_today: six_letters_today,
                seven_letters_today: seven_letters_today,
                
                games_played: games_played,
                words_found_total: words_found_total,
                average_words: average_words,
                max_words: max_words,
                min_words: min_words,
                three_letters_total: three_letters_total,
                four_letters_total: four_letters_total,
                five_letters_total: five_letters_total,
                six_letters_total: six_letters_total,
                seven_letters_total: seven_letters_total,
                
                context: managedObjectContext)
    }
 
    func changeErrorString(str:String){
        if str.count > 0 {
            DispatchQueue
                .main
                .asyncAfter(
                    deadline: .now() + 0.1, execute: {
                        var next = str
                        error_string.append(next.removeFirst())
                        changeErrorString(str: next)
            })
        } else {
            DispatchQueue
                .main
                .asyncAfter(
                    deadline: .now() + 0.5, execute: {
                        error_visibility = 0
                        error_string = ""
            })
        }
    }
    
    func addLetter(letter:String, index:Int){
        if current_letter < 7 {
            submit_letters[current_letter] = letter
            submit_index[current_letter] = index
            for i in 0..<fgColor.count {
                if fgColor[i] == .green {
                    fgColor[i] = .white
                }
            }
               
            if current_letter < 6 {
                surround(index: index)
            }
            current_letter += 1
        }
    }
    func deleteLetter(){
        current_letter -= 1;
        submit_index[current_letter] = 0
        submit_letters[current_letter] = ""
        for i in 0..<fgColor.count {
            if fgColor[i] == .green {
                fgColor[i] = .white
            }
        }
        if current_letter > 0 && current_letter < 7{
            surround(index: submit_index[current_letter - 1])
        }
    }
    func surround(index:Int){
        
        if index%12 == 11 {
            if index == 11 {
                if fgColor[index - 1] != .blue {
                    fgColor[index - 1] = .green
                }
                if fgColor[index + 11] != .blue {
                    fgColor[index + 11] = .green
                }
                if fgColor[index + 12] != .blue {
                    fgColor[index + 12] = .green
                }
            } else if index == 143 {
                if fgColor[index - 1] != .blue {
                    fgColor[index - 1] = .green
                }
                if fgColor[index - 12] != .blue {
                    fgColor[index - 12] = .green
                }
                if fgColor[index - 13] != .blue {
                    fgColor[index - 13] = .green
                }
            } else {
                if fgColor[index - 12] != .blue {
                    fgColor[index - 12] = .green
                }
                if fgColor[index - 13] != .blue {
                    fgColor[index - 13] = .green
                }
                if fgColor[index - 1] != .blue {
                    fgColor[index - 1] = .green
                }
                if fgColor[index + 11] != .blue {
                    fgColor[index + 11] = .green
                }
                if fgColor[index + 12] != .blue {
                    fgColor[index + 12] = .green
                }
            }
        } else if index%12 == 0{
            if index == 0 {
                if fgColor[index + 1] != .blue {
                    fgColor[index + 1] = .green
                }
                if fgColor[index + 12] != .blue {
                    fgColor[index + 12] = .green
                }
                if fgColor[index + 13] != .blue {
                    fgColor[index + 13] = .green
                }
            } else if index == 132 {
                if fgColor[index + 1] != .blue {
                    fgColor[index + 1] = .green
                }
                if fgColor[index - 11] != .blue {
                    fgColor[index - 11] = .green
                }
                if fgColor[index - 12] != .blue {
                    fgColor[index - 12] = .green
                }
            } else {
                if fgColor[index - 11] != .blue {
                    fgColor[index - 11] = .green
                }
                if fgColor[index - 12] != .blue {
                    fgColor[index - 12] = .green
                }
                if fgColor[index + 1] != .blue {
                    fgColor[index + 1] = .green
                }
                if fgColor[index + 12] != .blue {
                    fgColor[index + 12] = .green
                }
                if fgColor[index + 13] != .blue {
                    fgColor[index + 13] = .green
                }
            }
        } else if index >= 133 && index <= 142{
            if fgColor[index + 1] != .blue {
                fgColor[index + 1] = .green
            }
            if fgColor[index - 12] != .blue {
                fgColor[index - 12] = .green
            }
            if fgColor[index - 13] != .blue {
                fgColor[index - 13] = .green
            }
            if fgColor[index - 1] != .blue {
                fgColor[index - 1] = .green
            }
            if fgColor[index - 11] != .blue {
                fgColor[index - 11] = .green
            }
        } else if index >= 1 && index <= 10{
            if fgColor[index + 1] != .blue {
                fgColor[index + 1] = .green
            }
            if fgColor[index + 12] != .blue {
                fgColor[index + 12] = .green
            }
            if fgColor[index + 13] != .blue {
                fgColor[index + 13] = .green
            }
            if fgColor[index - 1] != .blue {
                fgColor[index - 1] = .green
            }
            if fgColor[index + 11] != .blue {
                fgColor[index + 11] = .green
            }
        } else {
            if fgColor[index - 11] != .blue {
                fgColor[index - 11] = .green
            }
            if fgColor[index - 12] != .blue {
                fgColor[index - 12] = .green
            }
            if fgColor[index + 1] != .blue {
                fgColor[index + 1] = .green
            }
            if fgColor[index + 12] != .blue {
                fgColor[index + 12] = .green
            }
            if fgColor[index + 13] != .blue {
                fgColor[index + 13] = .green
            }
            if fgColor[index - 13] != .blue {
                fgColor[index - 13] = .green
            }
            if fgColor[index - 1] != .blue {
                fgColor[index - 1] = .green
            }
            if fgColor[index + 11] != .blue {
                fgColor[index + 11] = .green
            }
        }
    }
    
    var body: some View {
        
//        let plug = startDatabase()
        
        
        
        let myFont = Font
                .system(size: 24)
                .monospaced()
        
        let columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
//        let columns1: [GridItem] = [
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.adaptive(minimum: 30)),
//            GridItem(.adaptive(minimum: 30))
//        ]
        
        ZStack{
            Color(.black).ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 2){
                    HStack(){
                        Text("FindWord")
                            .font(myFont)
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()

                        Button("?") {
                            rules_opacity = 1
                            blur_radius = 2
                        } .font(.title)
                        
                        Spacer()
                        
                        Button("%") {
                            stat_opacity = 1
                            blur_radius = 2
                        } .font(.title)
                        
                    } .foregroundColor(.white)
                        .padding(3)
                
                    Divider().background()
                }
                
                
                
                LazyVGrid(columns: columns) {
                    ForEach(0..<144) {
                        index in
                        Text(letter_set[index])
                            .padding(1)
                            .foregroundColor(fgColor[index])
                            .onTapGesture {
                                if current_letter >= 1 &&
                                    fgColor[index] == .blue {
                                    if index == submit_index[current_letter - 1] {
                                        fgColor[index] = .white
                                        deleteLetter()
                                    }
                                }
                                else if fgColor[index] == .green {
                                    fgColor[index] = .blue
                                    let str:String = letter_set[index]
                                    addLetter(letter: str, index: index)
                                    //TODO change surrounding colours
                                } else if current_letter == 0 {
                                    fgColor[index] = .blue
                                    let str:String = letter_set[index]
                                    addLetter(letter: str, index: index)
                                    //TODO change surrounding colours
                                }
                            
                        }
                    }
                }
                    .font(myFont)
                    .foregroundColor(.white)
                    .textCase(Text.Case.uppercase)
                
                HStack(spacing: 3){
            
                    
                    Text(submit_letters[0]).frame(width: 30, height: 30)
                        .border(.gray)
                    Text(submit_letters[1]).frame(width: 30, height: 30)
                        .border(.gray)
                    Text(submit_letters[2]).frame(width: 30, height: 30)
                        .border(.gray)
                    Text(submit_letters[3]).frame(width: 30, height: 30)
                        .border(.gray)
                    Text(submit_letters[4]).frame(width: 30, height: 30)
                        .border(.gray)
                    Text(submit_letters[5]).frame(width: 30, height: 30)
                        .border(.gray)
                    Text(submit_letters[6]).frame(width: 30, height: 30)
                        .border(.gray)

                    
                    
                    
                    HStack (spacing:3){
                        Button("Submit"){
                            if current_letter > 2 {
                                
                                var final_word:String = ""
                                for str in submit_letters {
                                    final_word.append(str)
                                }
                                let check = vocab.contains(final_word)
                                
                                if check && !found_words.components(separatedBy: " ").contains(final_word){
//                                    found_words.append(final_word + " ")
                                    found_words = final_word + " " + found_words
                                    var i:Int = Int(word_number) ?? 0
                                    i += 1
                                    if i < 10 {
                                        word_number = "00" + String(i)
                                    } else if i >= 10 && i < 100 {
                                        word_number = "0" + String(i)
                                    } else if i >= 100 {
                                        word_number = String(i)
                                    }
                                    
                                    switch (final_word.count) {
                                    case 3:
                                        three_letters_today += 1
                                        three_letters_total += 1
                                    case 4:
                                        four_letters_today += 1
                                        four_letters_total += 1
                                    case 5:
                                        five_letters_today += 1
                                        five_letters_total += 1
                                    case 6:
                                        six_letters_today += 1
                                        six_letters_total += 1
                                    case 7:
                                        seven_letters_today += 1
                                        seven_letters_total += 1
                                    default: break
                                        
                                    }
                                    
                                    words_found_today += 1
                                    words_found_total += 1
                                    
                                    if Int(word_number) ?? 0 > max_words {
                                        max_words = Int(word_number) ?? 0
                                    }
                                    
                                    databaseAction()
                                    //                                DataController().addEntity(
                                    //                                    found_words: found_words,
                                    //                                    letter_set: letter_set,
                                    //                                    words_number: word_number,
                                    //                                    context: managedObjectContext)
                                } else if check && found_words.components(separatedBy: " ").contains(final_word){
                                    error_visibility = 1
                                    
                                    let string = "Already found"
                                    
                                    changeErrorString(str: string)
                                } else {
                                    error_visibility = 1
                                    
                                    let string = "Not eligible word"
                                    
                                    changeErrorString(str: string)
                                }
                                
                                submit_letters = Array(repeating: "", count: 7)
                                submit_index = Array(repeating: 0, count: 7)
                                current_letter = 0
                                fgColor = Array(repeating: .white, count: 144)
                            }
                        }
                        .font(Font
                            .system(size: 23)
                            .monospaced())
                        .foregroundColor(.white)
                        .frame(width: 95, height: 30)
                        .border(.gray)
                        .onAppear {
                            startDatabase()
                        }
                                                
                        Text(word_number)
                            .font(Font
                                .system(size: 25)
                                .monospaced())
                            .frame(width: 60, height: 30)
                            .border(.gray)
                            .foregroundColor(.yellow)
                    }
                    
                    
                }.foregroundColor(.blue)
                    .font(myFont)
                    .textCase(Text.Case.uppercase)
                
                
                      
                ZStack{
                    ScrollViewReader { proxy in
                           ScrollView {
                               Text(found_words)
                                   .id(1)
                                   .foregroundColor(.white)
                                   .frame(maxWidth: .infinity, alignment: .leading)
                                   .textCase(Text.Case.uppercase)
                                   .font(Font
                                       .system(size: 12)
                                       .monospaced())
                                   .scrollDisabled(false)
                           }
                           .onChange(of: found_words) { _ in
                                proxy.scrollTo(1, anchor: .bottom)
                           }
                    }
                    
                    Text(" "+error_string+" ")
                        .font(Font
                        .system(size: 23)
                        .monospaced())
                    .foregroundColor(.white)
//                    .frame(width: .infinity, height: 30)
//                    .cornerRadius(10)
//                    .overlay(RoundedRectangle(cornerRadius: 10)
//                        .stroke(.gray, lineWidth: 2))
//                    .border(.gray)
                    .background(.blue)
                    .cornerRadius(10)
                    .opacity(error_visibility)
                }
                
                Spacer()
            }
            .blur(radius: blur_radius)
            
            Color.black
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .opacity(stat_opacity/10)
                            .onTapGesture {
                                stat_opacity = 0
                                blur_radius = 0
                            }
            
            Color.black
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .opacity(rules_opacity/10)
                            .onTapGesture {
                                rules_opacity = 0
                                blur_radius = 0
                            }
        
            VStack{
                VStack(spacing: 10) {
                    HStack{
                        Spacer()
                        
                        Text(starting_date)
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .onAppear{
                                let date = Date()
                                let formatter = DateFormatter()
                                formatter.dateFormat = "dd MMM yyyy"
                                starting_date = formatter.string(from: date)
                            }
                    }
                    HStack{
                        Text("Words found:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(words_found_today))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("3 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(three_letters_today))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("4 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(four_letters_today))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("5 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(five_letters_today))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("6 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(six_letters_today))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("7 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(seven_letters_today))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        
                        Text("Total")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                    }
                    HStack{
                        Text("Games played:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(games_played))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("Words found:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(words_found_total))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("Average words:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(average_words))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("Max words:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(max_words))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("Min words:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(min_words))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("3 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(three_letters_total))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("4 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(four_letters_total))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("5 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(five_letters_total))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("6 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(six_letters_total))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    HStack{
                        Text("7 letters:")
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.white)
                            .frame(width: 160, alignment: .leading)
                            
                        Text(String(seven_letters_total))
                            .font(Font
                                .system(size: 18)
                                .monospaced())
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                }
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: 600,
                      alignment: .topLeading
                    )
                .background(.black)
                .padding(.top, 45)
                
                Spacer()
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
              )
            .opacity(stat_opacity)
            .onTapGesture {
                stat_opacity = 0
                blur_radius = 0
            }
            
            VStack{
                VStack(spacing: 10) {
                    Text("""
FindWord is a daily puzzle game. You get a set of randomly chosen 144 letters, your task is to find eligible English words 3-7 letters long.

If you like our game you may:
""")
                        .font(Font
                            .system(size: 15)
                            .monospaced())
                        .foregroundStyle(.white)
                        .padding()

                    
                    HStack{
                        Text("- rate it and write a review")
                            .font(Font
                                .system(size: 15)
                                .monospaced())
                            .foregroundStyle(.white)
                        Spacer()
                        
                        Text("Rate")
                            .font(Font
                                .system(size: 15)
                                .monospaced())
                            .foregroundStyle(.blue)
                            .frame(
                                  minWidth: 53,
                                  minHeight: 30
                                )
                            .border(.gray)
                    }.padding(.horizontal)
                    
                    HStack{
                        Text("- share it with friends and family")
                            .font(Font
                                .system(size: 15)
                                .monospaced())
                            .foregroundStyle(.white)
                        Spacer()
                        
                        Text("Share")
                            .font(Font
                                .system(size: 15)
                                .monospaced())
                            .foregroundStyle(.blue)
                            .frame(
                                  minWidth: 53,
                                  minHeight: 30
                                )
                            .border(.gray)
                    }.padding(.horizontal)
                }
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: 250,
                      alignment: .topLeading
                    )
                .background(.black)
                .padding(.top, 45)
                
                Spacer()
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
              )
            .opacity(rules_opacity)
            .onTapGesture {
                rules_opacity = 0
                blur_radius = 0
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( letter_set: Array(repeating: "A", count: 144))
    }
}


