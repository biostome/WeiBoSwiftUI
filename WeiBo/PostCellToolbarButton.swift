//
//  PostCellToolbarButton.swift
//  WeiBo
//
//  Created by leishen on 2020/8/1.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

struct PostCellToolbarButton: View {
    
    let image:String
    let text:String
    let color:Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            HStack(spacing:5){
                Image(systemName: image)
                .resizable()
                .scaledToFit()
                    .frame(width: 18, height: 15)
                Text(text)
                    .font(.system(size: 15))
                
            }
        }
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "点赞~", color: .red, action: {
            print("点赞")
        })
    }
}
