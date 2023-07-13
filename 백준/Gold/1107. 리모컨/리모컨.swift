
var N = Int(readLine()!)!
var m = Int(readLine()!)!
var broken = Set<Int>()
if m != 0 {
    broken = Set<Int>(readLine()!.split(separator: " ").map {Int($0)!})
}
var minimum = abs(100-N)

Outer: for i in 0..<1000001 {
    let strI = String(i)
    let lst = Array(strI).map{Int(String($0))!}
    for (indx,k) in lst.enumerated() {
        // 만약 해당 값이 부서진 번호라면? -> 바로 break해서 다음 걸로 넘어가기
        if broken.contains(k) {
            continue Outer
        } else if indx == lst.count-1{
            // 만약 끝까지 확인했는데 지금 있는 번호로도 만들 수 있는 숫자라면?
            // minimum을 갱신하기!
            minimum = min(minimum, lst.count + abs(N-i))
        }
    }
}
print(minimum)