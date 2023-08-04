// 정점의 갯수 받기
var input = Int(readLine()!)!
// graph 정의하기
var graph = Array(repeating: [Int](), count: input+1)
var dist = Array(repeating: 0, count: input + 1)

// graph 채우기
for _ in 0..<input {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[nums[0]].append(nums[1])
    graph[nums[1]].append(nums[0])
}

var visited = Array(repeating: false, count: input+1)
var cycle = Array(repeating: false, count: input+1)

func DFS(start: Int, current: Int, length: Int) {
    for m in graph[current] {
        if current == start && length >= 2 {
            cycle[current] = true
            return
        }

        visited[current] = true

        if visited[m] == false {
            DFS(start: start, current: m, length: length+1)
        } else {
            if length >= 2 && start == m {
                DFS(start: start, current: m, length: length)
            }
        }
    }
}

// 각 정점이 순환선에 들어가있는 지 확인하고
// 순환선에 들어가 있는 정점은 cycle에서 true로 바꿔주기
for i in 1...input {
    visited = Array(repeating: false, count: input+1)
    DFS(start: i, current: i, length: 0)
}

func BFS(node: Int) -> Int {
    var visited = Array(repeating: false, count: input+1)
    var queue = [[Int]]()
    queue.append([node, 0]) // 정점과 거리를 넣어준다.
    while !queue.isEmpty {
        let popped = queue.removeFirst()
        if cycle[popped[0]] { // 만약 순환선 만났으면
            return popped[1] // 거리를 던진다!
        }
        for i in graph[popped[0]] { // 인접 정점 순회하기
            if !visited[i] {
                queue.append([i, popped[1] + 1])
                visited[i] = true
            }
        }
    }
    return 0
}

// dist 채우기
// dist는 순환선까지의 거리를 넣어준다.
for i in 1...input {
    if !cycle[i] { // 만약 순환선 안에 없다면?
        dist[i] = BFS(node: i)
    } else {
        dist[i] = 0
    }
}

dist.removeFirst()
print(dist.map{ String($0) }.joined(separator: " "))