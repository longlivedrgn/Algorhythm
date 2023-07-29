// while input이 0, 0 일때까지 계속 받기!..
// 그리고 4방향 좌료를 일단 정의하기
let dr = [-1, 0, 1, 0, -1, 1, -1, 1] // 상, 우, 하, 좌, 우상, 우하, 좌상, 좌하
let dc = [0, 1, 0, -1, 1, 1, -1, -1]

while true {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    if input == [0, 0] {
        break
    }

    let width = input[0]
    let height = input[1]
    var graph = [[Int]]()
    var count = 0 // 섬 갯수 세기

    for _ in 0..<height {
        graph.append(readLine()!.split(separator: " ").map {Int(String($0))!})
    }

    func DFS(c: Int, r: Int) {
        graph[r][c] = 0

        for i in 0..<dr.count {
            let newR = r + dr[i]
            let newC = c + dc[i]

            if newR < 0 || newR >= height || newC < 0 || newC >= width {
                continue
            }

            if graph[newR][newC] == 1 {
                DFS(c: newC, r: newR)
            }
        }
    }

    for c in 0..<width {
        for r in 0..<height {
            if graph[r][c] == 1 {
                count += 1
                DFS(c: c, r: r)
            }
        }
    }

    print(count)
}