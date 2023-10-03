import Foundation

func solution(_ citations:[Int]) -> Int {
    var sortedCitations = citations.sorted(by: >)
    let citationsCount = citations.count
    var answer = 0
    
    // 최대 인용 횟수부터 0까지 순회해서 H-Index 값을 찾자!..
    for number in stride(from: sortedCitations[0], through: 0, by: -1) {
        var count = 0 // 현재 number 보다 더 많은 인용 횟수를 가진 논문의 갯수
        var tempIndex = 0 // number보다 인용 횟수가 적은 논문의 갯수를 체크하기 위한 index 값
        
        for (index, citation) in sortedCitations.enumerated() {
            // number보다 인용 횟수가 크다면 count를 +1 해준다.
            if citation >= number {
                count += 1
            } else {
                // 만약 인용횟수가 적다면! index 값을 넘겨주고 for문을 종료시킨다.
                tempIndex = index
                break
            }
        }
        
        // count가 number보다는 크거나 같아야하고,
        // (citationsCount - tempIndex) = number 보다 작은 인용횟수를 가진 논문의 갯수
        if count >= number && (citationsCount - tempIndex) <= number {
            answer = number
            break
        }
    }
    
    return answer
}