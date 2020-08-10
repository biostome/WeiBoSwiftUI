//
//  HomeView.swift
//  WeiBoSwiftUI
//
//  Created by leishen on 2020/8/10.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 0){
                    PostLiseView(category: .recommend)
                        .frame(width: UIScreen.main.bounds.width)
                    PostLiseView(category: .hot)
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
            .navigationBarTitle("首页",displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
