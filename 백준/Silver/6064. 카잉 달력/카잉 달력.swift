var input = Int(readLine()!)!

Outer: for _ in 0..<input {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    var M = nums[0]
    var N = nums[1]
    var x = nums[2]
    var y = nums[3]
    var value = x
    while value <= M*N {
        if (value-y)%N == 0 {
            print(value)
            continue Outer
        }
        value += M
    }
    print(-1)
}