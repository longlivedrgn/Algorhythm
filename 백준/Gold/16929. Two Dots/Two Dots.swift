var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
let dr = [-1, 0, 1, 0] // 상, 우, 하, 좌
let dc = [0, 1, 0, -1]

var graph = [[String]]()
// 그래프 채우기
for _ in 0..<nums[0] {
    graph.append(Array(readLine()!).map {String($0)})
}
// 선택된 것인 지 확인하기
var selected = Array(repeating: Array(repeating: false, count: nums[1]), count: nums[0])
// 찾았으면 true, 못찾았으면 false로!
var found = false

func DFS(currentR: Int, currentC: Int, startR: Int, startC: Int, count: Int) {

    // 만약 찾았으면 그냥 return해버리기
    if found {
        return
    }

    // 4방향 순회
    for k in 0..<4 {
        let drr = currentR + dr[k]
        let dcc = currentC + dc[k]
        // 일단 graph 안에 있는 지 확인하기
        if drr >= 0 && dcc >= 0 && drr < nums[0] && dcc < nums[1] {
            // 시작 점과 바뀐 점이 같다면
            if drr == startR && dcc == startC && count >= 4 {
                found = true
                return
            }

            if graph[drr][dcc] == graph[currentR][currentC] && selected[drr][dcc] == false {
                selected[drr][dcc] = true
                DFS(currentR: drr, currentC: dcc, startR: startR, startC: startC, count: count+1)
                selected[drr][dcc] = false
            }
        }
    }

}

for r in 0..<nums[0] {
    for c in 0..<nums[1] {
        selected[r][c] = true
        DFS(currentR: r, currentC: c, startR: r, startC: c, count: 1)
    }
}

if !found {
    print("No")
} else {
    print("Yes")
}