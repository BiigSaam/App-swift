//
//  FindWordView.swift
//  App-swift
//
//  Created by ABDUL Samad on 16/10/2024.
//

import SwiftUI

struct FindWordView: View {
    @State private var sentence: String = "I love _____ and _____."
    @State private var missingWords: [String] = ["apples", "bananas"]
    @State private var userGuesses: [String] = ["", ""]
    @State private var feedback: String = ""
    @State private var score: Int = 0
    @State private var currentWordIndex: Int = 0
    @State private var gameOver: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 0.0, green: 0.75, blue: 1.0),
                Color(red: 0.0, green: 1.0, blue: 1.0),
                Color(red: 0.12, green: 0.56, blue: 1.0)
            ]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            VStack {
                Text("Complete the Sentence")
                    .font(.largeTitle)
                    .padding()
                
                Text(sentence.replacingOccurrences(of: "_____", with: "_____"))
                    .font(.headline)
                    .padding()
                
                TextField("Guess the word", text: $userGuesses[currentWordIndex])
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: checkGuess) {
                    Text("Submit Guess")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Text(feedback)
                    .font(.headline)
                    .padding()
                
                Text("Score: \(score)")
                    .font(.title)
                    .padding()
                
                if gameOver {
                    Text("Game Over! Final Score: \(score)")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                    
                    Button(action: restartGame) {
                        Text("Play Again")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
    }

    func checkGuess() {
        let currentGuess = userGuesses[currentWordIndex].lowercased()

        if currentGuess == missingWords[currentWordIndex].lowercased() {
            feedback = "Correct!"
            score += 1
        } else {
            feedback = "Incorrect! The correct word was \(missingWords[currentWordIndex])."
        }

        currentWordIndex += 1

        if currentWordIndex >= missingWords.count {
            gameOver = true
        } else {
            userGuesses[currentWordIndex] = "" // Clear the next input
        }
    }

    func restartGame() {
        sentence = "I love _____ and _____."
        missingWords = ["apples", "bananas"]
        userGuesses = ["", ""]
        feedback = ""
        score = 0
        currentWordIndex = 0
        gameOver = false
    }
}

struct FindWordView_Previews: PreviewProvider {
    static var previews: some View {
        FindWordView()
    }
}

