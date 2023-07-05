import Foundation

var input = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 3), count: input)

// 아무것도 선택안하면, 그 전 단계 (아무 것도 선택 안한 거) + (왼쪽) + (오른쪽)
// 왼쪽 꺼 선택하면, 그 전 단계 (아무 것도 선택 안한 거) + (오른쪽)
// 오른쪽 꺼 선택하면, 그 전 단계 (아무 것도 선택 안한 거) + (왼쪽)
dp[0][0] = 1
dp[0][1] = 1
dp[0][2] = 1

for i in 1..<input {
    dp[i][0] = (dp[i-1][1] + dp[i-1][0] + dp[i-1][2])%9901
    dp[i][1] = (dp[i-1][0] + dp[i-1][2])%9901
    dp[i][2] = (dp[i-1][0] + dp[i-1][1])%9901
}

print((dp[input-1][0]+dp[input-1][1]+dp[input-1][2])%9901)