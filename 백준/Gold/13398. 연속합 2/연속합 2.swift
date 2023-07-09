// 몇 개의 숫자가 들어오는 지 일단 받는다!..
var input = Int(readLine()!)!
// dp[0][i] => i를 포함한(마지막 숫자로) 연속 합
// dp[1][i] => i까지의 숫자 하나는 무조건 없어진 연속 합의 최댓 값이다.
// -> i가 없애진 것일 수도 있고, 그 전에 index가 없애진 것일 수 도 있다. 근데 무조건 하나는 없애진 것이다.
// 1) i가 없애진 경우 -> dp[0][i-1]
// 2) i이전에 index가 없애진 경우 -> dp[1][i-1]+nums[i]

var dp = Array(repeating: Array(repeating: 0, count: input), count: 2)
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
// 답을 저장할 변수 설정!..
var ans = -999999
// 일단 첫 번째는 채워준다!..
dp[0][0] = nums[0]

for i in 1..<input {
    dp[0][i] = max(dp[0][i-1]+nums[i], nums[i])
    dp[1][i] = max(dp[1][i-1]+nums[i], dp[0][i-1])
    ans = max(ans, dp[0][i], dp[1][i])
}

if input == 1 {
    print(nums[0])
} else {
    print(ans)
}
