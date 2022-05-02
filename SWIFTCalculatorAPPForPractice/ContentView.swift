//
//  ContentView.swift
//  SWIFTCalculatorAPPForPractice
//
//  Created by Apple New on 2022-05-02.
//

import SwiftUI

enum CalcButton : String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9 "
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "/"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
}

struct ContentView: View {
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .equal],
        [.zero, .zero, .decimal, .equal]
    
    ]
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                //TEXT
                HStack{
                    Spacer()
                    Text("0")
                    .bold()
                    .font(.system(size:64))
                    .foregroundStyle(.white)
                }
                .padding()

                //BUTTONS
                ForEach(buttons, id: \.self){ row in
                    HStack{
                        ForEach(row, id: \.self){ item in
                            Button (action: {
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: 70, height: 70)
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(35)
                            })
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
