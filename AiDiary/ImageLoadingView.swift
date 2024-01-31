//
//  ImageLoadingView.swift
//  AiDiary
//
//  Created by usg on 1/31/24.
//

import SwiftUI

struct ImageLoadingView: View {
    @State private var transitionView = false

    var body: some View {
        ZStack {
            Color("A70808")
                .edgesIgnoringSafeArea(.all)
            //            Color.black.opacity(0.3)
            //                .edgesIgnoringSafeArea(.all)
            VStack{
                if transitionView {
                    Image(systemName: "envelope.open.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 300)
                        .foregroundColor(Color.white)
//                        .transition(.asymmetric(insertion: .move(edge: .top),
//                                                removal: .move(edge: .leading)))
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        .transition(.asymmetric(insertion: AnyTransition.move(edge: .top),
                                                removal: AnyTransition.opacity.animation(.easeIn))
                                    )
                        .animation(.easeIn)
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                }

                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .padding(.bottom, 20)
                        .frame(width: 270, height: 80)
                        .foregroundColor(Color(hex: "FFFFF9"))
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                        .overlay(
                            Text("일기 이미지가 생성되는 중 ..")
                                .foregroundColor(Color(hex: "4A1A00"))
                                .padding(.bottom)
                            
                        )
                    Image("button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.green)
                        .padding()
                        .offset(y: -45) // RoundedRectangle 위에 겹치도록 오프셋 설정
                        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                }
            }
                
            }
            .onAppear {
                withAnimation {
                    transitionView = true
                }
            }
            

        }
    }

struct ImageLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(selectedDate: Date())
        ImageLoadingView()
    }
}
