var count = Int(readLine()!)!

// 먼저 최대 공약수를 구하기

var nums = readLine()!.split(separator: " ").map {Int($0)!}
count = 0
for num in nums {
    var countt = 0
    for number in 1..<num {
        if num % number == 0 {
            countt += 1
        }
    }
    if countt == 1 {
        count += 1
    }
}
print(count)