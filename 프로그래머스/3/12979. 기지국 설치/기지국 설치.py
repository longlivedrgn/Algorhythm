import math
def solution(n, stations, w):
    answer = 0
    start = 1
    for station in stations:
        end = station-w-1
        length = end - start+1
        if end >= start:
            if length <= 2 * w +1:
                answer += 1
            else:
                answer += math.ceil(length / (2*w+1))
        start = station + w +1
    if start <= n:
        length = n - start+1
        if length <= 2 * w +1:
            answer += 1
        else:
            answer += math.ceil(length / (2*w+1))
    return answer