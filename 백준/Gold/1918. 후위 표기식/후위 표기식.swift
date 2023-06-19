//1. 피연산자는 그대로 출력
//2. ( 는 무조건 stack에 push
//3. ) 는 (가 나올때까지 stack에서 pop해서 출력
//4. 넣을 연산자 ch와 stack.top 의 우선순위를 비교해서 ch가 더 크면 push, 더 작다면 만족할때까지 pop
//
//순서 → +,- < *,/

var statement = readLine()!
var stack: [Character] = [] // 넣다 뺐다 할 수 있게 만드는 stack
var result: [Character] = []


for char in statement {
    if char.isLetter { // 숫자는 그냥 바로 result에 append하기
        result.append(char)
    } else if char == "(" { // "("도 그냥 result에 append하기!
        stack.append(char)
    } else if char == ")" { // ")"이면 "("를 만나거나, stack이 비기전까지 계속 pop하면서 result에 넣기
        while !stack.isEmpty && stack.last != "(" {
            result.append(stack.removeLast())
        }
        stack.removeLast() // 그리고 "("도 제거하기!
    } else if char == "*" || char == "/" { // stack이 empty가 될 때까지 그리고, 만약 *, /라면 pop하고 result에 넣기
        while !stack.isEmpty && (stack.last == "*" || stack.last == "/") {
            result.append(stack.removeLast())
        }
        stack.append(char) // 그리고 최종적으로 나를 다시 넣기!
    } else { // +, -.. 는 제일 등급이 낮기에 empty가 될때까지 "("를 만나기 전까지 계속 pop하고 result에 넣기
        while !stack.isEmpty && stack.last != "(" {
            result.append(stack.removeLast())
        }
        stack.append(char) // 그리고 나 넣기!
    }
}

while !stack.isEmpty {
    result.append(stack.removeLast())
}

print(result.map { String($0) }.joined(separator: ""))