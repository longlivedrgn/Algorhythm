// 정점의 갯수 받기
var input = Int(readLine()!)!
// graph 정의하기
var graph = Array(repeating: [Int](), count: input+1)

// graph 채우기
for _ in 1..<input {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[nums[0]].append(nums[1])
    graph[nums[1]].append(nums[0])
}

var visited = Array(repeating: false, count: input+1)
var targetDFS = readLine()!.split(separator: " ").map {Int(String($0))!}
var priorityOrder = Array(repeating: -1, count: input+1)
// [[], [2, 3]...
// 위와 같은 경우에서 1에서 2나 3으로 갈 수 있다.
// 근데 실제로 targetDFS는 3을 먼저 갈 수 있다.
// 따라서 graph도 [[], [3, 2]로 sorting을 해주는 것!
for t in 0..<input {
    priorityOrder[targetDFS[t]] = t + 1
    // targetDFS가 1 3 2 4라면?
    // priorityOrder는
    // 1 3 2 4 가 된다!..
}
for i in 1...input {
    graph[i].sort { priorityOrder[$0] < priorityOrder[$1] }
}
var answer = [Int]()
func DFS(start: Int) {
    visited[start] = true
    answer.append(start)
    for i in graph[start] {
        if !visited[i] {
            DFS(start: i)
        }
    }
}

DFS(start: 1)

if answer == targetDFS {
    print(1)
} else {
    print(0)
}