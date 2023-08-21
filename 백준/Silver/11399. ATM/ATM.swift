var num = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}

nums.sort(by: <)

var sum = 0
var result = 0

for m in 0..<num {
    sum += nums[m]
    result += sum
}
print(result)