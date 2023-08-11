
import Foundation

struct Queue<T> {
    var inputStack = [T]()
    var outputStack = [T]()

    mutating func append(_ x: T) {
        inputStack.append(x)
    }

    mutating func pop() -> T? {
        var top: T?
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
            top = outputStack.popLast()
        }
        else {
            top = outputStack.popLast()
        }
        return top
    }

    mutating func head() -> T? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack.removeAll()
        }
        return outputStack.isEmpty ? nil : outputStack[outputStack.endIndex-1]
    }

    func isEmpty() -> Bool {
        return inputStack.isEmpty && outputStack.isEmpty ? true : false
    }
}
// 각 칸마다 방문한 체크할 수 있는 배열 생성하기
// asnwer를 가장 크게 일단 정의하기!
// 일단 BFS로 각 배열들을 1이 아닌 다른 숫자로 바꾸기!

// 바다를 건너면서 가장 짧은 거리를 구하기!
// 거리를 담을 수 있는 배열 또 생성하기
// 다른 땅을 만나면 기존 답과 비교해서 업데이트하기

// 그래서 결과적으로 answer를 던지기!

var input = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<input {
    map.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
// 방문체크하기!
var visited = Array(repeating: Array(repeating: false, count: input), count: input)

// 해당 카운트로 섬을 물들이기!
var count = 1

// 4방향
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// 같은 섬끼리는 같은 페인트로 칠하기!
func paintBFS(row: Int, column: Int) {
    var queue = Queue<[Int]>()
    queue.append([row, column])
    map[row][column] = count

    while !queue.isEmpty() {
        let popped = queue.pop()!
        for i in 0...3 {
            let nx = popped[0] + dx[i]
            let ny = popped[1] + dy[i]

            if nx < 0 || ny < 0 || nx >= input || ny >= input {
                continue
            }

            if map[nx][ny] == 1 && !visited[nx][ny] {
                queue.append([nx, ny])
                visited[nx][ny] = true
                map[nx][ny] = count
            }
        }

    }
}

// 섬 칠하기!
for row in 0..<input {
    for column in 0..<input {
        if map[row][column] == 1 && !visited[row][column] {
            paintBFS(row: row, column: column)
            count += 1
        }
    }
}

// 다리 놓기!..
// 거리가 저장된 배열을 만들기!
// 만약 count와 같은 놈이 있으면 queue에 넣어주기! 그리고 거리는 0으로 지정하기!
// queue를 돌리기!..
// 갈 수 없는 곳이면 넘기기!
// 다른 땅을 만나면 기존 값과 비교해서 업데이트하기
// 바다를 만나면 거리를 +1 하기
var answer = Int.max

func bridgeBFS(count: Int) {
    var length = Array(repeating: Array(repeating: -1, count: input), count: input)
    var queue = Queue<[Int]>()
    for row in 0..<input {
        for column in 0..<input {
            if map[row][column] == count {
                length[row][column] = 0
                queue.append([row, column])
            }
        }
    }

    while !queue.isEmpty() {
        let popped = queue.pop()!

        for i in 0...3 {
            let nx = popped[0] + dx[i]
            let ny = popped[1] + dy[i]

            if nx < 0 || ny < 0 || nx >= input || ny >= input {
                continue
            }

            if map[nx][ny] > 0 && map[nx][ny] != count {
                answer = min(answer, length[popped[0]][popped[1]])
                return
            }

            if length[nx][ny] == -1 && map[nx][ny] == 0 {
                length[nx][ny] = length[popped[0]][popped[1]] + 1
                queue.append([nx, ny])
            }

        }
    }

}

// (count-1) 만큼 돌려주기!.. BFS를!
// 나머지 한 개는 이미 다른 곳에서 봤응께!
for m in 1..<count {
    bridgeBFS(count: m)
}

print(answer)
