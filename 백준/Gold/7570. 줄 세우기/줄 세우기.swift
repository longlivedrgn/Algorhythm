var num = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}

var index = Array(repeating: -1, count: num+1)

for (idx, number) in nums.enumerated() {
    index[number] = idx
}

var upperCount = 1
var maxValue = [Int]()
for m in 1..<num {
    if index[m] < index[m+1] {
        upperCount += 1
    } else {
        maxValue.append(upperCount)
        upperCount = 1
    }
}
maxValue.append(upperCount)

if num == 1 {
    print(0)
} else {
    print(num-(maxValue.max()!))
}