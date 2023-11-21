import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    // [4, 1, 2, 1]에서 선택의 기로에 들어간다. -> 첫번째 +4, -4로 갈 지 정한다.
    
    let numbersCount = numbers.count
    var answer = 0 // 몇 개의 방법이 있는 지 확인한다.
    
    func DFS(index: Int, sum: Int) {
        if index == numbersCount { // 만약 모든 숫자들을 확인했다면? 이제 sum이 target인 지 확인한다.
            if sum == target {
                answer += 1
            }
            return 
        }
        
        DFS(index: index+1, sum: sum + numbers[index]) // +4
        DFS(index: index+1, sum: sum - numbers[index]) // -4
    }
    
    DFS(index: 0, sum: 0 )
    
    return answer
}