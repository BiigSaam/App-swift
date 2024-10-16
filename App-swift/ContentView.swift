//
//  ContentView.swift
//  App-swift
//
//  Created by ABDUL Samad on 15/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var balance: Int = 1000
    @State private var jackpotResult: String = ""
    @State private var isWinner: Bool = false
    
    // Liste des résultats possibles (chiffres ou images)
    let jackpotNumbers = ["A", "B", "C", "D", "E", "F"]
    
    var body: some View {
        VStack {
            Text("Balance: \(balance)")
                .font(.largeTitle)
                .padding()
            
            Text(jackpotResult)
                .font(.system(size: 60))
                .padding()
            
            if isWinner {
                Text("You win!")
                    .foregroundColor(.green)
                    .font(.title)
                    .padding()
            } else {
                Text("Try Again!")
                    .foregroundColor(.red)
                    .font(.title)
                    .padding()
            }
            
            Button(action: {
                playJackpot()
            }) {
                Text("Play Jackpot")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    func playJackpot() {
        let result1 = jackpotNumbers.randomElement()!
        let result2 = jackpotNumbers.randomElement()!
        let result3 = jackpotNumbers.randomElement()!
        
        jackpotResult = "\(result1) \(result2) \(result3)"
        
        if result1 == result2 && result2 == result3 {
            // Le joueur gagne
            balance += 500
            isWinner = true
        } else {
            // Le joueur perd
            balance -= 100
            isWinner = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
