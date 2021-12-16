//
//  Question.swift
//  Who_want_to_be_a_millionaire
//
//  Created by Сергей Черных on 16.12.2021.
//

import Foundation

struct Question {
    let question: String
    let answerOptions: [String : Bool]
}

let questions: [Question] = [
    Question(
        question: "Кем был мужчина, послуживший моделью для известной картины «Американская готика» Гранта Вуда?",
        answerOptions: ["Коммивояжером" : false,
                        "Местным шерифом" : false,
                        "Его зубным врачом" : true,
                        "Его мясником" : false]
    ),
    Question(
        question: "Какое насекомое вызвало короткое замыкание в ранней версии вычислительной машины, тем самым породив термин «компьютерный баг» («баг» в переводе с англ. «насекомое»)?",
        answerOptions: ["Мотылек" : true,
                        "Таракан" : false,
                        "Муха" : false,
                        "Японский хрущик" : false]
    ),
    Question(
        question: "Из каких плодов можно получить копру?",
        answerOptions: ["Ананас" : false,
                        "Вишня" : false,
                        "Кокос" : true,
                        "Абрикос" : false]
    ),
    Question(
        question: "Под каким названием известна единица с последующими ста нулями?",
        answerOptions: ["Гугол" : true,
                        "Мегатрон" : false,
                        "Гигабит" : false,
                        "Наномоль" : false]
    ),
    Question(
        question: "Какой химический элемент составляет более половины массы тела человека?",
        answerOptions: ["Углерод" : false,
                        "Кальций" : false,
                        "Кислород" : true,
                        "Железо" : false]
    ),
    Question(
        question: "Какую часть тела также называют «атлант»?",
        answerOptions: ["Головной мозг" : false,
                        "Шестая пара ребер" : false,
                        "Шейный позвонок" : true,
                        "Часть плеча" : false]
    ),
    Question(
        question: "Сколько кубиков в кубике Рубика?",
        answerOptions: ["22" : false,
                        "24" : false,
                        "26" : true,
                        "28" : false]
    ),
    Question(
        question: "Что изобразил Юджин Сернан, последний на данный момент побывавший на Луне человек, на ее поверхности?",
        answerOptions: ["Символ мира" : false,
                        "Инициалы дочери" : true,
                        "«Боже, храни Америку»" : false,
                        "«Здесь был Юджин»" : false]
    ),
    Question(
        question: "Какого цвета крайнее правое кольцо в олимпийской символике?",
        answerOptions: ["Красное" : true,
                        "Синее" : false,
                        "Желтое" : false,
                        "Зеленое" : false]
    ),
    Question(
        question: "Что изображено на заднем плане картины Леонардо да Винчи «Мона Лиза»?",
        answerOptions: ["Драпировка" : false,
                        "Пейзаж" : true,
                        "Город" : false,
                        "Стадо овец" : false]
    ),
]
