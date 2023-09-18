import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var baseNumber = 0
    var count = 0
    var resultArray = [Int]()
    
    for (index, number) in progresses.enumerated() {
        var remainDay = 0
        if (100-number)%speeds[index] != 0 {
            remainDay = ((100-number)/speeds[index]) + 1
        } else {
            remainDay = ((100-number)/speeds[index])            
        }
        if index == 0 {
            baseNumber = remainDay
            count += 1
        } else {
            if baseNumber >= remainDay {
                count += 1
            } else {
                baseNumber = remainDay 
                resultArray.append(count)
                count = 1
            }
        }
        
    }
    resultArray.append(count)
    return resultArray
}