//
//  PageModel.swift
//  EdipleKing
//
//  Created by Gustavo Binder on 25/07/23.
//

struct Page
{
    public var phrases : [String] = []
    public var phrasesSize : Int
    {
        return phrases.count
    }
    
    init(_ phrases : [String])
    {
        self.phrases = phrases
    }
}


