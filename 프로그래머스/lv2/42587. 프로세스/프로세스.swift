func solution(_ priorities:[Int], _ location:Int) -> Int {
    var prioritiesWithIndex = [(Int, Int)]()
    var count = 0

    for (index, priority) in priorities.enumerated() {
        prioritiesWithIndex.append((index, priority))
    }

    while true {
        let removed = prioritiesWithIndex.removeFirst()
        if prioritiesWithIndex.count == 0 {
            return count+1
        }
        let maxValue = prioritiesWithIndex.max(by: { $0.1 < $1.1 })!
        if removed.1 < maxValue.1 {
            prioritiesWithIndex.append(removed)
            continue
        }
        count += 1
        if removed.0 == location {
            return count
        }
    }
}