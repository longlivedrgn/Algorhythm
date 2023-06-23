import Foundation

// 일단 전체를 십진수로 변환하기!
// 만약 2진수가 11001100라면?
// 011/001/100 로 나누어서 계산을 한다~!🔥
var nums = Array(readLine()!).map {Int(String($0))!}
var count = nums.count
var mok = count/3 // 2
var left = count%3 // 2

if left != 0 {
    for _ in 0..<(3-left) {
        nums.insert(0, at: 0)
    }
}

var string = ""

var num = 2
var sumOfThree = 0
for k in nums {
    if num == -1 {
        num = 2
        sumOfThree = 0
    }
    sumOfThree += Int(Double(k)*pow(2, Double(num)))
    if num == 0 {
        string += String(sumOfThree)
    }
    num -= 1
}
print(string)