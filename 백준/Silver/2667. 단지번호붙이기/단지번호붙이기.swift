var input = Int(readLine()!)!
// DFS + Graph를 활용하자.
// 먼저 Graph를 받자.
var graph = [[Int]]()
// count들을 담는 배열 생성하기
var counts = [Int]()
// 하나의 단지를 이루고 있는 집들의 갯수를 담기
var count = 0
for _ in 0..<input {
    graph.append(Array(readLine()!).map {Int(String($0))!})
}

func DFS(i: Int, j: Int) {
    // 만약 graph를 벗어나면 바로 return 해버리기
    if i>=input || i<0 || j >= input || j<0 {
        return
    }
    // 만약 갈 수 있는 집이 있다면!!
    if graph[i][j] == 1 {
        // 집의 갯수를 하나 추가해준다.
        count += 1
        // 그리고 graph에 해당 위치를 0으로해서 담번에는 못가게 막는다.
        graph[i][j] = 0
        DFS(i: i+1, j: j)
        DFS(i: i, j: j+1)
        DFS(i: i-1, j: j)
        DFS(i: i, j: j-1)
    }
}

for i in 0..<input {
    for j in 0..<input {
        if graph[i][j] == 1 {
            DFS(i: i, j: j)
            counts.append(count)
            count = 0
        }
    }
}
counts.sort()
print(counts.count)
for t in counts {
    print(t)
}