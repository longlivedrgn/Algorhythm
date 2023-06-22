var isGoldBach = false
var isPrimeNum = Array(repeating: true, count: 1000001)
isPrimeNum[1] = false
for i in 2...1000000 {
    if isPrimeNum[i] == false { continue }

    for j in stride(from: i+i, through: 1000000, by: i) {
        isPrimeNum[j] = false
    }
}

while true {
    let n = Int(readLine()!)!

    if n == 0 {
        break
    }

    for m in 3..<n {
        if isPrimeNum[m] {
            let diff = n - m
            if isPrimeNum[diff] {
                print("\(n) = \(m) + \(diff)")
                isGoldBach = true
                break
            }
        }
    }
    if !isGoldBach {
        print("Goldbach's conjecture is wrong.")
    }
    isGoldBach = false
}