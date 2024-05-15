N = int(input())
a = input()

red = a.count('R')
blue = N - red
ans = min(red, blue) # 만약 최소 값이 양쪽 끝에 없는 색깔을 움직이는 것이라면? B R BBBBBBBBBB R B 
cnt = 0 

# 왼쪽으로 몰기!..
for i in range(N):
    if a[i] != a[0]:
        break
    cnt += 1 # 왼쪽에서부터 연속된 색깔의 공 갯수 구하기
if a[0] == 'R': # 맨 앞이 'R'이라면?.. -> R인 놈들 다 왼쪽으로 이동시키기
    ans = min(ans, red - cnt)
else:
    ans = min(ans, blue - cnt)

cnt = 0
for i in range(N-1, -1, -1):
    if a[i] != a[N - 1]:
        break
    cnt += 1
if a[N - 1] == 'R':
    ans = min(ans, red - cnt)
else:
    ans = min(ans, blue - cnt)
print(ans)