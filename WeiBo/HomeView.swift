//
//  HomeView.swift
//  WeiBoSwiftUI
//
//  Created by leishen on 2020/8/10.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var leftPercent:CGFloat = 0
    
    var body: some View {
        NavigationView {

            GeometryReader { reader in
                HScrollViewController(pageWidth: reader.size.width, contentSize: .init(width: reader.size.width * 2, height: reader.size.height ), leftPercent: self.$leftPercent) {
                    HStack(spacing: 0){
                        PostLiseView(category: .recommend)
                            .frame(width: UIScreen.main.bounds.width)
                        PostLiseView(category: .hot)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: self.$leftPercent))
            .navigationBarTitle("首页",displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}
