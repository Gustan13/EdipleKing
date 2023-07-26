//
//  NewTest.swift
//  EdipleKing
//
//  Created by Gustavo Binder on 26/07/23.
//

class NewTest : SceneClass
{
    init()
    {
        let page1 = Page([
            "This is a new test scene."
        ])
        let page2 = Page([
            "How cool is that?"
        ])
        
        let pages = [page1, page2]
        
        super.init(pages, "hej", [("Hello", 0)], [])
    }
}
