def solution(sequence, k):
    start, end = 0, 0 # 시작 인덱스, 마지막 인덱스
    prefix_sum = sequence[0] # 부분 수열의 합
    min_len = 1000001 # 최소 길이
    
    while start <= end < len(sequence):
        # 부분 수열의 합이 k인 경우
        if prefix_sum == k:
            # min_len보다 길이가 짧은 수열이면
            if end-start+1 < min_len:
                min_len = end-start+1 # 최소 길이 갱신
                answer = [start, end] # answer 갱신
            
            # 다음 작업을 위해 부분 수열의 합에서 start 값을 빼주고, 시작 인덱스 +1
            # 여기서 start 값을 하나 올리는 이유는 end를 올리면 index에서 빠져나올 수도 있다..
            prefix_sum -= sequence[start]
            start +=1
            
        # 부분 수열의 합이 k보다 작은 경우
        elif prefix_sum < k:
            end += 1 # 마지막 인덱스 +1
            # 마지막 인덱스가 sequence 범위 안에 있으면 부분 수열의 합에 end 누적
            if end < len(sequence):
                prefix_sum += sequence[end]
                
        # 부분 수열의 합이 k보다 큰 경우
        elif prefix_sum > k:
            # 부분 수열의 합에서 start를 빼주고 start +1
            prefix_sum -= sequence[start]
            start += 1
            
    return answer