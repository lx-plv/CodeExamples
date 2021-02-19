import UIKit

//Задача 1

enum Countries {
    case usa
    case russia
    case germany
    case japan
    case china
    case denmark
    case england
}

struct Track: Equatable {
    let name: String
    let author: String
    let lenght: TimeInterval
    let country: Countries
}

//Расширения для TimeInterval и String для быстрого перевода времени

extension TimeInterval {
    
    // Расширяем функционал TimeInterval чтобы быстро конвертировать TimeInterval из секунд в "mm:ss"
    var convertToMinutes: String {
        // Считаем левую и правую части
        let leftPart = Int(self/60)
        let rightPart = Int(self.truncatingRemainder(dividingBy: 60))
        
        // Если секунд меньше 10, добавляем префикс 0
        var prefix = ""
        rightPart < 10 ? (prefix = "0") : ()
        
        // Возвращаем строку
        return "\(leftPart):\(prefix)\(rightPart)"
    }
}

extension String {
    // Расширяем функционал String чтобы быстро конвертировать строку "mm:ss" в секунды
    var convertToSeconds: TimeInterval {
        
        let convertedTime = self.split(separator: ":")
        var leftPart: Int = 0
        var rightPart: Int = 0
        
        if let firstElement = convertedTime.first {
            leftPart = Int(firstElement)! * 60
        }
        
        if let secondElement = convertedTime.last {
            rightPart = Int(secondElement)!
        }
        
        return TimeInterval(leftPart+rightPart)
    }
    
}


class Category {
    let name: String
    private var trackList: [Track]
    var trackCount: Int { trackList.count }
    //lazy для trackCount создала эффект одноразового вычисления. При добавлении/удалении треков, свойство повторно не вычислялось, а выводило первоначальное значение
    
    init (name: String, trackList: [Track]) {
        self.name = name
        self.trackList = trackList
    }
    
    func addTrack(_ track: Track) -> Bool {
        if trackList.contains(track) {
            print("Такой трек уже есть в списке")
            return false
        } else {
            trackList.append(track)
            print("Трек \"\(track.name)\" добавлен в список \"\(name)\"")
            return true
        }
    }
    
    func removeTrack(_ track: Track) -> Bool {
        if trackList.contains(track) {
            trackList.remove(at: trackList.firstIndex(of: track)!)
            print("Трек \"\(track.name)\" удален из списка \"\(name)\"")
            return true
        } else {
            print("Такого трека нет в списке")
            return false
        }
    }
    
    func showTracks() {
        print("Список: \(name)")
        for track in trackList {
            print("\(track.author) - \(track.name) [\(track.lenght.convertToMinutes)]")
        }
        print("\n")
    }
    
    
}

let trackOne = Track(name: "The Kill", author: "Thirty Seconds to Mars", lenght: "3:52".convertToSeconds, country: .usa)
let trackTwo = Track(name: "Focus On The Sound", author: "Nephew", lenght: "4:49".convertToSeconds, country: .denmark)
let trackThree = Track(name: "Система", author: "Слот", lenght: "4:20".convertToSeconds, country: .russia)

var rock = Category(name: "Рок", trackList: [trackOne, trackTwo, trackThree])

rock.showTracks()

// Добавляем трек
rock.addTrack(trackTwo)

let trackFour = Track(name: "Beautiful Way", author: "You Me At Six", lenght: "3:45".convertToSeconds, country: .england)
rock.addTrack(trackFour)

rock.trackCount

rock.showTracks()

rock.removeTrack(trackThree)
rock.showTracks()

rock.trackCount

//Задача 2

//Создаем библиотеку с категориями
class Library {
    var categoriesList: [Category]
    init(_ list: [Category]) {
        categoriesList = list
    }
    
    //Задача 3
    //Метод, который переносит треки из одной категории в другую
    func moveTrack(track: Track, from: Category, to: Category) {
        if from.removeTrack(track) {
            to.addTrack(track) ? print("Перенос трека выполнен\n") : print("Трек уже существует в категории \"\(to.name)\"\n.")
        } else {
            print("Трек не найден в исходной категории \"\(from.name)\".\n")
        }
        
    }
}



let trackFive = Track(name: "Кислород", author: "КОПЕНGАGЕН", lenght: "3:41".convertToSeconds, country: .russia)
let trackSix = Track(name: "Бойцовский клуб", author: "LOUNA", lenght: "4:31".convertToSeconds, country: .russia)

var russianRock = Category(name: "Русский Рок", trackList: [trackThree, trackFive, trackSix])

var myLibrary = Library([rock, russianRock])

//Проверяем количество до переноса
rock.trackCount
russianRock.trackCount

myLibrary.moveTrack(track: trackSix, from: russianRock, to: rock)

//Проверяем количество после переноса
rock.trackCount
russianRock.trackCount

//Делаем ошибку
myLibrary.moveTrack(track: trackFour, from: russianRock, to: rock)

//Проверяем количество после переноса
rock.trackCount
russianRock.trackCount

//Выводим списки
rock.showTracks()
russianRock.showTracks()

