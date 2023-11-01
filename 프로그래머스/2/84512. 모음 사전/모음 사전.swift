import Foundation

func solution(_ word:String) -> Int {
    // 모음 array 만들기
    let alphabets = ["A", "E", "I", "O", "U"]
    // DFS로 풀기!..
    // depth가 5일때까지 쭉 들어가기!..
    var answer = [String]()
    var count = 0
    var isFound = false
    
    func DFS(depth: Int) {
        
        guard !isFound else { return }
        count += 1
        if answer.joined() == word {
            isFound = true
            return
        }

        if depth == 5 {
            return
        }
        
        for index in 0..<5 {
            answer.append(alphabets[index])
            DFS(depth: depth+1)
            answer.removeLast()
        }
    }
    
    DFS(depth: 0)
    
    
    return count-1
}