import Foundation

var nums = readLine()!.split(separator: " ").map {Int($0)!}

func isPrime(num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }

    for number in 2...Int(sqrt(Double(num))) {
        if num % number == 0 {
            return false
        }
    }
    return true
}

for number in nums[0]...nums[1] {
    if isPrime(num: number) {
        print(number)
    }
}