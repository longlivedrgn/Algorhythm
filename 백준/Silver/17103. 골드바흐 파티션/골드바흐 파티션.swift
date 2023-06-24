import Foundation

var isPrimeNumber = [Bool](repeating: true, count: 1000001)
isPrimeNumber[1] = false // 1은 소수가 될 수 없으니까!

for i in 2...Int(sqrt(Double(1000000))) {
    if isPrimeNumber[i] {
        var j = i
        while i * j <= 1000000 {
            isPrimeNumber[i * j] = false
            j += 1
        }
    }
}

var num = Int(readLine()!)!
for _ in 0..<num {
    var number = Int(readLine()!)!
    var count = 0
    for k in 2...number/2 {
        if isPrimeNumber[k] && isPrimeNumber[number-k] {
            count += 1
        }
    }
    print(count)
}