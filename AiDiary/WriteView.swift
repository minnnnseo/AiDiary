//
//  WriteView.swift
//  AiDiary
//
//  Created by usg on 1/30/24.
//

import SwiftUI
import UIKit

struct WriteView: View {
    @State private var text = ""
    let selectedDate: Date
    @State private var isImageLoadingViewPresented = false
    
    init(selectedDate: Date) {
        self.selectedDate = selectedDate
    }
    //    "app.gift.fill"
    //    "envelope.fill"
    //    "envelope.open.fill"
    var body: some View {
        ZStack {
            Color("A70808")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                    .foregroundColor(.white)
                    .padding(.top,20)
                    .padding()
                
                ZStack(alignment: .bottomTrailing) {
                    TextEditor(text: $text)
                        .foregroundColor(.black)
                        .background(Color(hex: "FFFFF9"))
                        .cornerRadius(10)
                        .padding([.leading, .bottom, .trailing], 20.0)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                    
                    Button(action: {
                        isImageLoadingViewPresented = true
                        //  saveImage() // 버튼을 눌렀을 때 이미지 저장
                    }) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color(hex: "A70808"))
                            .padding()
                    }
                    .padding(.bottom, 13)
                    .padding(.horizontal, 13)
                }
            }
        }
        .sheet(isPresented: $isImageLoadingViewPresented) {
            ImageLoadingView()
        }
    }
}
//func saveImage() {
//    // 텍스트 에디터에서 작성한 내용을 이미지로 변환
//    let image = UIImage(view: TextEditor(text: text).background(Color(hex: "FFFFF9")).asUIView())
//
//    // 이미지 저장
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//    
//    // AI 이미지 생성 API 호출
//    // 여기에 AI 이미지 생성 API 호출하는 코드를 추가하세요
//}

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}



struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(selectedDate: Date())
    }
}

//extension UIImage {
//    convenience init(view: UIView) {
//        UIGraphicsBeginImageContext(view.frame.size)
//        view.layer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        self.init(cgImage: (image?.cgImage!)!)
//    }
//}
//
