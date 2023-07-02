import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

// dp[4] = dp[4 - 2*2] + 1 = dp[0] + 1 = 1
// dp[5] = dp[5 - 2*2] + 1 = dp[1] + 1 = 2
// dp[6] = dp[6 - 2*2] + 1 = dp[2] + 1 = 3
for i in 1...n {
    // 해당 숫자 값으로 일단 초기화!
    dp[i] = i
    for j in 1..<i{
        // 제곱수가 현재 i 보다 커지면 break
        if i < j*j {
            break
        }
        // 최소 값을 담을 수 있도록 작은 거 계속 업데이트 해주기!
        if dp[i] > dp[i-(j*j)] + 1 {
            dp[i] = dp[i-(j*j)] + 1
        }
    }
}

print(dp[n])