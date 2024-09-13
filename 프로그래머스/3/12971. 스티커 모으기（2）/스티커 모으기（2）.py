def solution(sticker):
    # 첫번째 꺼를 선택한 경우 / 첫번째 선택을 안한 경우
    if len(sticker) == 1:
        return sticker[0]
    dp1 = [0 for _ in range(len(sticker))]
    dp2 = [0 for _ in range(len(sticker))]
    dp1[0] = sticker[0] # 첫번째 선택 O
    dp1[1] = sticker[0] # 첫번째 선택 X
    
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in range(2, len(sticker)-1):
        dp1[i] = max(dp1[i-2]+sticker[i], dp1[i-1])
        
    for i in range(2, len(sticker)): 
        dp2[i] = max(dp2[i-2]+sticker[i], dp2[i-1])

    return max(max(dp1), max(dp2))