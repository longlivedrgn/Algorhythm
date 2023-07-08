var input = Int(readLine()!)!
var dp = Array(repeating: 0, count: input)
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}

// dp[index] => nums[index]를 마지막으로 포함하는 감소 수열의 길이
dp[0] = 1

for i in 1..<input {
    for j in 0..<i {
        if nums[i] < nums[j] {
            // 이미 전 j에서 설정된 dp[i]를 체크해야된다!!
            dp[i] = max(dp[i], dp[j] + 1)
        } else {
            // 이미 전 j에서 설정된 dp[i]를 체크해야된다!!
            dp[i] = max(1,dp[i])
        }
    }
}

print(dp.max()!)