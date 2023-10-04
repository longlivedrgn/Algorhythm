import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    // 합이 10인 두 숫자의 곱이 가장 작을 경우는?
    // 1 * 9 이다.
    // 중간 값으로 갈 수록( ex. 5*5)일 수록 곱은 더 커진다.
    // 따라서 일단 둘 중 높은 값을 하나에 몰고, 작은 값을 한 곳에 모으자!..
    var maximum = [Int]() //
    var minimum = [Int]()

    for size in sizes {
        maximum.append(size.max()!)
        minimum.append(size.min()!)
    }

    return maximum.max()! * minimum.max()! // 모아진 곳에서는 각자 최대 값으로 때린다!..
}