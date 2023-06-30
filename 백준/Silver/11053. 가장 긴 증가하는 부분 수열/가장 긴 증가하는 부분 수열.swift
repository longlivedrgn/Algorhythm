import Foundation

let n = Int(readLine()!)!
var nums = readLine()!.components(separatedBy: " ").map {Int($0)!}
// dp[index] => nums[index]를 증가수열의 마지막으로 가지는 증가수열의 증가수열 길이
var dp = Array(repeating: 1, count: n)

// 지금 만약 nums의 4번째 index에 있는 것을 검사하고 있다면?
for i in 1..<n {
    // nums의 0~3번까지의 값들을 4번째 값과 비교한다.
    // 만약 4번째 값이 더 크다면? => 증가수열이 생길 가능성이 있다!
    for j in 0..<i {
        if nums[i] > nums[j] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}

print(dp.max()!)