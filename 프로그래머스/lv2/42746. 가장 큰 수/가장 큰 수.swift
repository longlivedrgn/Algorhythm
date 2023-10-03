import Foundation

func solution(_ numbers:[Int]) -> String {
    // 숫자 두 개를 비교할 때, 서로 앞뒤로 순서 바꿔서 붙혀서 대소 비교하기!..
    // string 비교!
    // "34" < "43" -- true
    
    let newNumbers = numbers.sorted {
        let first = String($0)
        let second = String($1)
        
        return first + second > second + first
    }
    
    var temp = ""
    
    // 만약 numbers에 0 밖에 없다면? -> 0을 그냥 출력해야된다.
    if newNumbers[0] == 0 {
        return "0"
    }
    for number in newNumbers {
        temp += String(number)
    }
    return temp 
}