let boardCount = Int(readLine()!)!
let appleCount = Int(readLine()!)!

var board = Array(repeating: Array(repeating: 0, count: boardCount), count: boardCount)

for _ in 0..<appleCount {
    let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    board[nums[0]-1][nums[1]-1] = 2
}

let turnCount = Int(readLine()!)!
var dict: [Int: String] = [:]

for _ in 0..<turnCount {
    var nums = readLine()!.split(separator: " ").map {String($0)}
    dict[Int(nums[0])!] = nums[1]
}

var count = 0
var queue = [(Int, Int)]()
var direction = 0

let dr = [0, 1, 0, -1] // 동, 남, 서, 북
let dc = [1, 0, -1, 0]

queue.append((0,0))
board[0][0] = 1

var currentRow = 0
var currentColumn = 0

func turnDirection() {
    if let directionWay = dict[count] {
        if directionWay == "L" {
            let temp = (direction - 1) % 4
            if temp < 0 {
                direction = temp + 4
            } else {
                direction = temp
            }
        } else {
            direction = (direction + 1) % 4
        }
    } else {
        return
    }
}

while true {
    count += 1
    currentRow  += dr[direction]
    currentColumn += dc[direction]

    if currentRow < 0 || currentColumn < 0 || currentRow >= boardCount || currentColumn >= boardCount {
        break
    }

    if board[currentRow][currentColumn] == 2 {
        queue.append((currentRow, currentColumn))
        board[currentRow][currentColumn] = 1
        turnDirection()
    } else if board[currentRow][currentColumn] == 0 {
        queue.append((currentRow, currentColumn))
        board[currentRow][currentColumn] = 1
        let removed = queue.removeFirst()
        board[removed.0][removed.1] = 0
        turnDirection()
    } else {
        break
    }
}

print(count)