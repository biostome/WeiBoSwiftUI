
//
//  PostCell.swift
//  WeiBo
//
//  Created by leishen on 2020/8/1.
//  Copyright © 2020 YB. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    
    let post: Post
    
    var bindingPost: Post {
        userData.post(forId: post.id)!
    }
    
    @EnvironmentObject var userData: UserData
     
    var body: some View {
        var post = bindingPost
        return VStack(alignment: .center, spacing: 10) {
            HStack() {
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width:50,height: 50)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPBadge(vip: post.vip)
                            .offset(x: 16, y: 16))
                
                
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(post.name)
                        .font(.system(size: 16))
                        .foregroundColor(.orange)
                        .lineLimit(1)
                    
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    
                }.padding(.leading,10)
                
                Spacer()
                
                if !post.isFollowed {
                    Button(action: {
                        post.isFollowed = true
                        self.userData.update(post)
                    }, label: {
                        Text("关注")
                            .font(.system(size: 14))
                            .foregroundColor(.orange)
                            .frame(width:50,height: 26)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .strokeBorder()
                                    .foregroundColor(.orange))
                    })
                        .buttonStyle(BorderlessButtonStyle())
                }
            }
            Text(post.text).font(.system(size: 17))
            if post.images.isEmpty == false {
                PostImageCell(images: post.images,  width: UIScreen.main.bounds.width - 30)
            }
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black, action: {
                    print("click message button")
                })
                Spacer()
                PostCellToolbarButton(image: post.isLiked ? "heart.fill" : "heart", text: post.likeCountText, color: post.isLiked ? .red : .black, action: {
                    if post.isLiked {
                        post.isLiked = false
                        post.likeCount -= 1
                    }else{
                        post.isLiked = true
                        post.likeCount += 1
                    }
                    self.userData.update(post)
                })
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(.init(red: 0.9, green: 0.9, blue: 0.9))
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return PostCell(post: userData.recommondPostList.list[1]).environmentObject(userData)
    }
}
