var nums = [Int]()
var sum = 0
for _ in 0..<9 {
    var num = Int(readLine()!)!
    sum += num
    nums.append(num)
}
sum -= 100
outside: for i in 0..<9 {
    for t in i+1..<9 {
        if nums[i] + nums[t] == sum {
            nums.remove(at: i)
            // 이거 너무 중요!! -> 이미 remove가 된 배열에서 지우는 거니까!!!..
            nums.remove(at: t-1)
            break outside
        }
    }
}
nums.sort()
for k in nums {
    print(k)
}