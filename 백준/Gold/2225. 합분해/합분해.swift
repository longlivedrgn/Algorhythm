import Foundation

// components - return: [String] -> import Foundation 필수
var nums = readLine()!.components(separatedBy: " ").map {Int($0)!}
var sum = nums[0]
var number = nums[1]
var dp = Array(repeating: Array(repeating: 0, count: number+1), count: sum+1)

for i in 0..<sum {
    for j in 0..<number {
        if i == 0 {
            dp[i][j] = j+1
        } else if  j == 0 {
            dp[i][j] = 1
        } else {
            dp[i][j] = (dp[i][j-1] + dp[i-1][j])%1000000000
        }
    }
}

print(dp[nums[0]-1][nums[1]-1])
