//
//  ContentView.swift
//  FU-Quiz
//
//  Created by Clara Toll on 2023-04-12.
//

import SwiftUI

struct ContentView: View {
    @State var score : Int = 0
    
    @StateObject var questionsVM = QuestionsViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Text(String(score))
            Spacer()
                
            Text(questionsVM.currentQuestion.question)
            Spacer()
            
            let answers = [questionsVM.currentQuestion.correctAnswer] + questionsVM.currentQuestion.incorrectAnswer
            
            let shuffledAnswers = answers.shuffled()
            
            ForEach(shuffledAnswers, id: \.self) { answer in
                Button(action: {
                    handleAnswer(answer: answer)
                }) {
                    Text(answer)
                }
            }
            Spacer()
            }
            .onAppear{
                nextQuestion()
            }
            .sheet(isPresented: $questionsVM.gameOver, content: {
                MyNewView()
            })
    }
    
    func handleAnswer(answer: String){
        if answer == questionsVM.currentQuestion.correctAnswer{
            print("correct")
            score += 1
        }
        
 
            nextQuestion()

            //gå till ny vy

    }
    
    func nextQuestion(){
        questionsVM.randomQuestion()
    }
}


struct MyNewView: View {
    var body: some View {
        Text("Well done")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
