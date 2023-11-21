import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var isVisited = Array(repeating: false, count: n) // 컴퓨터들이 이어졌는 지 확인하는 list 생성 
    var count = 0 // 새로운 network가 생성되어야하면 +1을 한다.
    
    func DFS(index: Int) { // 만약 index가 0이라면?
        let computerList = computers[index] // [1, 1, 0]을 가져온다.
        for (idx, cpt) in computerList.enumerated() {
            if cpt == 1 { // 그리고 1인 것만 확인해보면 된다!..
                if idx == index { // 근데 만약 1이면 당연히 1이므로 이건 무시한다.
                    continue
                } else {
                    if isVisited[idx] == false { // 연결된 computer가 아직 방문이 안되었다면?
                        isVisited[idx] = true // true로 방문을 했다고 빵 찍는다!
                        DFS(index: idx) // 그리고 다시 DFS 돌리기!...
                    }
                }
            }
            
        }
    }
    
    for (index, computer) in computers.enumerated() { // 앞에서부터 모든 computer line들을 순회해본다.
        if isVisited[index] == false { // 만약 방문이 안된 computer가 있다면
            isVisited[index] = true
            count += 1 // network를 새롭게 하나 추가해야된다.
            DFS(index: index) // 그리고 해당 computer와 연결된 것이 뭐가 있는 지 확인해보기 -> 그리고 이어진 comptuer를 true로 변경하기
        }
    }
    
    
    
    
    
    return count
}