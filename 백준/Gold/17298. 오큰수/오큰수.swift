// 일단, for문을 통해서 모든 index를 확인한다
// 그 과정에서 자기보다 큰 오른쪽을 찾지못하면 stack에 계속 넣는다
// 그리고 찾으면 removeLast()하면서 answer로 바꿔준다!
let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var answer = [Int](repeating: -1, count: n) // 빈 배열 만들기!
var stack: [Int] = [] // stack 하나 만들기!

for i in 0..<n { // n번 반복한다.
    while !stack.isEmpty && array[stack.last!] < array[i] { // stack이 비워있지 않거나,
        answer[stack.removeLast()] = array[i]
    }
    stack.append(i)
}

print(answer.map { String($0) }.joined(separator: " "))