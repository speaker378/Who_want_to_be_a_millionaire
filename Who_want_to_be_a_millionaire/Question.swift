//
//  Question.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 16.12.2021.
//

import Foundation

struct Question {
    let question: String
    let answerOptions: [Answer]
}

struct Answer {
    let text: String
    let truth: Bool
    
    init(_ text: String, _ truth: Bool = false) {
        self.text = text
        self.truth = truth
    }
}

struct Questions {
    
    private init() {  }
    
    static let shared: [Question] = [
        Question(
            question: "Кем был мужчина, послуживший моделью для известной картины «Американская готика» Гранта Вуда?",
            answerOptions: [
                Answer("Коммивояжером"),
                Answer("Местным шерифом"),
                Answer("Его зубным врачом", true),
                Answer("Его мясником")
            ]
        ),
        
        Question(
            question: "Какое насекомое вызвало короткое замыкание в ранней версии вычислительной машины, тем самым породив термин «компьютерный баг» («баг» в переводе с англ. «насекомое»)?",
            answerOptions: [
                Answer("Мотылек", true),
                Answer("Таракан"),
                Answer("Муха"),
                Answer("Японский хрущик")
            ]
        ),
        
        Question(
            question: "Из каких плодов можно получить копру?",
            answerOptions: [
                Answer("Ананас"),
                Answer("Вишня"),
                Answer("Кокос", true),
                Answer("Абрикос")
            ]
        ),
        
        Question(
            question: "Под каким названием известна единица с последующими ста нулями?",
            answerOptions: [
                Answer("Гугол", true),
                Answer("Мегатрон"),
                Answer("Гигабит"),
                Answer("Наномоль")
            ]
        ),
        
        Question(
            question: "Какой химический элемент составляет более половины массы тела человека?",
            answerOptions: [
                Answer("Углерод"),
                Answer("Кальций"),
                Answer("Кислород", true),
                Answer("Железо")
            ]
        ),
        
        Question(
            question: "Какую часть тела также называют «атлант»?",
            answerOptions: [
                Answer("Головной мозг"),
                Answer("Шестая пара ребер"),
                Answer("Шейный позвонок", true),
                Answer("Часть плеча")
            ]
        ),
        
        Question(
            question: "Сколько кубиков в кубике Рубика?",
            answerOptions: [
                Answer("22"),
                Answer("24"),
                Answer("26", true),
                Answer("28")
            ]
        ),
        
        Question(
            question: "Что изобразил Юджин Сернан, последний на данный момент побывавший на Луне человек, на ее поверхности?",
            answerOptions: [
                Answer("Символ мира"),
                Answer("Инициалы дочери", true),
                Answer("Боже, храни Америку»"),
                Answer("«Здесь был Юджин")
            ]
        ),
        
        Question(
            question: "Какого цвета крайнее правое кольцо в олимпийской символике?",
            answerOptions: [
                Answer("Красное", true),
                Answer("Синее"),
                Answer("Желтое"),
                Answer("Зеленое")
            ]
        ),
        
        Question(
            question: "Что изображено на заднем плане картины Леонардо да Винчи «Мона Лиза»?",
            answerOptions: [
                Answer("Драпировка"),
                Answer("Пейзаж", true),
                Answer("Город"),
                Answer("Стадо овец")
            ]
        ),
        
    ]
}
