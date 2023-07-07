var input = Int(readLine()!)!
var dp = [Int]()

var first = Int(readLine()!)!
if input > 1 {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    dp.append(first + nums[0])
    dp.append(first + nums[1])
    for k in 2..<input {
        var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
        nums[0] = dp[0] + nums[0]
        nums[k] = dp[k-1] + nums[k]
        for m in 1..<k {
            nums[m] = max(dp[m-1]+nums[m],dp[m]+nums[m])
        }
        dp = nums
    }
    print(dp.max()!)
} else {
    print(first)
}