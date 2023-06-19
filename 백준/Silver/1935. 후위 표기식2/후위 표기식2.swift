import Foundation
// ASCII 코드를 활용하기!
// 식 밑에 들어오는 숫자들은 하나씩 알파벳에 맞게 들어온다! -> 숫자와 알파벳을 이어주자! -> index로 이어주기!

let n = Int(readLine()!)!
var statement = readLine()!
var stack: [Double] = [] // 넣다 뺐다 할 수 있게 만드는 stack
var nums: [Double] = [] // 숫자들을 담는 stack


for _ in 0..<n {
    nums.append(Double(readLine()!)!)
}

for i in statement {
    if i == "+" {
        stack.append(stack.removeLast() + stack.removeLast())
    } else if i == "-" {
        let num = stack.removeLast()
        stack.append(stack.removeLast() - num)
    } else if i == "*" {
        stack.append(stack.removeLast() * stack.removeLast())
    } else if i == "/" {
        let num = stack.removeLast()
        stack.append(stack.removeLast() / num)
    } else {
        let index = i.asciiValue! - 65 // A에 해당하는 숫자를 0으로 바꾸기! B는 1로 변경!
        stack.append(nums[Int(index)]) // 알파벳에 맞는 숫자를 숫자를 stack에 넣기!~
    }
}

print(String(format: "%.2f", stack.last!))