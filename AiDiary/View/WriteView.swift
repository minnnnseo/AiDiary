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
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .italic()
                    .padding(.top,35)
                    .padding(.leading,20)
                    .padding([.top, .leading, .trailing])
                
                ZStack(alignment: .bottomTrailing) {
                    Divider()
                    TextEditor(text:$text)
                        .background(Color(hex: "FFFFF9"))
                        .cornerRadius(30)
                        .padding([.leading, .bottom, .trailing], 33.0)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(.top,30)
                        .lineSpacing(3) //줄 간격
                        .multilineTextAlignment(.leading)
                        
                    
                    Button(action: {
                        isImageLoadingViewPresented = true
                    }) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color(hex: "A70808"))
                            .padding()
                    }
                    .padding(.bottom, 40)
                    .padding(.horizontal, 40)
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
