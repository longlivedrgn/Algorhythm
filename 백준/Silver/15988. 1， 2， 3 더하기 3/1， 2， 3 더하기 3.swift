import Foundation

var input = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001)
dp[0] = 1
dp[1] = 1
dp[2] = 2

for i in 3..<1000001 {
    dp[i] = (dp[i-3] + dp[i-2] + dp[i-1])%1000000009
}

for _ in 0..<input {
    var newInput = Int(readLine()!)!
    print(dp[newInput])
}