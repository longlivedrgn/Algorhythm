def solution(distance, rocks, n):
    answer = 0
    rocks.append(0)
    rocks.append(distance)
    rocks.sort()
    start = 0
    end = distance
    
    while start <= end:
        value = 0
        mid = (start+end) // 2
        elimatedCount = 0
        for i in range(1, len(rocks)):
            if rocks[i] - value < mid:
                elimatedCount += 1
            else:
                value = rocks[i]

        if elimatedCount > n:
            end = mid -1
        else:
            answer = mid
            start = mid + 1
    return answer