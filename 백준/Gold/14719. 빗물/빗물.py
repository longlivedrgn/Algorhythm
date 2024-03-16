H, W = map(int, input().split())
blocks = list(map(int, input().split()))
answer = 0
for i in range(1, W-1): #맨 왼쪽과 맨 오른쪽은 어차피 물이 고일 수가 없다.
    left = max(blocks[:i])
    right = max(blocks[i+1:])
    
    shortest = min(left, right) # 더 짧은 쪽이 어딘 지를 판단한다.

    if shortest > blocks[i]:
        answer += (shortest-blocks[i]) # 그리고 가장 짧은 곳과 현재의 위치에서 차를 구한다.

print(answer)

