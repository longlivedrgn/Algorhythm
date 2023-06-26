import Foundation

var num = Int(readLine()!)!
var dp = Array(repeating: 0, count: 11)

dp[0] = 1
dp[1] = 1
dp[2] = 2

for i in 3...10 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}
for _ in 0..<num {
    let number = Int(readLine()!)!
    print(dp[number])
}