import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let arr = number.map { String($0) } // ["1", "9", "2", "4"]
    var stack = [String]()
    var deleteCount = k
    
    for number in arr {
        while true {
            if stack.count == 0 {
                break
            } else {
                if stack[stack.count-1] < number && deleteCount > 0 {
                    deleteCount -= 1
                    stack.removeLast()
                } else {
                    break
                }
            }
        }
       
        stack.append(number)
    }
    
    // 만약 차마 못지운 것이 있다면 뒤에 있는 놈들부터 쭉 없앤다. 
    while deleteCount > 0 {
        stack.removeLast()
        deleteCount -= 1
    }

    return stack.joined()
}