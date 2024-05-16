import heapq
def solution(scoville, K):
    answer = 0
    q = []
    heapq.heapify(scoville)
    is_all_ok = True
    for sco in scoville:
        if sco < K:
            is_all_ok = False
            break
    if is_all_ok == True:
        return answer
    
    while len(scoville) > 1:
        first = heapq.heappop(scoville)
        second = heapq.heappop(scoville)
        
        mix = first + (second *2)
        heapq.heappush(scoville, mix)
        answer += 1
        is_all_ok = True
        for sco in scoville:
            if sco < K:
                is_all_ok = False
                break
        if is_all_ok == True:
            return answer
    return -1