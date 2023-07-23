while true {
    let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    let firstNumber = nums[0]
    if firstNumber == 0 {
        break
    }
    let numbers = Array(nums[1...])

    var selected = [Int]()
    func DFS(depth: Int) {
        if selected.count == 6 {
            print(selected.map{String($0)}.joined(separator: " "))
            return
        }

        for num in depth..<firstNumber {
            selected.append(numbers[num])
            DFS(depth: num+1)
            selected.removeLast()
        }
    }
    DFS(depth: 0)
    print("")
}