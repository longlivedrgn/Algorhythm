var input = Int(readLine()!)!
var board = Array(repeating: Array(repeating: 0, count: input), count: input)
var visitedColumn = Array(repeating: false, count: input)
var count = 0

func DFS(depth: Int, column: Int) {

    if depth == (input-1) {
        count += 1
        return
    }
    // depth = 1 이고 두번째 줄 채웠고, 3번째 보고있다!.
    // k가 다음에 올 column이다!..
    for k in 0..<input {
        var isOk = true
        if visitedColumn[k] {
            continue
        }
        for m in 0...depth {
            // 한 뎁스끼리 가면서 대각선 확인하기!..
            if k-m-1 >= 0 {
                if board[depth-m][k-m-1] == 1 {
                    isOk = false
                    break
                }
            }

            if k+m+1 < input {
                if board[depth-m][k+m+1] == 1 {
                    isOk = false
                    break
                }
            }
        }
        // 돌렸는데 만약 대각선에 1이 존재했으면!.. continue 돌리기!~
        if !isOk {
            continue
        }

        visitedColumn[k] = true
        board[depth+1][k] = 1
        DFS(depth: depth+1, column: k)
        visitedColumn[k] = false
        board[depth+1][k] = 0
    }

}

for i in 0..<input {
    visitedColumn[i] = true
    board[0][i] = 1
    DFS(depth: 0, column: i)
    visitedColumn[i] = false
    board[0][i] = 0
}

print(count)