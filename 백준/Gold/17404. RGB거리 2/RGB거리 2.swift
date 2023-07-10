var input = Int(readLine()!)!
var rgb = [[Int]]() // 입력 값들(RGB)을 담는 통으로 먼저 사용하자
for _ in 0..<input {
    rgb.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
// 최대 가능한 숫자 -> 1000 * 1000 + 1
let max = 1000*1000 + 1
// 답을 계속 업데이트할 값
var ans = Int.max

// 첫번째꺼부터 마지막 꺼까지 돌아가면서 체크하기
for i in 0..<3 {
    var dp = Array(repeating: Array(repeating: max, count: 3), count: input)
    // i = 1이라면, i = 1을 채택하고, 나머지는 max로 구현하여
    // 다음 줄에서 무조건 i =1을 선택할 수 있도록 하기!
    dp[0][i] = rgb[0][i]
    for k in 1..<input {
        dp[k][0] = min(dp[k-1][1], dp[k-1][2]) + rgb[k][0]
        dp[k][1] = min(dp[k-1][0], dp[k-1][2]) + rgb[k][1]
        dp[k][2] = min(dp[k-1][1], dp[k-1][0]) + rgb[k][2]
    }
    for j in 0..<3 {
        if i != j {
            ans = min(ans, dp[input-1][j])
        }
    }
}
print(ans)