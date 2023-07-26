//
//  TestDialogueScene.swift
//  EdipleKing
//
//  Created by Gustavo Binder on 25/07/23.
//

import Foundation
import SwiftUI

class SceneClass : ObservableObject
{
    public var pages : [Page]
    @Published public var pageIndex : Int = 0
    public var pagesSize : Int
    {
        return pages.count
    }
    
    @Published public var phraseIndex : Int = 0
    
    public var imageName : String!
    
    public var buttons : [(String, Int)]!
    
    public var soundMapping : [(String, Int, Int)] = [] // Name of sound, Page and Phrase
    
    init(
        _ pages: [Page]!,
        _ imageName: String!,
        _ buttons: [(String, Int)],
        _ soundMapping : [(String, Int, Int)]) {
        self.pages = pages
        self.imageName = imageName
        self.buttons = buttons
        self.soundMapping = soundMapping
    }
    
    public func nextPhrase()
    {
        if pageIndex == pagesSize - 1
        {
            return
        }
        
        if phraseIndex == pages[pageIndex].phrasesSize - 1
        {
            nextPage()
            phraseIndex = 0
            return
        }
        phraseIndex += 1
    }
    
    public func nextPage()
    {
        pageIndex += 1
    }
}
