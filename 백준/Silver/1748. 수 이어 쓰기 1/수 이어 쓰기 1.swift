import Foundation

var input = Int(readLine()!)!
var len = String(input).count
var count = 0
for m in 0..<len-1 {
    count += (9*(Int(pow(10.0, Double(m)))))*(m+1)
}
// 만약 1152라면? (1152 - 1000)*(1152의 길이) -> 4자리를 가지고 있는 숫자들의 수 * 4자리
count = count + (input-(Int(pow(10.0, Double(len-1)))) + 1)*len
print(count)