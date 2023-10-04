
import Foundation

func solution(_ numbers:String) -> Int {
    // "1234" -> ["1", "2", "3", "4"]로 바꿔준다.
    var numberArray: [String] = numbers.map { String($0) }
    // 값이 활용되었는 지 확인하기용 배열
    var visited: [Bool]
    // 선택된 숫자들을 넣어두는 배열! -> 여기에 있는 값들이 최종적으로 소수인 지 판단이된다.
    // 근데, [0, 1, 1]일 경우, 서로 다른 1로 판단을 하기에 set으로 바꿔서 중복되는 값들을 버리기!..
    var selected = Set<Int>()

    // joined() -> [String]밖에 안된다!..
    func DFS(inputNumberArray: [String], depth: Int, maxDepth: Int) {
        if depth == maxDepth {
            selected.insert(Int(inputNumberArray.joined())!)
            return
        }

        for index in 0..<numberArray.count {
            if !visited[index] {
                visited[index] = true
                // 새로운 배열을 만들어서 그냥 parameter로 넘긴다!..
                var newNumberArray = inputNumberArray
                newNumberArray.append(numberArray[index])
                DFS(inputNumberArray: newNumberArray, depth: depth+1, maxDepth: maxDepth)
                visited[index] = false
            }
        }
    }

    // 만약 ["1","2","3"] 길이가 1부터 3까지 인거까지 다 확인해야된다!..
    for length in 1...numberArray.count {
        // 매번 numberArray 초기화해주기!
        visited = Array(repeating: false, count: numberArray.count)
        DFS(inputNumberArray: [], depth: 0, maxDepth: length)
    }
    print(selected)
    // 그리고 소수인 지 판단하기!..
    let realAnswer = selected.filter { number in
        return isPrime(num: number)
    }.count

    return realAnswer
}


// 소수 판별하는 함수!..
func isPrime(num: Int) -> Bool {
    if num == 0 {
        return false
    }
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
 }
