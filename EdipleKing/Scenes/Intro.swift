//
//  Intro.swift
//  EdipleKing
//
//  Created by Gustavo Binder on 25/07/23.
//

class Intro : SceneClass
{
    init()
    {
        let page1 = Page([
            "Hello, this is the beginning of my game.",
            "How are you?",
            "I'm feeling great."
        ])
        let page2 = Page([
            "Notice how I just changed the page but didn't change the scene!"
        ])
        let page3 = Page([
            "Once the Pages end, the option buttons will appear.",
            "Isn't that cool?"
        ])
        let page4 = Page([
            "What will you do?"
        ])
        
        let pages = [page1, page2, page3, page4]
        
        let knock = ("knock", 1, 0)
        
        super.init(pages, "hej", [("Say banana", 1), ("Eat cookie", 1)], [knock])
    }
}
