
var input = Int(readLine()!)!
var dp = Array(repeating: 0, count: 31)
dp[2] = 3
dp[4] = 11

if input > 5 {
    for k in stride(from: 6, through: input, by: 2) {
        for m in stride(from: k-4, through: 2, by: -2) {
            dp[k] += dp[m] * 2
        }
        dp[k] += dp[k-2]*dp[2] + 2
    }
}

if input % 2 == 1 {
    print(0)
} else {
    print(dp[input])
}