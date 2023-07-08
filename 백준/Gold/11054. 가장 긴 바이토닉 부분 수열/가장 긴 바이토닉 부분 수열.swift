var input = Int(readLine()!)!
var dp = Array(repeating: 1, count: input)
var dpReversed = Array(repeating: 1, count: input)
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var numReversed = Array(nums.reversed())

// dp[index] => nums[index]를 마지막으로 포함하는 감소 수열의 길이
dpReversed[0] = 1
dp[0] = 1
for i in 1..<input {
    for j in 0..<i {
        if numReversed[i] > numReversed[j] {
            // 이미 전 j에서 설정된 dp[i]를 체크해야된다!!
            dpReversed[i] = max(dpReversed[i], dpReversed[j] + 1)
        }
        if nums[i] > nums[j] {
            // 이미 전 j에서 설정된 dp[i]를 체크해야된다!!
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

var result = Array(repeating: 0, count: input)

for i in 0..<input {
    // 자기 자신 겹치는 거 빼기!
    result[i] = dp[i] + dpReversed[input-i-1] - 1
}

print(result.max()!)