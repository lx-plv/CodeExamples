import UIKit

//Задача 1
print("Задача 1\n")

//Создаем функцию, которая получает замыкание и выводит результат
func fuel(_ lenght: Double, _ weight: Double, _ closure: (Double, Double) -> Double) {
    
    let result = closure(lenght, weight)
    
    print("Понадобится \(result) тонн топлива")
}

//Алгоритм первого ученого
let firstScientist = { (lenght: Double, weight: Double) -> Double in
    return lenght*weight*35.0
}

//Алгоритм второго ученого
let secondScientist = { (lenght: Double, weight: Double) -> Double in
    return lenght*weight*355.0/10
}

fuel(3.0, 5.0, firstScientist)
fuel(3.0, 5.0, secondScientist)


//Задача 2
print("\nЗадача 2\n")


//Сокращенный алгоритм первого ученого
let firstScientistShort = { $0*$1*35.0 }

//Сокращенный алгоритм второго ученого
let secondScientistShort = { $0*$1*355.0/10 }

fuel(3.0, 5.0, firstScientistShort)
fuel(3.0, 5.0, secondScientistShort)

//Задача 3*
print("\nЗадача 3*\n")

//Часть 1
//Реализация замыкания вместо параметра
fuel(3.0, 5.0){ $0*$1*355/10*1.034-23 }

//Часть 2
func example(param: () -> Void) {
    // ...
}

//В данном случае замыкание является единственным аргументом функции, тело замыкания вышло за пределы круглых скобок и пишется в фигурных скобках, круглые скобки можно опустить
example {
    // ...
}


