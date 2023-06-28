import Foundation

let n = Int(readLine()!)!
var dp = [[Int]](repeating: Array(repeating: 0, count: 10), count: n+1)
dp[1][0] = 0
for j in 1...9 {
    dp[1][j] = 1
}

for i in 2..<n+1 {
    for j in 0...9 {
        if j == 0 {
            dp[i][j] = dp[i-1][1]%1000000000
        } else  if j == 9 {
            dp[i][j] = dp[i-1][8]%1000000000
        } else {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1])%1000000000
        }
    }
}
var sum = 0
for k in 0...9 {
    sum += dp[n][k]
}

print(sum%1000000000)