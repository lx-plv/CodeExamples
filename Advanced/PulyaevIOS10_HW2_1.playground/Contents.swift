import UIKit

//Задача 1
print("> Задача 1\n")

//Создаем класс телевизора
class SimpleTV {
    let model: String
    fileprivate var on: Bool = false
    fileprivate var channel: UInt8 = 1
    
    init(model: String) {
        self.model = model
    }
    
    //Создаем функцию вывода статуса
    func status() {
        let onMessage = "Телевизор \(model) включен на \(channel) канале"
        let offMessage = "Телевизор \(model) выключен"
        on ? print(onMessage) : print(offMessage)
    }
    
    //Создаем функцию включения/выключения
    func onOff() {
        on ? (on = false) : (on = true)
    }
    
    //Создаем функцию выбора канала
    func selectChannel(_ newChannel: UInt8) {
        channel = newChannel
    }

}

let firstTV = SimpleTV(model: "Netology First")

firstTV.status()
firstTV.onOff()
firstTV.status()
firstTV.selectChannel(8)
firstTV.status()
firstTV.onOff()
firstTV.status()


//Задача 2
print("\n> Задача 2\n")
class AdvancedTV: SimpleTV {
    var settings = Settings()
    
    //Переопределяем функцию вывода статуса
    override func status() {
        let onMessage = "Телевизор \(model) включен на \(channel) канале, громкость: \(settings.volume), режим: \(settings.mode.rawValue)"
        let offMessage = "Телевизор \(model) выключен"
        on ? print(onMessage) : print(offMessage)
    }
}

enum Mode: String {
    case color = "Цветной"
    case grayscale = "Чёрно-белый"
}

enum VolumeButton {
    case up
    case down
}

struct Settings {
    //Назначаем настройки по-умолчанию для нового ТВ
    fileprivate var volume: Float16 = 0.1
    fileprivate var mode: Mode = .color
    
    //Функция изменения громкости
    mutating func changeVolume(_ button: VolumeButton) {
        if button == .up && volume < 1 {
            volume += 0.1
        } else if button == .down && volume > 0 {
            volume -= 0.1
        } else if volume == 0 {
            print("Установлена минимальная громкость")
        } else {
            print("Установлена максимальная громкость")
        }
    }
    
    //Функция изменения цветового режима
    mutating func colorMode() {
        mode == .color ? (mode = .grayscale) : (mode = .color)
    }
}

var secondTV = AdvancedTV(model: "Netology Second")

secondTV.status()
secondTV.onOff()
secondTV.settings.changeVolume(.up)
secondTV.status()



//Задача 3*
print("\n> Задача 3*\n")

//Создаем перечисление с источниками сигнала
enum Source: String {
    case antenna = "Антенна"
    case videoInput = "Видеовход"
}

//Cоздаем протокол получения сигнала из источника
protocol VideoSource {
    var source: Source { get set }
}

//Создаем расширение для протокола с возможностью менять источник сигнала
extension VideoSource {
    mutating func changeSource() {
        source == .antenna ? (source = .videoInput ) : (source = .antenna )
    }
}

class AllNewTV: AdvancedTV, VideoSource {
    //Назначаем источник по-умолчанию для нового ТВ
    var source: Source = .antenna
    
    //Переопределяем функцию вывода статуса
    override func status() {
        let onMessage = "Телевизор \(model) включен на \(channel) канале, громкость: \(settings.volume), режим: \(settings.mode.rawValue), источник сигнала: \(source.rawValue)"
        let offMessage = "Телевизор \(model) выключен"
        on ? print(onMessage) : print(offMessage)
    }
}

var thirdTV = AllNewTV(model: "Netollogy Future")

thirdTV.status()
thirdTV.onOff()
thirdTV.status()
thirdTV.changeSource()
thirdTV.status()
