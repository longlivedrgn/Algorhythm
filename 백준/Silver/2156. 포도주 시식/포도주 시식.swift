var input = Int(readLine()!)!
// 세 가지가 존재한다.
// 첫번째 - 현재 위치의 포도주 + 전 포도주 + 전전 포도주는 먹지 않는다. => wine[i] + wine[i-1] + dp[i-3]
// 두번째 - 현재 위치의 포두주 + 전전 포도주 => wine[i] + dp[i-2]
// 세번째 - 현재 위치의 포도주를 먹지 않는다. => dp[i-1]
var dp = Array(repeating: 0, count: input)
var wine = Array(repeating: 0, count: input)

for k in 0..<input {
    let num = Int(readLine()!)!
    wine[k] = num
}

dp[0] = wine[0]

if input == 1 {
    print(dp[0])
} else if input == 2 {
    print(wine[0]+wine[1])
} else if input == 3 {
    print(max(wine[0]+wine[1],wine[1]+wine[2],wine[0]+wine[2]))
} else {
    dp[1] = wine[0] + wine[1]
    dp[2] = max(wine[0]+wine[1],wine[1]+wine[2],wine[0]+wine[2])
    for i in 3..<input {
        dp[i] = max(wine[i]+wine[i-1]+dp[i-3], wine[i]+dp[i-2],dp[i-1])
    }
    print(dp[input-1])
}