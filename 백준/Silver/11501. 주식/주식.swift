var num = Int(readLine()!)!

for _ in 0..<num {
    var number = Int(readLine()!)!
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    var totalSum = 0
    var maxValue = nums.last!
    for value in nums.reversed() {
        if value >= maxValue {
            maxValue = value
        } else {
            totalSum += maxValue-value
        }
    }
    print(totalSum)
}