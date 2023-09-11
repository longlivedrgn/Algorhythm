
let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var waitingList = readLine()!.split(separator: " ").map {Int(String($0))!}

let numberOfTrucks = nums[0]
let bridgeLength = nums[1]
let maxWeight = nums[2]
var currentTrucks = [(waitingList.removeFirst(),1)]
var count = 1

while !currentTrucks.isEmpty {
    var currentTrucksWeight = 0

    currentTrucks = currentTrucks.map {
        let updatedCount = $1 + 1
        return ($0, updatedCount)
    }

    currentTrucks = currentTrucks.filter({ (weight, lengthCount) in
        return lengthCount <= bridgeLength // 2
    })


    for truck in currentTrucks {
        currentTrucksWeight += truck.0
    }
    if !waitingList.isEmpty {
        if maxWeight >= currentTrucksWeight + waitingList[0] {
            currentTrucks.append((waitingList.removeFirst(),1))
        }
    }

    count += 1
}

print(count)