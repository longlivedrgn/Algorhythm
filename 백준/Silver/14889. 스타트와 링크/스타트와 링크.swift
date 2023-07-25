var input = Int(readLine()!)!
var numbers = [[Int]]()
var minValue = Int.max
var visited = Array(repeating: false, count: input)

for _ in 0..<input {
    numbers.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

func DFS(depth: Int, idx: Int) {
    if depth == input/2 {
        var sttart = 0
        var link = 0
        for j in 0..<input {
            for k in 0..<input {
                if visited[j] == true && visited[k] == true {
                    sttart += numbers[j][k]
                }
                if visited[j] == false && visited[k] == false {
                    link += numbers[j][k]
                }
            }
        }
        minValue = min(minValue, abs(sttart-link))
        return
    }
    for m in idx..<input {
        if !visited[m] {
            visited[m] = true
            DFS(depth: depth+1, idx: m)
            visited[m] = false
        }
    }
}

DFS(depth: 0, idx: 0)
print(minValue)
