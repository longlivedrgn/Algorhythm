
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var answer = Int.max
    let isVisited = Array(repeating: false, count: words.count)

    func DFS(now: String, visited: [Bool], depth: Int) {
        var tempVisited = visited

        if now == target && depth != 0 {
            answer = min(depth, answer)
            return
        }

        for (idx, word) in words.enumerated() {
            if tempVisited[idx] == false && isOneCharOff(word, now) {
                tempVisited[idx] = true
                DFS(now: word, visited: tempVisited, depth: depth + 1)
                tempVisited[idx] = false
            }
        }
    }

    DFS(now: begin, visited: isVisited, depth: 0)
    
    if answer == Int.max {
        return 0
    } else {
        return answer
    }
}

func isOneCharOff(_ str1: String, _ str2: String) -> Bool {
    // 두 문자열의 길이가 다르면 false를 반환
    guard str1.count == str2.count else {
        return false
    }

    var diffCount = 0

    // 각 문자열의 문자를 비교하여 다른 문자 수를 세기
    for (char1, char2) in zip(str1, str2) {
        if char1 != char2 {
            diffCount += 1
        }

        // 다른 문자가 2개 이상이면 false를 반환
        if diffCount > 1 {
            return false
        }
    }

    // 다른 문자가 정확히 1개인 경우에만 true 반환
    return diffCount == 1
}