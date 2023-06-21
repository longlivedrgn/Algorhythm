import Foundation

var nums = readLine()!.split(separator: " ").map {Int($0)!}
let m = nums[0]
let n = nums[1]

var isPrimeNumber = [Bool](repeating: true, count: n+1)
isPrimeNumber[1] = false // 1은 소수가 될 수 없으니까!

for i in 2..<Int(sqrt(Double(n))+1) {
    if isPrimeNumber[i] {
        var j = i
        while i * j <= n {
            isPrimeNumber[i * j] = false
            j += 1
        }
    }
}

for i in m...n {
    if isPrimeNumber[i] {
        print(i)
    }
}