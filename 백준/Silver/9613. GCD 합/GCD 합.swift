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

// 일단, 한 개씩 싹 다 최대공약수를 구하기
// 근데, 조합을 활용해서!

var num  = Int(readLine()!)!

for _ in 0..<num {
    let nums = readLine()!.components(separatedBy: " ").map {Int($0)!}
    let count = nums[0]
    var sum = 0
    for i in 1...count-1 {
        for j in i+1...count {
            sum += GCD(first: nums[i], second: nums[j])
        }
    }
    print(sum)
}