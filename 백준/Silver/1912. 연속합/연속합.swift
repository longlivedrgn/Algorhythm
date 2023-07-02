import Foundation
// dp 테이블에는
// 자기 자신이 맨 마지막이면서
// 자기 자신을 맨 마지막으로 하고 가장 큰 합을 작성하면 되지 않을까?..
let n = Int(readLine()!)!
var nums = readLine()!.components(separatedBy: " ").map {Int($0)!}
var dp = Array(repeating: 0, count: n)
dp[0] = nums[0]
// 지금 만약 nums의 4번째 index에 있는 것을 검사하고 있다면?
for i in 1..<n {
    if dp[i-1] + nums[i] > nums[i] {
        dp[i] = dp[i-1] + nums[i]
    } else {
        dp[i] = nums[i]
    }
}
print(dp.max()!)