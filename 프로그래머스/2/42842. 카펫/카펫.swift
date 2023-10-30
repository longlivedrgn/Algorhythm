import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let temp = brown + yellow
    var answer = [0, 0]
    
    for i in 3..<temp {
        if temp % i == 0 {
            let tempMok = temp / i
            if (i-2) * (tempMok-2) == yellow {
                answer[0] = tempMok
                answer[1] = i
                return answer
            }
        }
    }
    return answer
}