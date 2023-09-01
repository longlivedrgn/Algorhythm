
// 각각 스티커 한개 씩 보는데
// 현재 board에 붙힐 수 있으면 바로 붙히고, 그게 아니면 rotate한다.
// 붙힐 수 있나 판단하기!.. 해당 sticker와 board의 row, column가지고

var inputs = readLine()!.split(separator: " ").map {Int(String($0))!}
var board = [[Bool]](repeating: [Bool](repeating: true, count: inputs[1]), count: inputs[0])
var attachCount = 0

// sticker 전체를 받고, board의 point를 받아서 sticker를 붙힐 수 있는 지 판단하기
func isAttachable(_ sticker: [[Int]], to point: (Int, Int)) -> Bool {
    for row in 0..<sticker.count {
        for column in 0..<sticker[0].count {
            let plusRow = point.0 + row
            let plustColumn = point.1 + column

            guard plusRow < board.count && plustColumn < board[0].count else { return false } // board 범위 안에 있는 지 확인
            guard sticker[row][column] == 1 else { continue } // sticker 값이 0이면 확인할 필요가 없다.
            guard board[plusRow][plustColumn] == true else { return false } // board가 비어있어야지 sticker를 붙힐 수 있다.
        }
    }
    return true
}

// 배열을 돌리기!~!
func rotate(_ sticker: [[Int]]) -> [[Int]] {
    let rowSize = sticker.count
    let columnSize = sticker[0].count
    var rotated = [[Int]](repeating: [Int](repeating: 0, count: rowSize), count: columnSize)

    for row in 0..<rowSize {
        for column in 0..<columnSize {
            rotated[column][rowSize-row-1] = sticker[row][column]
        }
    }
    return rotated
}

func attach(_ sticker: [[Int]], to point: (Int, Int)) {
    for row in 0..<sticker.count {
        for column in 0..<sticker[0].count {
            guard sticker[row][column] == 1 else { continue }
            board[point.0 + row][point.1 + column] = false
            attachCount += 1
        }
    }
}

func tryAttach(_ sticker: [[Int]]) -> Bool {
    for row in 0..<inputs[0] {
        for column in 0..<inputs[1] {
            guard isAttachable(sticker, to: (row, column)) else { continue }
            attach(sticker, to: (row, column))
            return true
        }
    }
    return false
}



for _ in 0..<inputs[2] {
    let stickerRC = readLine()!.split(separator: " ").map {Int(String($0))!}
    var sticker = [[Int]]() // sticker 담기
    for _ in 0..<stickerRC[0] {
        sticker.append(readLine()!.split(separator: " ").map {Int(String($0))!})
    }

    for _ in 0..<4 {
        guard tryAttach(sticker) else {
            sticker = rotate(sticker)
            continue
        }
        break
    }
}

print(attachCount)