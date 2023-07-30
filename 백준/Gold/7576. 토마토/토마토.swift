class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []

    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }

    init(_ queue:[T]){
        self.enqueue = queue
    }

    func push(_ n: T){
        enqueue.append(n)
    }

    func pop() -> T?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }

}
////import Foundation
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
// 4방향 좌료를 일단 정의하기
let dr = [-1, 0, 1, 0] // 상, 우, 하, 좌
let dc = [0, 1, 0, -1]
var graph = [[Int]]()
// 그래프 채우기
for _ in 0..<nums[1] {
    graph.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
// 비어있는 queue 생성하기
var Q: Queue = Queue([]) // r, c

// 일단 1인 거 싹 다 넣기!
for c in 0..<nums[0] {
    for r in 0..<nums[1] {
        if graph[r][c] == 1 {
            Q.push([r, c])
        }
    }
}

// 처음 answer 설정하기
var answer = -1

func BFS() {
    // Q가 빌 때까지 즉, 더 이상 갈 곳이 없을 때까지 돌린다!
    while !Q.isEmpty {
        // 한 depth가 들어가므로 answer를 1 더해준다.
        answer += 1
        for _ in 0..<Q.count { // 한 뎁스 내에서 들어온 모든 정점을 순회하기!
            let current = Q.pop() as! [Int]

            for i in 0..<4 {
                let newDr = current[0] + dr[i]
                let newCr = current[1] + dc[i]

                if newDr < nums[1] && newDr>=0 && newCr < nums[0] && newCr>=0 {
                    // 만약 주변에 갈 수 있는 곳이 있다면!
                    if graph[newDr][newCr] == 0 {
                        // Q에 넣어주고!
                        Q.push([newDr, newCr])
                        // 해당 위치의 값을 바꿔준다! 1로! -> 다음 번에는 다시 방문안하도록!
                        graph[newDr][newCr] = 1
                    }
                }
            }
        }
    }
}

BFS()
for c in 0..<nums[0] {
    for r in 0..<nums[1] {
        if graph[r][c] == 0 {
            answer = -1
        }
    }
}
print(answer)