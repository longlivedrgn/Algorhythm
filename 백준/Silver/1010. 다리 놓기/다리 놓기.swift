
var num = Int(readLine()!)!
// 31개의 0 배열이 31개 있다.
// 첫번째 배열에는 n = 0인 경우!...
// 두번째 배열의 경우에는 n = 1인 경우..
var dp =  [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)

// 0...0은 그냥 넘어간다!..
for n in 0...30 {
    for r in 0...n {
        if n==r || r == 0 {
            dp[n][r] = 1
        } else {
            dp[n][r] = dp[n-1][r-1] + dp[n-1][r]
        }
    }
}

for _ in 0..<num {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    print(dp[nums[1]][nums[0]])
}