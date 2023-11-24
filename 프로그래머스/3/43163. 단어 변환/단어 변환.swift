
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var queue = [(String, Int)]()
    queue.append((begin, 0))
    var answer = 0
    var visited = Array(repeating: false, count: words.count)

    while !queue.isEmpty {
        let popped = queue.removeFirst()

        if popped.0 == target {
            answer = popped.1
            break
        }

        for i in 0..<words.count {
            if visited[i] == false {
                var temp_count = 0

                for (chr1, chr2) in zip(popped.0, words[i]) {
                    if chr1 != chr2 {
                        temp_count += 1
                    }
                }

                if temp_count == 1 {
                    queue.append((words[i], popped.1 + 1))
                    visited[i] = true
                }
            }
        }
    }

    return answer
}