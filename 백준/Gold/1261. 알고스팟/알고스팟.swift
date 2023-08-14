var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var column = nums[0]
var row = nums[1]
var distance = Array(repeating: Array(repeating: Int.max, count: column), count: row)
var graph = [[Int]]()

for t in 0..<row {
    graph.append(Array(readLine()!).map {Int(String($0))!})
}

var queue = [(Int, Int)]()
// 일단 시작점은 distance가 0으로 해놓기
distance[0][0] = 0
// row, column 넣어주기
queue.append((0,0))

// 4방향
let dr = [-1, 1, 0, 0]
let dc = [0, 0, -1, 1]

while !queue.isEmpty {
    let popped = queue.removeFirst()
    for t in 0..<dr.count {
        let nr = popped.0 + dr[t]
        let nc = popped.1 + dc[t]

        if nc<0 || nr<0 || nc >= column || nr >= row  {
            continue
        }
        // 만약 원래 있는 distance값이 내가 현재 있는 곳에서의 거리(distance)에서 가중치를 더한 값보다 크다면!
        // 새로운 값으로 업데이트하기!..
        // 여기서 graph[nr][nc]가 가중치이다!!
        if distance[nr][nc] > distance[popped.0][popped.1] + graph[nr][nc] {
            distance[nr][nc] = distance[popped.0][popped.1] + graph[nr][nc]
            queue.append((nr, nc))
        }
    }
}

print(distance[row-1][column-1])