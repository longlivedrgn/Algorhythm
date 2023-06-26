import Foundation

var num = Int(readLine()!)!
var arr = readLine()!.components(separatedBy: " ").map {Int($0)!}

var dp = Array(repeating: 0, count: num+1)

dp[1] = arr[0]

for i in 2...num {
    var max = arr[i-1]
    for j in 1..<i {
        if max < arr[j-1] + dp[i-j] {
            max = arr[j-1] + dp[i-j]
        }
    }
    dp[i] = max
}
print(dp[num])