import Foundation

func solution(_ n:Int) -> Int {
    var answer:Int = 0
    let arr = Array(String(n))
    return arr.reduce(0) {
        Int(String($0))! + Int(String($1))!
    }
}

