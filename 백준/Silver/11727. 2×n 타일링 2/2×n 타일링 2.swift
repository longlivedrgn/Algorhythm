import Foundation

var num = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)

dp[1] = 1
dp[2] = 3

if num >= 3 {
    for i in 3...num {
        dp[i] = (dp[i-1] + 2*dp[i-2])%10007
    }
}

print(dp[num])