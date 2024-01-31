//
//  ContentView.swift
//  AiDiary
//
//  Created by usg on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoadingComplete = false // 로딩이 완료되었는지 여부를 나타내는 상태 변수

    var body: some View {
        Group {
            if isLoadingComplete { // 로딩이 완료되면 CalendarView를 표시합니다.
                CalendarView()
            } else { // 로딩이 완료되지 않았으면 LoadingView를 표시합니다.
                LoadingView()
                    .onAppear {
                        // 로딩이 완료되었음을 표시하는 데모 용도로 2초 후에 isLoadingComplete 상태를 true로 변경합니다.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoadingComplete = true
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
