// DFS를 활용한 풀이!
// 내 인접한 정점이 나랑 같은 색깔인 지 확인하기!
var input = Int(readLine()!)!

for _ in 0..<input {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    var nodeCount = nums[0]
    var edgeCount = nums[1]
    var graph = Array(repeating: [Int](), count: nodeCount+1)
    // 방문했는 지 확인용
    var visited = Array(repeating: false, count: nodeCount+1)
    var color = Array(repeating: false, count: nodeCount+1)
    var isBipartite = true

    // graph 채워주기
    for _ in 0..<edgeCount {
        var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
        graph[numbers[0]].append(numbers[1])
        graph[numbers[1]].append(numbers[0])
    }

    func DFS(vertex: Int) {
        if !visited[vertex] {
            visited[vertex] = true
        }

        for m in graph[vertex] {
            if !visited[m] {
                visited[m] = true
                color[m] = !color[vertex]
                DFS(vertex: m)
            } else {
                if color[m] == color[vertex] {
                    isBipartite = false
                    return
                }
            }
        }

    }
    // 연결 요소가 서로 다를 수도 있다.
    // 즉, 섬처럼 이어져있는 놈이 있을 수 있기에!!
    for i in 1...nodeCount {
        DFS(vertex: i)
    }
    print(isBipartite ? "YES" : "NO" )
}