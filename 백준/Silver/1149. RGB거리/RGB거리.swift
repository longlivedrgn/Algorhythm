import Foundation

var input = Int(readLine()!)!
var dp = [[Int]]() // 입력 값들(RGB)을 담는 통으로 먼저 사용하자
for _ in 0..<input {
    dp.append(readLine()!.components(separatedBy: " ").map {Int($0)!})
}
// [[26, 40, 83], [49, 60, 57], [13, 89, 99]] -> 먼저 이렇게 만들자!

// 그리고, 매 줄 마다 최솟값으로 각 dp 값들을 업데이트하기
for k in 1..<input {
    dp[k][0] = min(dp[k-1][1], dp[k-1][2]) + dp[k][0]
    dp[k][1] = min(dp[k-1][0], dp[k-1][2]) + dp[k][1]
    dp[k][2] = min(dp[k-1][1], dp[k-1][0]) + dp[k][2]
}
// 그리고, 마지막 줄에서 최솟값으로 값 도출해내기
print(min(dp[input-1][0],dp[input-1][1],dp[input-1][2]))