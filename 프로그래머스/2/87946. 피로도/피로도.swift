import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    var visited = Array(repeating: false, count: dungeons.count)
    var selected = Array(repeating: [0, 0], count: dungeons.count)
    var maxCount = 0
    
    
    func calculateCount() -> Int {
        var tempFirst = k
        var count = 0
        for select in selected {
            if tempFirst >= select[0] {
                tempFirst = tempFirst - select[1]
                count += 1
            }
        }
        return count
    }
    
    func DFS(count: Int) {
        if count == dungeons.count {
            let tempCount = calculateCount()
            if maxCount < tempCount {
                maxCount = tempCount
            }
            return
        }

        for i in 0..<dungeons.count { // 0, 1, 2
            if visited[i] == false {
                visited[i] = true
                selected[count] = dungeons[i]
                DFS(count: count+1)
                visited[i] = false
            }
        }
    }

    DFS(count: 0)
    return maxCount
}