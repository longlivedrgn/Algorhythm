
// 북(0)- 위, 동(1)- 오른쪽, 남(2) - 아래, 서(3) - 왼쪽
let dr = [-1, 0, 1, 0]
let dc = [0, 1, 0, -1]
// 0 -> 청소되지 않은 칸
// 1 -> 벽에 있다.
// 2 -> 청소를 했다.

/*
 1. 만약 현재 칸이 청소를 할 수 있다면?
 1-1. 청소를 한다.
 1-2. 현재 칸의 주변 칸 중 청소되지 않은 빈칸이 없다면? -> 즉 청소가 되어있다면?
 1-2. 한칸 후진 -> 벽이면 작동을 멈춘다.

 근데, 만약 주변 칸 중에 청소되지 않은 빈칸이 있다면? -> 있는 쪽으로 전진한다.(근데, 반시계 방향으로 돌린다!~)

 2. 청소가 이미 되어있다면?
 */
let inputNums = readLine()!.split(separator: " ").map {Int(String($0))!}
let rowCount = inputNums[0]
let columnCount = inputNums[1]

var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var startRow = nums[0]
var startColumn = nums[1]
var startDirection = nums[2]

var board = [[Int]]()

for _ in 0..<rowCount {
    board.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
//print(board)
var count = 0

while true {
    if board[startRow][startColumn] == 0 {
        count += 1
        board[startRow][startColumn] = 2
    }

    let (isClean, tempRow, tempColumn, tempNewDirection) = isCleanable(nowRow: startRow, nowColumn: startColumn, direction: startDirection)

    if isClean {
        startRow = tempRow
        startColumn = tempColumn
        startDirection = tempNewDirection
    } else {
        // 뒤로 한번 빽하기 -> 현재 방향의 반대 방향으로 빼하기
        let (canMoveBack, row, column) = moveToBack()
        if !canMoveBack {
            break
        } else {
            startRow = row
            startColumn = column
        }
    }
}

func isCleanable(nowRow: Int, nowColumn: Int, direction: Int) -> (Bool, Int, Int, Int) {
    // 일단 4방에 있는 확인하기 -> 반시계로 한개씩 확인하면서
    var tempDirection = startDirection
    for _ in 0..<4 {
        tempDirection = tempDirection + 3
        if tempDirection >= 4 {
            tempDirection = abs(tempDirection - 4)
        }

        let tempRow = startRow + dr[tempDirection]
        let tempColumn = startColumn + dc[tempDirection]

        if tempRow < 0 || tempColumn < 0 || tempRow >= rowCount || tempColumn >= columnCount {
            continue
        }

        if board[tempRow][tempColumn] == 0 {
            return (true, tempRow, tempColumn, tempDirection)
        }
    }

    return (false, 0, 0, 0)
}

func moveToBack() -> (Bool, Int, Int) {

    var tempNewDirection = startDirection + 2
    if tempNewDirection >= 4 {
        tempNewDirection = abs(tempNewDirection - 4)
    }

    let tempRow = startRow + dr[tempNewDirection]
    let tempColumn = startColumn + dc[tempNewDirection]

    if tempRow < 0 || tempColumn < 0 || tempRow >= rowCount || tempColumn >= columnCount {
        return (false, 0, 0)
    }

    if board[tempRow][tempColumn] == 1 {
        return (false, 0, 0)
    }

    return (true, tempRow, tempColumn)
}

print(count)