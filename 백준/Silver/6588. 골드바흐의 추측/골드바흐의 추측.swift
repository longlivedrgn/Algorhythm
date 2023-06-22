private func primeNumArr() -> [Bool] {
    var isprimenum = Array(repeating: true, count: 1000001) // 에라토스테네스 체 생성하기
    isprimenum[0] = false
    isprimenum[1] = false

    for i in 2..<1000001 {
        if isprimenum[i] == false { continue } // 자기 자신은 false로 설정하기

        for j in stride(from: i+i, through: 1000000, by: i) { // 그리고 계속해서 i를 더해주면서 false로 변경하기
            isprimenum[j] = false
        }
    }
    return isprimenum
}
private func solution() {
    let isprime = primeNumArr() // 일단 0~ 1000001 까지의 소수를 싹 다 true로 해놓은 배열 만들기

    for _ in 0..<100000 {
        var flag = false
        let n = Int(readLine()!)!

        if n == 0 { // 0을 만나면 프로그램 종료!
            break
        } else {
            for i in 3...n {
                if isprime[i] {
                    let diff = n - i
                    if isprime[diff] {
                        flag = true
                        print("\(n) = \(i) + \(diff)")
                        break
                    }
                }
            }
        }

        if !flag {
            print("Goldbach's conjecture is wrong.")
        }
    }
}

solution()