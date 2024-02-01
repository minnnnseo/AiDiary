//
//  DiaryView.swift
//  AiDiary
//
//  Created by usg on 2/1/24.
//

import SwiftUI

struct DiaryView: View {
    //@Environment(\.presentationMode) var presentationMode
    
    var selectedDate: Date // 선택된 날짜
    // 생성된 이미지와 이전에 사용자가 작성한 일기 내용이 전달될 것으로 가정
    var generatedImage: Image?
    var diaryContent: String?
    
    var body: some View {
        ZStack {
            Color("A70808").edgesIgnoringSafeArea(.all)

        VStack{
//            // 되돌아가는 버튼
//            Button(action: {
//                presentationMode.wrappedValue.dismiss() // 이전 뷰로 되돌아가기
//            }) {
//                Image(systemName: "arrow.backward.circle.fill")
//                    .font(.system(size: 40))
//                    .foregroundColor(Color(hex: "FFFFF9"))
//                    .padding()
//                    .padding(.top,10) // 이미지 위에 위치하도록
//                    .padding(.trailing,300)
//            }
            
            // 이미지 표시
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding(.top,60)
                .padding(.bottom,55)
            
            // 일기 표시
            ScrollView {
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(hex: "FFFFF9"))
                        .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0, y: 5)
                        .padding(.bottom, 40)
                        .frame(width: 270, height: 400)
                    Text("이전에 사용자가 작성한 일기 내용이 여기에 표시됩니다.")
                        .foregroundColor(Color(hex: "4A1A00"))
                        .frame(width: 250, height: 80)


                }
            }
            }
        }
    }
}

#Preview {
    DiaryView(selectedDate: Date())
}
