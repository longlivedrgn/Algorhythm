var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var coins = [Int]()

for _ in 0..<nums[0] {
    coins.append(Int(readLine()!)!)
}

var target = nums[1]
var count = 0
var index = (nums[0]-1)
while !(target == 0) {
    if target >= coins[index] {
        let dividedNumber = target / coins[index]
        count += dividedNumber
        target = target % coins[index]
    }
    index -= 1
}

print(count)