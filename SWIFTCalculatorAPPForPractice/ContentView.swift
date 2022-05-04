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
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(red: 55/255.0, green: 55/255.0, blue: 55/255.0)
        }
    }
}

struct ContentView: View {
    
    @State var value = "0"
    
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .equal],
        [.zero, .decimal, .equal]
    
    ]
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                //TEXTgcalu
                
                HStack{
                    Spacer()
                    Text(value)
                    .bold()
                    .font(.system(size:64))
                    .foregroundStyle(.white)
                }
                .padding()

                //BUTTONS
                ForEach(buttons, id: \.self){ row in
                    HStack(spacing: 10){
                        ForEach(row, id: \.self){ item in
                            Button (action: {
                                self.buttonHandler(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(item: item),
                                           height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func buttonHandler(button: CalcButton){
        switch button {
            case .add, .subtract, .multiply, .divide, .equal:
                break
            case .clear:
                self.value = "0"
            case .decimal, .negative, .percent:
                break
            default:
                let number = button.rawValue
                if self.value == "0"{
                    value = number
                }else{
                    self.value = "\(self.value)\(number)"
                }
        }

    }
    
    func buttonWidth(item: CalcButton) -> CGFloat{
        if item == .zero{
            return ((UIScreen.main.bounds.width - (4*12))/4) * 2
        }
        return (UIScreen.main.bounds.width - (5*12))/4
    }
    
    func buttonHeight() -> CGFloat{
        return (UIScreen.main.bounds.width - (5*12))/4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
