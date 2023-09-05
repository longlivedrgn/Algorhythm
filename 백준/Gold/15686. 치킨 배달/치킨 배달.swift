
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
let lineCount = nums[0]
let maxChickenCount = nums[1]
var house = [(Int, Int)]()
var board = [[Int]]()
var chicken = [(Int, Int)]()

for _ in 0..<lineCount {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}


for i in 0..<lineCount {
    for j in 0..<lineCount {
        if board[i][j] == 1 {
            house.append((i + 1, j + 1))
        } else if board[i][j] == 2 {
            chicken.append((i + 1, j + 1))
        }
    }
}

// 조합 구하기
var results = [[(Int, Int)]]()
var picked = [(Int, Int)]()
var visited = Array(repeating: false, count: chicken.count)
func pick(toPick: Int, start: Int) {
    if toPick == 0 {
        results.append(picked)
        return
    }

    for i in start..<chicken.count {
        if visited[i] {
            continue
        }
        visited[i] = true
        picked.append(chicken[i])
        pick(toPick: toPick - 1, start: i + 1)
        picked.removeLast()
        visited[i] = false
    }
}

pick(toPick: maxChickenCount, start: 0)

var ans = 987654321
for result in results {
    var sum = 0
    for h in house {
        var distance = Int.max
        for c in result { // 한 집의 치킨 거리 구하기
            let dist = abs(c.0 - h.0) + abs(c.1 - h.1)
            distance = min(distance, dist)
        }
        sum += distance
    }
    ans = min(sum, ans)
}
print(ans)