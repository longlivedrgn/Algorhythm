var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
let rowCount = nums[0]
let columnCount = nums[1]
let orderCount = nums[4]

enum Direction: Int {
    case north = 3
    case south = 4
    case west = 2
    case east = 1
}

var board = [[Int]]()

for _ in 0..<rowCount {
    board.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

let dr = [0, 0, -1, 1] // 동, 서, 북, 남
let dc = [1, -1, 0, 0]

var currentDice = [0, 0, 0, 0, 0, 0] // 위, 아래, 동, 서, 남, 북
var start = [nums[2], nums[3]]
let orderArray = readLine()!.split(separator: " ").map {Int(String($0))!}

for order in orderArray {
    let direction = Direction(rawValue: order)!
    let nr = start[0] + dr[order-1]
    let nc = start[1] + dc[order-1]

    if nr < 0 || nc < 0 || nc >= columnCount || nr >= rowCount {
        continue
    }
    switch direction {
    case .east:
        moveToEast(direction: direction)
    case .north:
        moveToNorth(direction: direction)
    case .south:
        moveToSouth(direction: direction)
    case .west:
        moveToWest(direction: direction)
    }

    print(currentDice[0])

    if board[nr][nc] == 0 {
        board[nr][nc] = currentDice[1]
    } else {
        currentDice[1] = board[nr][nc]
        board[nr][nc] = 0
    }
    start = [nr, nc]
}


func moveToEast(direction: Direction) {
    let temp = currentDice
    // 위, 서
    currentDice[0] = temp[3]

    // 아래, 동
    currentDice[1] = temp[2]

    // 동, 위
    currentDice[2] = temp[0]

    // 서, 아래
    currentDice[3] = temp[1]
}

// var currentDice = [0, 0, 0, 0, 0, 0] // 위, 아래, 동, 서, 남, 북
func moveToWest(direction: Direction) {
    let temp = currentDice
    currentDice[0] = temp[2]

    currentDice[1] = temp[3]

    currentDice[3] = temp[0]

    currentDice[2] = temp[1]
}

func moveToNorth(direction: Direction) {
    let temp = currentDice
    currentDice[5] = temp[0]

    currentDice[4] = temp[1]

    currentDice[1] = temp[5]

    currentDice[0] = temp[4]
}

func moveToSouth(direction: Direction) {
    let temp = currentDice
    currentDice[5] = temp[1]

    currentDice[4] = temp[0]

    currentDice[1] = temp[4]

    currentDice[0] = temp[5]
}