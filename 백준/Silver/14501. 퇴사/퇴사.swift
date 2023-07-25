// 총 일수
var day = Int(readLine()!)!
// (필요 일수, 보상 금액)
var inputs = [[Int]]()
// 일단 다 채워넣기
for _ in 0..<day {
    inputs.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
// 매번 업데이트할 최대 이익
var max = 0
func DFS(startDay: Int, totalMoney: Int) {
    // 넘어온 startDay가 총 일수보다 크거나 같으면 index 에러가 생긴다! 따라서 return
    if startDay > day {
        return
    }
    // 만약 totalMoney가 더 크면 max로 업데이트!
    if max < totalMoney {
        max = totalMoney
    }

    for i in startDay..<day {
        DFS(startDay: i+inputs[i][0], totalMoney: totalMoney + inputs[i][1])
    }

}
DFS(startDay: 0, totalMoney: 0)
print(max)