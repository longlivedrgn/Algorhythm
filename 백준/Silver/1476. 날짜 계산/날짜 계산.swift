var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var x = nums[0]
var y = nums[1]
var z = nums[2]
var year = 1

while true {
    if (year-x)%15 == 0 && (year-y)%28 == 0 && (year-z)%19 == 0 {
        print(year)
        break
    }
    year += 1
}