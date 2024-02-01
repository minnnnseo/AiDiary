import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    @State private var appliedDate: Date?
    @State private var text = ""
    let placeholder = "오늘의 일기 쓰기"
    @State private var isModalPresented = false
    
    var body: some View {
        ZStack {
            Color("A70808")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .accentColor(.red)
                    .frame(width: 250, height: 300)
                    .padding([.leading, .bottom, .trailing])
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                //                    .padding(.top)
                HStack {
                    Text(appliedDate == nil ? "" : "Selected Date: \(appliedDate!, formatter: dateFormatter)")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .italic()
                        .padding(.leading, 30.0)
                    Spacer()
                    
                    Button(action: {
                        appliedDate = selectedDate
                    }) {
                        Text("적용")
                            .font(.headline)
                            .foregroundColor(Color(hex: "4A1A00"))
                            .padding(.horizontal, 20) // 좌우 패딩 적용
                            .padding(.vertical, 10) // 위아래 패딩 적용
                            .background(Color(hex: "FFFFF9"))
                            .clipShape(Capsule())
                            .frame(width: 86.0) // 버튼의 너비를 80으로 지정
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                    }
                    .padding([.top, .bottom, .trailing],3)
                    .padding(.trailing)
                }
                .padding(.horizontal)
                
                VStack {
                    Divider()
                    ZStack(alignment: .topLeading) {
                        Button(action: {
                            isModalPresented = true
                        }) {
                            Text(placeholder)
                                .foregroundColor(.gray)
                                .padding(15)
                                .padding(.bottom,230)
                            Spacer()
                        }
                    }
                    .frame(width: 270, height: 280)
                    .background(Color(hex: "FFFFF9"))
                    .cornerRadius(20)
                    //.padding(20)
                    .padding(.bottom,20)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                    //Spacer()
                }
            }
        }
        .foregroundColor(.white)
        .sheet(isPresented: $isModalPresented) {
            WriteView(selectedDate: selectedDate)
        }
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
