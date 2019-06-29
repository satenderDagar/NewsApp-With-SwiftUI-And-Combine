//
//  TopHeadlinesView.swift
//  NewsApp With SwiftUI Framework
//
//  Created by Алексей Воронов on 20.06.2019.
//  Copyright © 2019 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct TopHeadlinesView : View {
    @ObjectBinding var viewModel: MainViewModel
    
    var body: some View {
        ScrollView(showsHorizontalIndicator: false, showsVerticalIndicator: false) {
            HStack(alignment: .center, spacing: 8) {
                ForEach(self.viewModel.topHeadlines.identified(by: \.self)) { article in
                    PresentationButton(destination: SafariView(url: article.url)) {
                        TopHeadlineRow(article: article)
                    }
                    .accentColor(.black)
                }
            }
        }
        .onAppear {
            self.viewModel.getTopHeadlines()
        }
    }
}
