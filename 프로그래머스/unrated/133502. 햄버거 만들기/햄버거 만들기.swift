import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var list: [Int] = []
    var num = 0
    for i in ingredient {
        list.append(i)
        guard list.count > 3 else { continue }
        if list[list.count-4] == 1 && list[list.count-3] == 2 && list[list.count-2] == 3 && list[list.count-1] == 1 {
            list.remove(at: list.count-4)
            list.remove(at: list.count-3)
            list.remove(at: list.count-2)
            list.remove(at: list.count-1)
            num += 1
        }
    }
    return num
}