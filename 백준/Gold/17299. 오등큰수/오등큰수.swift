
let n = Int(readLine()!)!
var numArray = readLine()!.split(separator:" ").map{Int(String($0))!} // 오등큰수 넣는 곳!
var count = Array(repeating: 0, count: 1000000) // 최대 숫자가 1000000 이므로!
var stack = [Int]() // index를 담는 곳!

for i in 0..<n {
    count[numArray[i]-1] += 1 // 1이면 count 배열 첫번째에 갯수가 채워진다.
    // 즉, [1, 1, 2, 3, 4, 2, 1] 이면
    // count => [3, 2, 1, 1, 0, 0, ...]
}

for i in 0..<n {
    // count[numArray[i]-1] -> 그냥 numArray에 있는 그 숫자가 몇개 있는 지를 return 한다!
    while !stack.isEmpty && count[numArray[stack.last!]-1] < count[numArray[i]-1] {
        numArray[stack.removeLast()] = numArray[i]
    }
    stack.append(i)
}

// 오등큰수를 못 찾은 놈들은 -1로 넣어주기!
for i in stack {
    numArray[i] = -1
}

print(numArray.map{String($0)}.joined(separator: " "))