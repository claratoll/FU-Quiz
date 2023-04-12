//
//  QuestionsViewModel.swift
//  FU-Quiz
//
//  Created by Clara Toll on 2023-04-12.
//

import Foundation

class QuestionsViewModel : ObservableObject{
    
    @Published var gameOver = false
    
    var questions = [
            Question(question: "Vem vinner guld?", correctAnswer: "Växjö Lakers", incorrectAnswer: ["Skellefteå", "Frölunda", "Örebro"]),
            Question(question: "Vilket är bäst?", correctAnswer: "Zoom", incorrectAnswer: ["Teams", "Discord", "Slack"]),
            Question(question: "Vilket kodspråk är svårast?", correctAnswer: "Java", incorrectAnswer: ["Swift", "Kotlin", "JavaScript"]),
            Question(question: "Vilka åkte ur SHL?", correctAnswer: "Brynäs", incorrectAnswer: ["HV71", "Luleå", "Djurgården"])
    ]
    
    @Published var currentQuestion : Question
    
    init() {
        let rand = Int.random(in: 0..<questions.count)
        currentQuestion = questions[rand]
    }
    
    func randomQuestion() {
        
        if questions.isEmpty{
            print("Well done")
            gameOver = true
        } else {
            let rand = Int.random(in: 0..<questions.count)
            currentQuestion = questions[rand]
            questions.remove(at: rand)
        }
    }
    
}
