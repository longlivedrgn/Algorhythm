var words = readLine()!
var stack = [String]()
let counts = words.count

for word in 0..<counts {
    if word == 0 {
        stack.append(words)
    } else {
        words.removeFirst()
        stack.append(words)
    }
}
stack.sort()
for stak in stack {
    print(stak)
}