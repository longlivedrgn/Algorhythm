// 개발자 조안님의 블로그 답 돌려보기
let input = Int(String(readLine()!))!
var graph = Array(repeating: [Int](), count: input + 1)

for _ in 1..<input{
    let a = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[a[0]].append(a[1])
    graph[a[1]].append(a[0])
}

var order = readLine()!.split(separator: " ").map{Int(String($0))!} // 해당 값이 맞는 지 판단하면 된다.
var bfsOrder = Array(repeating: -1, count: order.count + 1) // 전체를 -1로 밀기
var result = [Int]()

func bfs(){
    var queue = [Int]()
    var visited = Array(repeating: false, count: input + 1)

    queue.append(1)
    visited[1] = true
    result.append(1)
    while !queue.isEmpty{
        let pop = queue.removeFirst()
        for i in graph[pop]{
            if !visited[i]{
                queue.append(i)
                visited[i] = true
                result.append(i)
            }
        }

    }
}

for i in 0..<order.count{
    bfsOrder[order[i]] = i + 1 // 우선순위 부여하기
}

for i in 1...input {
    graph[i].sort{ bfsOrder[$0] < bfsOrder[$1] } // 우선순위에 맞게 graph를 정렬하기
}

bfs()

if result == order {
    print(1)
}else{
    print(0)
}