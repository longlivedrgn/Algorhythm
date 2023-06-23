
import Foundation

// 최대공약수를 던지는 함수!
func GCD(first: Int, second:Int) -> Int {

    let nums = [first, second]

    var max = nums.max()!
    var min = nums.min()!
    var r = max%min // 나머지 구하기

    while r > 0 { // 0이 될 때까지 계속 하기!
        max = min
        min = r
        r = max%min
    }
    return min
}

// 여러 수의 최대공약수 구하기!
func GCD(arr: [Int]) -> Int {
    var gcd = arr[0]
    for item in arr {
        gcd = GCD(first: gcd, second: item)
    }

    return gcd
}

// 수빈이의 위치와 동생들의 위치의 차이를 모아서 최대 공약수를 구하자!
let nums = readLine()!.components(separatedBy: " ").map {Int($0)!}
let youngs = readLine()!.components(separatedBy: " ").map {Int($0)!}
var diff = [Int]()

for i in 0..<nums[0] {
    diff.append(abs(nums[1] - youngs[i]))
}

print(GCD(arr: diff))
