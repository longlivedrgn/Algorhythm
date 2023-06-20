while let input = readLine() {
    let statement = String(input)
    var result = [Int](repeating: 0, count: 4)

    for char in statement {
        if char.isLowercase {
            result[0] += 1
        } else if char.isUppercase {
            result[1] += 1
        } else if char.isWhitespace {
            result[3] += 1
        } else {
            result[2] += 1
        }
    }
    print(result.map { String($0) }.joined(separator: " "))
}