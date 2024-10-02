def solution(stones, k):
    answer = 0
    start = 1
    end = max(stones)
    while start <= end:
        cnt = 0 # 연속해서 0인 디딤돌 갯수
        mid = (start + end) // 2

        for stone in stones:
            if (stone - mid) <= 0:
                cnt += 1
                if cnt == k:
                    end = mid - 1
                    break
            else:
                cnt = 0 # 만약 건널 수 있는 게 생기면 cnt를 다시 초기화
        else: #만약 for문을 다 돌았다면?..
            start = mid + 1 # 최소를 구해야하므로 start가 답이된다!..
            answer = mid + 1
    return start
