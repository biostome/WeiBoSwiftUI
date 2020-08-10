
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
    
    var body: some View {
        VStack {
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
                        print("aaaa")
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
                loadImage(name: post.images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.width - 30, alignment: .center)
                    .clipped()
            }
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black, action: {
                    print("click message button")
                })
                Spacer()
                PostCellToolbarButton(image: "heart", text: post.likeCountText, color: .black, action: {
                    print("click message button")
                })
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(.gray)
        }
        .padding(.top,15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[2])
    }
}
