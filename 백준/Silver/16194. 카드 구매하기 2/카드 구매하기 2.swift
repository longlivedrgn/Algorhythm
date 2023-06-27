import Foundation

var num = Int(readLine()!)!
var arr = readLine()!.components(separatedBy: " ").map {Int($0)!}
var dp = Array(repeating: 10001, count: num+1)
dp[0] = 0
dp[1] = arr[0]

for i in 1...num {
    for j in 0..<i {
        dp[i] = min(dp[i], dp[j]+arr[i-j-1])
    }
}
print(dp[num])