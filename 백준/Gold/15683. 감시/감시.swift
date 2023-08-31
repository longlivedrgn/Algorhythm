
// cctv를 담을 수 있는 배열을 만들자! -> [cctv종류,행,열]
// directionMode => 각각이 볼 수 있는 방향을 배열에 담아두기
// graph 담아두기
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var realRow = nums[0]
var realColumn = nums[1]

// 북 - 동 - 남 - 서
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
// 카메라가 볼 수 있는 방향을 담아두기!..
var directionMode = [
    [],
    [[0], [1], [2], [3]],
    [[0, 2], [1, 3]],
    [[0, 1], [1, 2], [2, 3], [0, 3]],
    [[0, 1, 2], [0, 1, 3], [1, 2, 3], [0, 2, 3]],
    [[0, 1, 2, 3]],
]
var board = [[Int]]() // 일단 보드 채우기!..
var camera = [[Int]]() // [카메라 종류, row, column]
for r in 0..<realRow {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    for (column, number) in nums.enumerated() {
        if number != 0 && number != 6 {
            camera.append([number, r, column])
        }
    }
    board.append(nums)
}

// 그냥 싹 다 돌려보기!.. -> DFS를 활용해서 모든 경우의 수를 싹 다 해보기, 그리고 min
var minValue = Int.max

func fillTheZero(cameraDirection: [Int], row: Int, column: Int, tempBoard: [[Int]]) -> [[Int]] {
    var board = tempBoard
    for direction in cameraDirection { // 방향 안에 있는 4방향들을 순회하기
        var tempRow = row
        var tempColumn = column


        while true {
            tempRow += dx[direction]
            tempColumn += dy[direction]
            if tempRow < 0 || tempColumn < 0 || tempRow >= realRow || tempColumn >= realColumn {
                break
            }

            if board[tempRow][tempColumn] == 6 {
                break
            }

            if board[tempRow][tempColumn] == 0 {
                board[tempRow][tempColumn] = 7
            }
        }
    }

    return board
}


func dfs(board: [[Int]], depth: Int) {
    if depth == camera.count {
        var count = 0
        for m in board {
            for j in m {
                if j == 0 {
                    count += 1
                }
            }
        }

        minValue = min(minValue, count)
        return
    }

    var tempBoard = board
    let tempCameraType = camera[depth][0] // 카메라의 종류 가져오기
    let tempRow = camera[depth][1] // 카메라가 있는 row 가져오기
    let tempColumn = camera[depth][2] // 카메라가 있는 column 가져오기

    for mode in directionMode[tempCameraType] { // 만약 타입에 따른 방향 가져오기! [Int]
        let board = fillTheZero(cameraDirection: mode, row: tempRow, column: tempColumn, tempBoard: tempBoard) // 가져온 방향으로 쭉 색칠하기!
        dfs(board: board, depth: depth+1) // 색칠된 board를 dfs 함수에 같이 넘기기!..
    }
}

dfs(board: board, depth: 0)
print(minValue)