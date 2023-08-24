var num = Int(readLine()!)!
var numbers = [Int]()
var minusCount = 0
var hasZero = false
var zeroCount = 0
var hasOne = false
var oneCount = 0
var plusCount = 0

for _ in 0..<num {
    let value = Int(readLine()!)!
    if value > 0 {
        plusCount += 1
        if value == 1 {
            hasOne = true
            oneCount += 1
        }
    } else if value == 0 {
        hasZero = true
        zeroCount += 1
    } else {
        minusCount += 1
    }
    numbers.append(value)
}
numbers.sort(by: >)

var sum = 0

if plusCount % 2 == 0 {
    if hasOne {
        for value in stride(from: 0, to: plusCount, by: 2) {
            let first = numbers[value]
            let second = numbers[value+1]
            if first == 1 || second == 1 {
                sum += first + second
            } else {
                sum += first * second
            }
        }
    } else {
        for value in stride(from: 0, to: plusCount, by: 2) {
            sum += numbers[value] * numbers[value+1]
        }
    }
} else {
    if hasOne {
        for value in stride(from: 0, to: plusCount-1, by: 2) {
            let first = numbers[value]
            let second = numbers[value+1]
            if first == 1 || second == 1 {
                sum += first + second
            } else {
                sum += first * second
            }
        }
        sum += 1
    } else {
        for value in stride(from: 0, to: plusCount-1, by: 2) {
            let first = numbers[value]
            let second = numbers[value+1]
            sum += first * second
        }
        sum += numbers[plusCount-1]
    }
}

if minusCount > 0 {
    if hasZero {
        if minusCount % 2 == 0 {
            for value in stride(from: zeroCount+plusCount, to: num-1, by: 2) {
                sum += numbers[value] * numbers[value+1]
            }
        } else {
            for value in stride(from: zeroCount+plusCount+1, to: num-1, by: 2) {
                sum += numbers[value] * numbers[value+1]
            }
        }
    } else {
        if minusCount % 2 == 0 {
            for value in stride(from: plusCount, to: num-1, by: 2) {
                sum += numbers[value] * numbers[value+1]
            }
        } else {
            for value in stride(from: plusCount+1, to: num-1, by: 2) {
                sum += numbers[value] * numbers[value+1]
            }
            sum += numbers[plusCount]
        }
    }
}

print(sum)