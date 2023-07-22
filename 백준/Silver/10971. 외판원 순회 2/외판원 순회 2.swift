// 일단 넣자!..
var number = Int(readLine()!)!
var pan = [[Int]]()
for _ in 0..<number {
    var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    pan.append(nums)
}

// 일단 여행의 총 합 -> 계속해서 업데이트를 할 것이다.
var visited = Array(repeating: false, count: number)
var priceSum = Int.max

// 인자로 start, next, value(현재까지의 합)-> 최종적으로 priceSum과 비교해서 값 업데이트!, count: 몇번 째 도시인지
func DFS(start: Int, next: Int, value: Int, count: Int) {
    // 만약 4개의 도시를 순회했다면! -> 이제는 업데이트해야지~ㅎㅎ
    if count == number {
        // 근데, 또 마지막 도시에서 처음 도시로 이동해야되는데!! 만약 못 이동한다면?.. 그럼 아예 해당 루트는 불가능한 루트다.
        if pan[next][start] != 0 {
            priceSum = min(value+pan[next][start], priceSum)
        }
    }

    for j in 0..<number {
        // 만약 0이 아니고(갈 수 있고!), value< priceSum(백 트랙킹.. 애초에 싹을 자르기)
        // 만약 방문을 하지 않았따면!..
        if pan[next][j] != 0 && value < priceSum && visited[j] == false {
            visited[j] = true
            DFS(start: start, next: j, value: value + pan[next][j], count: count+1)
            visited[j] = false
        }
    }
}

// 처음 시작점을 계속 변경해가면서 해보기..
for i in 0..<number {
    // 근데, 처음 시작을 방문했다고 해줘야함!
    visited[i] = true
    DFS(start: i, next: i, value: 0, count: 1)
}
print(priceSum)