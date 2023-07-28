var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var nodeCount = nums[0]
var edgeCount = nums[1]
var graph = Array(repeating: [Int](), count: nodeCount+1)
// 방문했는 지 확인용
var visited = Array(repeating: false, count: nodeCount+1)
var count = 0

// graph 채워주기
for _ in 0..<edgeCount {
    var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[numbers[0]].append(numbers[1])
    graph[numbers[1]].append(numbers[0])
}

// 일단 그래프 채워주기
func DFS(vertex: Int) {
    if !visited[vertex] {
        visited[vertex] = true
    } else {
        return
    }

    for i in graph[vertex] {
        DFS(vertex: i)
    }
}

for m in 1...nodeCount {
    if !visited[m] {
        DFS(vertex: m)
        count += 1
    }
}
print(count)