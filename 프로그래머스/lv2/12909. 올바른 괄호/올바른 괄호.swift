func solution(_ str: String) -> Bool {
    var stack: [Character] = []
    
    for char in str {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            guard !stack.isEmpty else { return false }
            stack.popLast()
        }
    }
    return stack.isEmpty
}