
var input = Int(readLine()!)!
// 세 가지가 존재한다.
// 첫번째 - 현재 위치의 포도주 + 전 포도주 + 전전 포도주는 먹지 않는다. => wine[i] + wine[i-1] + dp[i-3]
// 두번째 - 현재 위치의 포두주 + 전전 포도주 => wine[i] + dp[i-2]
// 세번째 - 현재 위치의 포도주를 먹지 않는다. => dp[i-1]
var dp = Array(repeating: 0, count: input+1)
var wine = Array(repeating: 0, count: input+1)

for k in 1...input {
    let num = Int(readLine()!)!
    wine[k] = num
}

dp[1] = wine[1]

if input > 1 {
    dp[2] = wine[1]+wine[2]
}

if input > 2 {
    for i in 3..<input+1 {
        dp[i] = max(dp[i-1], dp[i-3]+wine[i-1]+wine[i], dp[i-2]+wine[i])
    }
}

print(dp[input])