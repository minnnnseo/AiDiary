//
//  HomeView.swift
//  AiDiary
//
//  Created by usg on 2/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("A70808")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    // CalendarView로 이동하는 버튼
                    NavigationLink(destination: CalendarView()) {
                        VStack {
                            Image("btn") // 버튼 이미지
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 100)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 0)
                                .padding(.bottom,4)
                            RoundedRectangle(cornerRadius: 10)
                                .padding(.bottom, 20)
                                .frame(width: 100, height: 60)
                                .foregroundColor(Color(hex: "FFFFF9"))
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                                .overlay(
                                    Text("일기 작성하기")
                                        .foregroundColor(Color(hex: "4A1A00"))
                                        .font(.system(size: 14))
                                        .padding(.bottom)
                                )
                        }
                        .navigationBarBackButtonHidden(true)
                        .padding(.top,100)
                        .padding(.bottom, 80)
                    }
                    
                    // ImageGenerationView로 이동하는 버튼
                    NavigationLink(destination: ImageGenerationView()) {
                        VStack {
                            Image("btn") // 버튼 이미지
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 0)
                                .frame(width: 200, height: 100)
                                .padding(.bottom,4)
                            RoundedRectangle(cornerRadius: 10)
                                .padding(.bottom, 20)
                                .frame(width: 110, height: 60)
                                .foregroundColor(Color(hex: "FFFFF9"))
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                                .overlay(
                                    Text("작성한 일기 보기")
                                        .foregroundColor(Color(hex: "4A1A00"))
                                        .font(.system(size: 14))
                                        .padding(.bottom)
                                    
                                )
                        }
                        .padding()
                    }
                    
                    
                    
                    Spacer() // 두 버튼을 위아래로 정렬하기 위한 Spacer
                }
                .navigationBarTitle("Home") // 네비게이션 바 제목
            }
        }
    }
    
}

#Preview {
    HomeView()
}
