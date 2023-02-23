import Foundation

func solution(_ n:Int) -> Int {
    var answer:Int = 0
    let stringN = String(n)
    for index in stringN.indices {
        answer += Int(String(stringN[index]))!
    }
    return answer
}