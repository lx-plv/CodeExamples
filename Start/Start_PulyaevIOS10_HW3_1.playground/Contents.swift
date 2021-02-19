import UIKit

//Задача 1
print("> Задача 1\n")

// Создаем массивы со списком студентов мальчиков и девочек
var studentsOne = ["John Lock", "Stieve Jobs"]
var studentsTwo = ["Jessica Alba", "Elizabeth Olsen", "Emilia Clarke"]

// Добавляем в начало первого массива студентов из второго массива
for student in studentsTwo {
    studentsOne.insert(student, at: studentsOne.startIndex)
}

//Выводим список всех студентов
print("Список всех студентов: \(studentsOne)")


//Задача 2
print("\n> Задача 2\n")

//Сортируем массив со всеми студентами в алфавитном порядке A-Z
studentsOne.sort()
//Выводим сортированный список студентов
print("Список всех студентов A-Z: \(studentsOne)")

//Сортируем массив со всеми студентами в алфавитном порядке Z-A
studentsOne.sort(by: >)
//Выводим сортированный список студентов
print("Список всех студентов Z-A: \(studentsOne)")


//Задача 3
print("\n> Задача 3\n")
//создаем массив с оценками товаров
var stars = [-5,0,-5,4,5,2,-1,-4,5,3,0,4,-1,-1,5,3,-3]

//Сортируем массив от большего к меньшему
stars.sort(by: >)

//Отфильтровываем все отрицательные значения
var filteredStars = stars.filter({ $0 >= 0 })

//Выводим положительные оценки
print("Массив положительных оценок: \(filteredStars)")

//Задача 4*
print("\n> Задача 4*\n")

var someArray = [1, 2, 3, 4, 7]

//Создаем массив для хранения индексов искомых чисел
var indexes = [Int]()

//Запускаем цикл по массиву с индексом и значением
for (index, number) in someArray.enumerated() {
    
    //Запускаем второй цикл по тому же массиву с индексом и значением для проверки сумм значений
    for (secondIndex, secondNumber) in someArray.enumerated() {
        
        //Исключаем повторяемость индексов и после проверяем сумму
        if index != secondIndex && number+secondNumber == 6 {
            //Добавляем индексы чисел в массив
            indexes.append(index)
        }
        
    }
    
}

//Выводим массив с индексами
//print(indexes)

// Выводим искомые числа с индексами
print("Искомые числа в массиве someArray:")
for i in indexes {
    print("Число \(someArray[i]) c индексом \(i)")
}


