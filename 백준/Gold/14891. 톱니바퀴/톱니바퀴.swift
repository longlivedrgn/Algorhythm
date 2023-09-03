// 무식한 방법..ㅜㅜ
var first = Array(readLine()!).map {Int(String($0))!}
var second = Array(readLine()!).map {Int(String($0))!}
var third = Array(readLine()!).map {Int(String($0))!}
var forth = Array(readLine()!).map {Int(String($0))!}

var rotateCount = Int(readLine()!)!

func rotateRight(wheel: [Int]) -> [Int] {
    var temp = wheel
    let last = temp.remove(at: first.count-1)
    temp.insert(last, at: 0)

    return temp
}

func rotateLeft(wheel: [Int]) -> [Int] {
    var temp = wheel
    let first = temp.removeFirst()
    temp.append(first)

    return temp
}
// 1 -> right
// -1 -> left

for _ in 0..<rotateCount {


    let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
    let wheelNumber = nums[0]
    let direction = nums[1]
//    print(nums)
//    print("first - \(first)")
//    print("second - \(second)")
//    print("third - \(third)")
//    print("forth - \(forth)")
//    print("---------------")

    if wheelNumber == 1 {
        if first[2] != second[6] {
            if direction == 1 {
                // first는 오른쪽
                // second는 왼쪽
                if third[6] != second[2] {
                    second = rotateLeft(wheel: second)
                    if forth[6] != third[2] {
                        third = rotateRight(wheel: third)
                        forth = rotateLeft(wheel: forth)
                    } else {
                        third = rotateRight(wheel: third)
                    }
                } else {
                    second = rotateLeft(wheel: second)
                }
            } else {
                // first는 오른쪽
                // second는 왼쪽
                if third[6] != second[2] {
                    second = rotateRight(wheel: second)
                    if forth[6] != third[2] {
                        third = rotateLeft(wheel: third)
                        forth = rotateRight(wheel: forth)
                    } else {
                        third = rotateLeft(wheel: third)
                    }
                } else {
                    second = rotateRight(wheel: second)
                }
            }
        }

        if direction == 1 {
            first = rotateRight(wheel: first)
        } else {
            first = rotateLeft(wheel: first)
        }
    } else if wheelNumber == 2 {
        if second[6] != first[2] {
            if direction == 1 {
                first = rotateLeft(wheel: first)
            } else {
                first = rotateRight(wheel: first)
            }
        }

        if second[2] != third[6] {
            if direction == 1 {
                // thrid는 left로 가야된다!.
                if third[2] != forth[6] {
                    third = rotateLeft(wheel: third)
                    forth = rotateRight(wheel: forth)
                } else {
                    third = rotateLeft(wheel: third)
                }
            } else {
                // thrid는 right으로 가야된다.
                if third[2] != forth[6] {
                    third = rotateRight(wheel: third)
                    forth = rotateLeft(wheel: forth)
                } else {
                    third = rotateRight(wheel: third)
                }
            }
        }
        // 마지막에 바꿔주기!.. 2는!
        if direction == 1 {
            second = rotateRight(wheel: second)
        } else {
            second = rotateLeft(wheel: second)
        }
    } else if wheelNumber == 3 {
        if third[2] != forth[6] {
            if direction == 1 {
                forth = rotateLeft(wheel: forth)
            } else {
                forth = rotateRight(wheel: forth)
            }
        }

        if third[6] != second[2] {
            if direction == 1 {
                // second는 left로 가야된다!.
                if second[6] != first[2] {
                    second = rotateLeft(wheel: second)
                    first = rotateRight(wheel: first)
                } else {
                    second = rotateLeft(wheel: second)
                }
            } else {
                // thrid는 right으로 가야된다.
                if second[6] != first[2] {
                    second = rotateRight(wheel: second)
                    first = rotateLeft(wheel: first)
                } else {
                    second = rotateRight(wheel: second)
                }
            }
        }
        // 마지막에 바꿔주기!.. 3는!
        if direction == 1 {
            third = rotateRight(wheel: third)
        } else {
            third = rotateLeft(wheel: third)
        }
    } else {
        if forth[6] != third[2] {
            if direction == 1 {
                // third는 왼쪽으로
                if second[2] != third[6] {
                    third = rotateLeft(wheel: third)
                    // second는 오른쪽ㅇ로
                    if first[2] != second[6] {
                        second = rotateRight(wheel: second)
                        first = rotateLeft(wheel: first)
                    } else {
                        second = rotateRight(wheel: second)
                    }
                } else {
                    third = rotateLeft(wheel: third)

                }
            } else {
                // third는 오른쪽으로
                if second[2] != third[6] {
                    third = rotateRight(wheel: third)
                    // second는 왼쪽으로
                    if first[2] != second[6] {
                        second = rotateLeft(wheel: second)
                        first = rotateRight(wheel: first)
                    } else {
                        second = rotateLeft(wheel: second)
                    }
                } else {
                    third = rotateRight(wheel: third)
                }
            }
        }

        if direction == 1 {
            forth = rotateRight(wheel: forth)
        } else {
            forth = rotateLeft(wheel: forth)
        }
    }
}


// 1번 톱니바퀴의 12시방향이 N극이면 0점, S극이면 1점
//2번 톱니바퀴의 12시방향이 N극이면 0점, S극이면 2점
//3번 톱니바퀴의 12시방향이 N극이면 0점, S극이면 4점
//4번 톱니바퀴의 12시방향이 N극이면 0점, S극이면 8점
// N극 -> 0 S극 -> 1

var count = 0

if first[0] == 1 {
    count += 1
}

if second[0] == 1 {
    count += 2
}

if third[0] == 1 {
    count += 4
}

if forth[0] == 1 {
    count += 8
}

print(count)