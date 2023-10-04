import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    var supoAnswersCount = [0,0,0]
    var answer = [Int]()
    let supo1 = [1, 2, 3, 4, 5]
    let supo2 = [1, 3, 4, 5]
    let supo3 = [3,3,1,1,2,2,4,4,5,5]

    // index마다 답!..
    // 수포자 1: index + 1 
    // 수포자 2: 짝수는 무조건 2로, 홀수는 -> 
    // 수포자 3: 
    
    func checkSupoOne(index: Int, checkNumber: Int) {
        let tempIndex = index % 5
        if checkNumber == supo1[tempIndex] {
            supoAnswersCount[0] += 1
        }
    }
    
    func checkSupoTwo(index: Int, checkNumber: Int) {
        if index % 2 == 0 {
            if checkNumber == 2 {
                supoAnswersCount[1] += 1
            }
        } else {
            let tempIndex = index / 2
            let changedIndex = tempIndex % 4
            
            if checkNumber == supo2[changedIndex] {
            supoAnswersCount[1] += 1
            }
        }
    }
    
    func checkSupoThree(index: Int, checkNumber: Int) {
        let tempIndex = index % 10
        if checkNumber == supo3[tempIndex] {
            supoAnswersCount[2] += 1
        }
    }
    
    for (idx, answer) in answers.enumerated() {
        checkSupoOne(index: idx, checkNumber: answer)
        checkSupoTwo(index: idx, checkNumber: answer)
        checkSupoThree(index: idx, checkNumber: answer)
    }
    
    let maxCount = supoAnswersCount.max()!
    for (idx, count) in supoAnswersCount.enumerated() {
        if count == maxCount {
            answer.append(idx+1)
        }
    }
    
    return answer
}