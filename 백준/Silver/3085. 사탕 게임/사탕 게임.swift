
// 일단 n*n 인 지를 num으로 받는다.
var num = Int(readLine()!)!
// 그리고 사탕판을 채운다!!
var stringPad = [[String]]()

// 사탕판을 받으면 해당 사탕판의 연속된 사탕이 몇 개인지를 던지는 함수
func check(lst: [[String]]) -> Int {
    // 일단 기본은 1개이다.
    var answer = 1
    for i in 0..<num {
        var count = 1
        // 열 체크하기 -> 가로 방향으로 세기
        for k in 1..<num {
            if lst[i][k] == lst[i][k-1] {
                count += 1
            } else {
                count = 1
            }
            if count > answer {
                answer = count
            }
        }
        // 행 체크하기 전에 다시 0으로 초기화하기!!
        count = 1
        // 행 체크하기 -> 세로 방향으로 세기
        for m in 1..<num {
            if lst[m][i] == lst[m-1][i] {
                count += 1
            } else {
                count = 1
            }
            if count > answer {
                answer = count
            }
        }
    }
    return answer
}
// stringPad를 채우기
for _ in 0..<num {
    stringPad.append(Array(readLine()!).map {String($0)})
}
// 답으로 일단 1로 초기화 해놓기
var realAnswer = 1

// 모든 경우의 수를 다 해보는데
// 열, 행으로 서로 바꿔보고 count해보고
// 다시 원상복구하기를 반복한다.
for k in 0..<num {
    for j in 0..<num {
        // 열끼리 바꿔보기
        if j+1 < num {
            stringPad[k].swapAt(j, j+1)
            var temp = check(lst: stringPad)

            if temp > realAnswer {
                realAnswer = temp
            }
            stringPad[k].swapAt(j, j+1)
        }
        // 행끼리 바꿔보기
        if k+1 < num {
            var tempValue = stringPad[k][j]
            stringPad[k][j] = stringPad[k+1][j]
            stringPad[k+1][j] = tempValue

            var temp = check(lst: stringPad)

            if temp > realAnswer {
                realAnswer = temp
            }
            tempValue = stringPad[k][j]
            stringPad[k][j] = stringPad[k+1][j]
            stringPad[k+1][j] = tempValue
        }
    }
}
print(realAnswer)