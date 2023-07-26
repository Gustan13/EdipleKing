//
//  ContentView.swift
//  EdipleKing
//
//  Created by Gustavo Binder on 24/07/23.
//

import SwiftUI

struct ContentView: View {
    
    public var currentScene: SceneClass = Intro()
    public var scenes : [SceneClass]
    {
        return [Intro(), NewTest()]
    }
    
    @State public var sceneIndex : Int = 0
    @State public var pagesIndex : Int = 0
    @State public var phrasesIndex : Int = 0
    
    public var soundManager = SoundManager()
    
    var body: some View {
        
        let pages : [Page] = scenes[sceneIndex].pages
        
        var phrases : [String] {
            scenes[sceneIndex].pages[pagesIndex].phrases
        }
        
        VStack (alignment: .leading, spacing: 0) {
            ForEach(Array(phrases.enumerated()), id: \.1) { index, phrase in
                if index <= phrasesIndex
                {
                    Text(phrase)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .transition(.push(from: .trailing))
                }
            }
            
            if pagesIndex < pages.count - 1
            {
                Image(systemName: "chevron.down")
                    .padding(.top, 6)
                    .font(.title)
                Spacer()
            } else {
                Spacer()
                Button {
                    withAnimation {
                        sceneIndex = -sceneIndex + 1
                        phrasesIndex = 0
                        pagesIndex = 0
                    }
                } label: {
                    if sceneIndex == 0
                    {
                        Text("Go to Next Scene")
                    } else {
                        Text("Previous Scene")
                    }
                }
                .transition(.scale)

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .onTapGesture {
            withAnimation() {
                nextPhrase()
                for tuple in scenes[sceneIndex].soundMapping
                {
                    if tuple.1 == pagesIndex && tuple.2 == phrasesIndex
                    {
                        soundManager.playSound(tuple.0)
                    }
                }
            }
        }
    }
    
    private func nextPhrase()
    {
        if pagesIndex == scenes[sceneIndex].pagesSize - 1 {
            return
        }
        
        if phrasesIndex < scenes[sceneIndex].pages[pagesIndex].phrasesSize - 1 { phrasesIndex += 1 }
        else
        {
            phrasesIndex = 0
            pagesIndex += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
