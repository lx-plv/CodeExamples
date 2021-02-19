import UIKit

//Задача 1
print("> Задача 1\n")
//1. Создаем кортеж с именованными значениями
var iLike = (movie: "Star Wars", number: 13, food: "Манты")

//2. Создаем константы из кортежа
let (myMovie, myNumber, myFood) = iLike

//3. Создаем кортеж с именованными значениями другого человека
var otherLike =  (movie: "Джентельмены", number: 7, food: "Борщ")

//Выводим кортежи
print("iLike = \(iLike)")
print("otherLike = \(otherLike)\n")

//4. Меняем значения с помощью промежуточного кортежа
//Создаем промежуточный кортеж
var tempLike = iLike

//Переносим значения из otherLike в iLike
iLike = otherLike

//Переносим значения из временного tempLike в otherLike
otherLike = tempLike

//Выводим кортежи с новыми значениями
print("iLike = \(iLike)")
print("otherLike = \(otherLike)\n")

//Создаем новый кортеж из значений iLike и otherLike
var numbersLike = (iLike.number, otherLike.number, iLike.number-otherLike.number)

//Выводим кортежи с новыми значениями
print("numbersLike = \(numbersLike)")

//Задача 2
print("\n> Задача 2\n")

//Создаем словарь с ключом в виде имени студента и значением в виде словаря с предметами и оценками
var student = ["Иван Иванов": ["Сопромат": 4, "Информатика": 5, "Химия": 3] ]

//Выводим словарь
print(student)

//Задача 3
print("\n> Задача 3")

//1. Создаем псевдоним для типа словаря
typealias Chessman = [String: (alpha: Character, num: Int)?]

//2. Создаем 3 фигуры в словаре chessmans
var chessmans: Chessman = ["Белый Король": (alpha: "Е", num: 3), "Черный Король": (alpha: "А", num: 6), "Черная Пешка": nil]

print("> Задачу случайно сразу решил как 4*\n")
//3. Выводим состояние фигур
for figure in chessmans {
    //Проверяем наличие фигуры на поле
    if let thisFigure = figure.value {
        //Фигура существует, выводим ее и координаты
        //Получаем в константы данные о координатах
        print("\(figure.key) на клетке \(thisFigure.alpha)\(thisFigure.num)")
    } else {
        //Фигуры нет на поле. Выводим ее статус
        print("\(figure.key) убит(а)")
    }
}
