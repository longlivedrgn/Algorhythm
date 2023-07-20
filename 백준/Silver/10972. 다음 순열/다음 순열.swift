var number = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}

// 선택된 숫자를 넣는 배열
// 1 3 4 2 -> 1 4 2 3으로 바꾸는 과정을 어떻게 구현할까?
// 먼저 앞에서부터 array[index] < array[index+1] 인 곳을 찾는다.(가장 뒤에 있는!)
// index = 2일 것이다.
// 그리고 index..<끝 까지 array[index] < array[j]인 곳을 찾아서
// index와 j를 바꿔준다!
// 그리고 j 밑에서부터 sorting해주기!

if Array(1...number).reversed() == nums {
    print(-1)
} else {
    var changeStartIndex = 0
    for inx in 0..<number {
        if inx < (number-1) && nums[inx] < nums[inx+1] {
            changeStartIndex = inx
        }
    }

    var changeLastIndex = 0
    for j in changeStartIndex..<number {
        if nums[changeStartIndex] < nums[j]{
            changeLastIndex = j
        }
    }

    nums.swapAt(changeLastIndex, changeStartIndex)
    nums = nums[0...changeStartIndex] + nums[(changeStartIndex+1)...].sorted()
    print(nums.map{String($0)}.joined(separator: " "))
}