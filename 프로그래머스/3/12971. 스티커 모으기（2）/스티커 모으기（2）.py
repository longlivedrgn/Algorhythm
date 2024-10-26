def solution(sticker):
    if len(sticker) == 1:
        return sticker[0]
    # 첫번째를 먹는거랑 안먹는거랑 나눠서 생각하기
    dp1 = [0 for _ in range(len(sticker))]
    dp2 = [0 for _ in range(len(sticker))]
    
    # 첫번째를 먹었음
    dp1[0] = sticker[0]
    dp1[1] = sticker[0]
    
    # 두번째를 먹었음
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in range(2, len(sticker) -1):
        dp1[i] = max(dp1[i-2]+sticker[i], dp1[i-1])
    
    for i in range(2, len(sticker)):
        dp2[i] = max(dp2[i-2]+sticker[i], dp2[i-1])
    return max(max(dp2), max(dp1))