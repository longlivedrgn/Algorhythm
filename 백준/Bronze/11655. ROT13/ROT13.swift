// 소문자는 97(a) ~ 122(z)
// 대문자는 65(A) ~ 90(Z)

var strings = readLine()!
var result = [String]()

for str in strings {
    var striing = ""
    if str.isUppercase {
        var value = Int(str.asciiValue!) + 13
        if value > 90 {
            value = value - 26
        }
        striing += String(UnicodeScalar(value)!)
    } else if str.isLowercase {
        var value = Int(str.asciiValue!) + 13
        if value > 122 {
            value = value - 26
        }
        striing += String(UnicodeScalar(value)!)
    } else if str.isNumber {
        striing += String(str)
    } else {
        striing += String(str)
    }
    result.append(striing)
}

print(result.joined(separator:""))