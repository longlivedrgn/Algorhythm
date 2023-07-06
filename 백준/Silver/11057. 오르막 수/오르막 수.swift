import Foundation

var input = Int(readLine()!)!
var dp = Array(repeating: [1,1,1,1,1,1,1,1,1,1], count: input)

for i in 1..<input {
    dp[i][0] = 1
    for k in 1...9 {
        dp[i][k] = (dp[i-1][k] + dp[i][k-1])%10007
    }
}

var allSum = 0
for m in dp[input-1] {
    allSum += m
}
print(allSum%10007)