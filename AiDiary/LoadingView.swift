//
//  LoadingView.swift
//  AiDiary
//
//  Created by usg on 1/29/24.
//

import SwiftUI


struct LoadingView: View {
    @AppStorage("onboarding") private var isOnboardingActive: Bool = true
   
    var body: some View {
        ZStack {
            Color("A70808") // A70808 색상을 배경색으로 사용합니다.
            VStack {
                Text("Making \n      a \n dream")
                    .font(.system(size: 65, weight: .thin))
                    .italic()
                    .foregroundColor(.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LoadingView()
}
