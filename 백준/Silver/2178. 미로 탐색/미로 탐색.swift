var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
// 4방향 좌료를 일단 정의하기
let dr = [-1, 0, 1, 0] // 상, 우, 하, 좌
let dc = [0, 1, 0, -1]
var graph = [[Int]]()
var answer = Int.min
var count = 0
for _ in 0..<nums[0] {
    graph.append(Array(readLine()!).map {Int(String($0))!})
}

var Q = [[0,0]] // r, c
func BFS() {
    while !Q.isEmpty {
        var current = Q.removeFirst()

        for i in 0..<4 {
            var newDr = current[0] + dr[i]
            var newCr = current[1] + dc[i]

            if newDr >= nums[0] || newDr<0 || newCr >= nums[1] || newCr<0 {
                continue
            }

            if graph[newDr][newCr] == 1 {
                Q.append([newDr, newCr])
                graph[newDr][newCr] = graph[current[0]][current[1]] + 1
            }
        }
    }
}
BFS()
print(graph[nums[0]-1][nums[1]-1])