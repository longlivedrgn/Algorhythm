import Foundation

var expression = String(readLine()!)
// 식을 차례대로 받다가 -가 나오면 위에 있는 숫자들을 계속해서 계산해준다!..
// 뒤의 숫자에서 +면 그냥 계산 계속하고, 만약 -가 나오면 잠깐 멈쳐서 - 계산해주고,
// 다시 또 위 반복하기

let getFunction = expression.filter { (char) -> Bool in
    return !char.isNumber
}.map { (char) -> String in
    return String(char)
}

let getNumber = expression.components(separatedBy: ["-","+"])

var result = Int(getNumber[0])!

var flag = false
var temp: Int = 0
for (index, number) in getFunction.enumerated() {
    if number == "-" {
        if flag == false {
            flag = true
            temp += Int(getNumber[index+1])!
        } else {
            result -= temp
            temp = Int(getNumber[index+1])!
        }
    } else {
        if flag == true {
            temp += Int(getNumber[index+1])!
        } else {
            result += Int(getNumber[index+1])!
        }
    }
}
if flag {
    print(result-temp)
} else {
    print(result + temp)
}