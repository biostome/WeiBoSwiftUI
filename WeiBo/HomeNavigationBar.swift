//
//  HomeNavigationBar.swift
//  WeiBoSwiftUI
//
//  Created by leishen on 2020/8/10.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 24

struct HomeNavigationBar: View {
    
    @State var leftPercent:CGFloat
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {
                print("click camera button")
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    .foregroundColor(.black)
            }
            Spacer()
            VStack(spacing: 3) {
                HStack(spacing: 0) {
                    Text("推荐")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top,5)
                        .opacity(Double(1-leftPercent*0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 0
                            }
                    }
                    Spacer()
                    
                    Text("热门")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top,5)
                        .opacity(Double(0.5+leftPercent*0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 1
                            }
                    }
                }
                .font(.system(size:20))
                GeometryReader { (reader) in
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 4)
                        .offset(x: reader.size.width * (self.leftPercent - 0.5) + kLabelWidth * (0.5 - self.leftPercent))
                }.frame(height: 6)
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
            Spacer()
            Button(action: {
                print("click camera button")
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal,15)
                    .padding(.top,5)
                    .foregroundColor(.orange)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: 0)
    }
}
