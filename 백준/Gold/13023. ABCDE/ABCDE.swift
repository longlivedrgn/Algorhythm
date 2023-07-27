// 일단 그래프를 받는다.
// [[2,3], [4,5] ... ]
// 만약 위와 같이 그래프가 존재한다면?
// 1번 사람은 2,3번 사람과 친구인 것이다.
// 그러면 이제 2, 3번을 찾아보는 것이다!
// 근데, 중간중간 계속해서 visited을 했는 지 확인한다!

var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var peopleNum = nums[0]
var relationsNum = nums[1]
var graph = Array(repeating: [Int](), count: peopleNum)
// 방문했는 지 확인용
var visited = Array(repeating: false, count: peopleNum)
var complete = false
// 일단 그래프 채워주기
for _ in 0..<relationsNum {
    var numbers = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[numbers[0]].append(numbers[1])
    graph[numbers[1]].append(numbers[0])
}

func DFS(depth: Int, start: Int) {
    if depth == 4 {
        complete = true
        return
    }

    for j in graph[start] {
        if !visited[j] {
            visited[j] = true
            DFS(depth: depth+1, start: j)
            visited[j] = false
        }
    }

}

for i in 0..<peopleNum {
    visited[i] = true
    DFS(depth: 0, start: i)
    if complete {
        print(1)
        break
    }
    visited[i] = false
}

if !complete {
    print(0)
}