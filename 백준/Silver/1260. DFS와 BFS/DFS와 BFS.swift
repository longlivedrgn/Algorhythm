var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var nodeCount = nums[0]
var edgeCount = nums[1]
var graph = Array(repeating: [Int](), count: nodeCount+1)
// 방문했는 지 확인용
var visited = Array(repeating: false, count: nodeCount+1)
var complete = false
var DFSAnswer = [Int]()
var BFSAnswer = [Int]()
// 일단 그래프 채워주기
for _ in 0..<edgeCount {
    var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[numbers[0]].append(numbers[1])
    graph[numbers[1]].append(numbers[0])
}

func DFS(vertex: Int) {
    let sorted = graph[vertex].sorted()
    for i in sorted {
        if !visited[i] {
            visited[i] = true
            DFSAnswer.append(i)
            DFS(vertex: i)
        }
    }
}
DFSAnswer.append(nums[2])
visited[nums[2]] = true
DFS(vertex: nums[2])
print(DFSAnswer.map {
    String($0)
}.joined(separator: " "))


visited = Array(repeating: false, count: nodeCount+1)
var Q = [Int]()
func BFS() {
    while !Q.isEmpty {
        let popped = Q.removeFirst()
        if !visited[popped] {
            visited[popped] = true
            BFSAnswer.append(popped)
        }
        let sorted = graph[popped].sorted()

        for i in sorted {
            if !visited[i] {
                Q.append(i)
            }
        }
    }
}

Q.append(nums[2])
BFS()
print(BFSAnswer.map {
    String($0)
}.joined(separator: " "))