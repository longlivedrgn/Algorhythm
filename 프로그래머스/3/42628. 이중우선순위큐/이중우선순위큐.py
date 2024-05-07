import heapq
def solution(operations):
    answer = []
    length = 0 # 큐에 요소가 몇 개가 들어있는가?
    max_heap = []
    min_heap = []
    
    heapq.heapify(max_heap)
    heapq.heapify(min_heap)

    for i in operations:
        if length == 0: # 이걸 해줘야지 오류가 안생긴다... 반례!
            # ["I 1", "I 2", "D 1", "D -1", "I 3", "I 4", "D 1"]
            # ["3", "3"] -> 정답
            # 이 코드가 없으면 ["3", "2"]가 나오게 된다.
            max_heap = []
            min_heap = []
        splitted = i.split(" ")
        if splitted[0] == "I":
            length += 1
            heapq.heappush(min_heap, int(splitted[1]))
            heapq.heappush(max_heap, -int(splitted[1]))
        else:
            if length != 0:
                if splitted[1] == "1":
                    heapq.heappop(max_heap)
                    length -= 1
                else:
                    heapq.heappop(min_heap)
                    length -= 1
    if length == 0:
        return [0, 0]
    else:
        return [-heapq.heappop(max_heap), heapq.heappop(min_heap)]

                
            
    return answer