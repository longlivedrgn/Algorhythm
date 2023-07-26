var input = Int(readLine()!)!
var numbers = [[Int]]() // 판을 받을 수 있는 배열 생성
var minValue = Int.max // 계속해서 업데이트를 할 최소 값
var visited = Array(repeating: false, count: input) // 방문했는 지 판단하기 위한 배열

// 배열 채우기
for _ in 0..<input {
    numbers.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

func DFS(depth: Int, idx: Int) {

    // 만약 배열 범위 밖으로 넘어가면 return 해버리기!
    // 넘어가는 상황에서는 이미 depth == input/2 이므로
    // 아래 if 문 전에 return을 때려야한다.
    if idx >= input {
        return
    }
    // 그냥 바로 바로 계산때리기!..
    // sttart 팀은 true로
    // link 팀은 false로 해서 계산하기
    var sttart = 0
    var link = 0
    // 2차원 배열 전체 순회하기
    for j in 0..<input {
        for k in 0..<input {
            if visited[j] == true && visited[k] == true {
                sttart += numbers[j][k]
            }
            if visited[j] == false && visited[k] == false {
                link += numbers[j][k]
            }
        }
    }

    // 최솟값 업데이트해주기
    minValue = min(minValue, abs(sttart-link))

    for m in idx..<input {
        visited[m] = true
        DFS(depth: depth+1, idx: m+1)
        visited[m] = false
    }
}

DFS(depth: 0, idx: 0)
print(minValue)