import Foundation

var num = Int(readLine()!)! // N*N
var pan = [[Int]]()

for _ in 0..<num {
    pan.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

enum Direction: CaseIterable {
    case up
    case down
    case left
    case right
}

func pushTo(direction: Direction, nowPan: [[Int]]) -> [[Int]] {
    var tempPan = nowPan
    var tempRow: [Int]

    for i in 0..<num {
        switch direction {
        case .up:
            tempRow = (0..<num).map({ each in tempPan[each][i] })
        case .down:
            tempRow = (0..<num).reversed().map({ each in tempPan[each][i] })
        case .left:
            tempRow = tempPan[i]
        case .right:
            tempRow = tempPan[i].reversed()
        }
        // 0 제거하기!
        tempRow = tempRow.filter { $0 != 0 }

        // 만약 0 밖에 없다!.. 즉 filter를 했는데, 애초에 0이여서 tempRow가 0으로 바뀔시에..
        if tempRow.count == 0 {
            continue
        }
        // 옆에 더하기!..
        for m in 0..<tempRow.count-1 {
            if tempRow[m] == tempRow[m+1] {
                tempRow[m] *= 2
                tempRow[m+1] = 0
            }
        }

        // 0 제거하기
        tempRow = tempRow.filter { $0 != 0 }

        // 그리고 뒤에 0 붙히기
        for _ in 0..<num-tempRow.count {
            tempRow.append(0)
        }

        switch direction {
        case .up:
            for t in 0..<num {
                tempPan[t][i] = tempRow[t]
            }
        case .down:
            for t in 0..<num {
                tempPan[num-t-1][i] = tempRow[t]
            }
        case .left:
            tempPan[i] = tempRow
        case .right:
            tempPan[i] = tempRow.reversed()
        }
    }
    return tempPan
}

var result = 0

func calculateMax(calculatePan: [[Int]]) -> Int {
    var maxValue = 0
    for row in 0..<num {
        for column in 0..<num {
            maxValue = max(maxValue, calculatePan[row][column])
        }
    }

    return maxValue
}

func DFS(depth: Int, inputPan: [[Int]]) {
    if depth == 5 {
        result = max(result, calculateMax(calculatePan: inputPan))
        return
    }

    for direction in Direction.allCases {
        var nextPan = pushTo(direction: direction, nowPan: inputPan)
        DFS(depth: depth+1, inputPan: nextPan)
    }
}

DFS(depth: 0, inputPan: pan)
print(result)