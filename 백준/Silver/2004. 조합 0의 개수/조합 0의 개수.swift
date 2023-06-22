import Foundation

var nums = readLine()!.components(separatedBy: " ").map {Int($0)!}
// 10의 갯수를 찾자! -> 2 * 5의 갯수를 찾아야된다.
// 근데 거의 5의 갯수가 2의 갯수보다 작으므로 5의 갯수를 세자!
// 그러나, 이 상황에서는 2의 갯수가 더 적을수도 있다!!..
// 따라서 두 개를 비교해야된다!

func countFive(in number: Int) -> Int {
    var numbber = number
    var count = 0
    while numbber != 0 {
        numbber = numbber / 2
        count += numbber
    }
    return count
}

func countSecond(in number: Int) -> Int {
    var numbber = number
    var count = 0
    while numbber != 0 {
        numbber = numbber / 5
        count += numbber
    }
    return count
}

var five = countFive(in: nums[0]) - countFive(in: nums[1]) - countFive(in: nums[0] - nums[1])
var second = countSecond(in: nums[0]) - countSecond(in: nums[1]) - countSecond(in: nums[0] - nums[1])

if five > second {
    print(second)
} else {
    print(five)
}