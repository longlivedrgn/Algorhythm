var num = Int(readLine()!)!
var numbers = [Int]()

for _ in 0..<num {
    var input = Int(readLine()!)!
    numbers.append(input)
}

numbers.reverse()

var max = numbers[0]
var count = 0

for index in 1..<num {
    if (max-1) < numbers[index] {
        count += numbers[index] - (max-1)
        max = max-1
    } else {
        max = numbers[index]
    }
}
print(count)