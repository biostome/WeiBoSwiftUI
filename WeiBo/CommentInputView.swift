//
//  CommentInputView.swift
//  WeiBoSwiftUI
//
//  Created by leishen on 2020/8/24.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

struct CommentInputView: View {
    
    let post: Post
    
    @State private var text:String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack(spacing:0) {
            CommentTextView(text: $text)
            
            HStack(spacing:0) {
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("取消").padding()
                }
                Spacer()
                Button(action: {
                    var post = self.post
                    post.commentCount += 1
                    self.userData.update(post)
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("发送").padding()
                }
            }
        }
    }
}

struct CommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return CommentInputView(post: userData.recommondPostList.list[0]).environmentObject(userData)
    }
}
