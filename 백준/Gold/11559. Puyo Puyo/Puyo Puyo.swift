var board = [[String]]()

for _ in 0..<12 {
    board.append(Array(readLine()!).map {String($0)})
}

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]


func BFS(row: Int, column: Int) -> [(Int,Int)] {
    var queue = [(Int, Int)]()
    var temp = [(Int, Int)]()
    queue.append((row, column))
    temp.append((row, column))

    while !queue.isEmpty {
        let (a, b) = queue.removeFirst()
        for i in 0..<4 {
            let nx = a + dx[i]
            let ny = b + dy[i]
            let rangeNx = 0..<12
            let rangeNy = 0..<6
            if rangeNx ~= nx && rangeNy ~= ny  && board[nx][ny] == board[row][column] && visited[nx][ny] == false {
                queue.append((nx, ny))
                temp.append((nx, ny))
                visited[nx][ny] = true
            }
        }
    }
    return temp
}

func delete(_ temp: [(Int, Int)]) {
    for (row, column) in temp {
        board[row][column] = "."
    }
}

func shift() {
    for i in 0..<6 {
        for j in stride(from: 11, to: 0, by: -1) {
            if board[j][i] != "." { continue }
            var k = j-1
            while k >= 0 {
                if board[k][i] == "." {
                    k -= 1
                    continue
                }
                board[j][i] = board[k][i]
                board[k][i] = "."
                break
            }
        }
    }

}


var answer = 0
var visited = Array(repeating: Array(repeating: false, count: 6), count: 12)

while true {
    var flag = false
    //    var visited = Array(repeating: Array(repeating: false, count: 6), count: 12)

    for row in 0..<12 {
        for column in 0..<6 {
            if board[row][column] != "." && visited[row][column] == false {
                visited[row][column] = true
                let temp = BFS(row: row, column: column)
                if temp.count >= 4 {
                    flag = true
                    delete(temp)
                }

            }
        }
    }
    if flag == false {
        break
    }
    shift()
    answer += 1
    visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
}

print(answer)