import Foundation

let n = Int(readLine()!)!
var nums = readLine()!.components(separatedBy: " ").map {Int($0)!}
// dp[index] => nums[index]를 증가수열의 마지막으로 가지는 증가수열의 증가수열 길이
var dp = Array(repeating: 1, count: n)

// 지금 만약 nums의 4번째 index에 있는 것을 검사하고 있다면?
for i in 1..<n {
    // nums의 0~3번까지의 값들을 4번째 값과 비교한다.
    // 만약 4번째 값이 더 크다면? => 증가수열이 생길 가능성이 있다!
    for j in 0..<i {
        if nums[i] > nums[j] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}
// 최대 길이를 저장한다!
var order = dp.max()!
print(order)
//6
//10 20 10 30 20 50
// [1, 2, 1, 3, 2, 4]
var resultList = [Int]()
var index = dp.firstIndex(of: order)!

// 뒤에서부터 세는 것이 매우 중요!! -> 앞에서부터 세면 증가수열에 들어가지 않는 놈이 따라나올 수 있다!!..

while index >= 0 {
    if dp[index] == order {
        resultList.append(nums[index])
        order -= 1
    }
    index -= 1
}

var reversed = resultList.reversed()

for p in reversed {
    print(p, terminator: " ")
}