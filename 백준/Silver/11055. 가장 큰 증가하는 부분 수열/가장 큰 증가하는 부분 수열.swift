var input = Int(readLine()!)!
var dp = Array(repeating: 0, count: input)
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}

// dp[index] => nums[index]를 마지막으로 포함하는 증가 수열의 합!
dp[0] = nums[0]

for i in 1..<input {
    for j in 0..<i {
        if nums[i] > nums[j] {
            // 이미 전 j에서 설정된 dp[i]를 체크해야된다!!
            dp[i] = max(dp[i], dp[j] + nums[i])
        } else {
            // 이미 전 j에서 설정된 dp[i]를 체크해야된다!!
            dp[i] = max(nums[i],dp[i])
        }
    }
}

print(dp.max()!)