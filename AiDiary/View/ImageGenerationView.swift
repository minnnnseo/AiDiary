//
//  ImageGenerationView.swift
//  AiDiary
//
//  Created by usg on 2/1/24.
//

import SwiftUI

struct ImageGenerationView: View {
    @State private var isImageGenerated = true // 이미지가 생성되었는지 여부 <나중에 false로 바꾸기>
    @State private var selectedDiaryDate: Date?
    @State private var isDiaryViewPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("A70808").edgesIgnoringSafeArea(.all)
                
                //            // 이미지가 생성되지 않았을 때, 로딩 화면 보여주기
                //            if !isImageGenerated {
                //                ImageLoadingView()
                //            }
                VStack {
                    
                    NavigationLink(destination: HomeView()){
                        VStack {
                            Image(systemName: "house.circle.fill")
                                .resizable()
                                .foregroundColor(Color(hex: "FFFFF9"))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.top,15)
                            Text("Home")
                                .foregroundColor(.black)
                                .padding(.top,3)
                        }
                    }
                    
                    // 위쪽 영역: 생성된 이미지 표시
                    if isImageGenerated {
                        Image(systemName: "photo") // 이미지가 생성되었다면 실제 이미지로 대체
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                            .padding([.leading, .bottom, .trailing])
                        //.padding(.top,5)
                        // 아래쪽 영역: 사용자가 작성한 일기 버튼들을 스크롤하여 보여줌
                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(0..<10) { index in // 임시로 10개의 더미 버튼 생성
                                    Button(action: {
                                        isDiaryViewPresented = true
                                    }) {
                                        Image("letter")
                                            .resizable()
                                            .foregroundColor(Color(hex: "FFFFF9"))
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 380, height: 180)
                                            .offset(y: CGFloat(index) * -70)
                                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                                            .contentShape(Rectangle())
                                        if let date = selectedDiaryDate {
                                            Text(date.description) // 선택된 일기의 날짜를 표시
                                                .foregroundColor(Color(hex: "4A1A00"))
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                .sheet(isPresented: $isDiaryViewPresented) {
                    DiaryView(selectedDate: Date())
                }
            }
        }
        //        .onAppear {
        //            // 이미지 생성 여부를 시뮬레이션하기 위해 임시로 isImageGenerated를 true로 설정
        //            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        //                withAnimation {
        //                    isImageGenerated = true
        //                }
        //            }
        //        }
    }
}

struct ImageGenerationView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGenerationView()
    }
}
