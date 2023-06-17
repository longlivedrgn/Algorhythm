N, K = map(int, input().split()) # N = 7, K = 3
arr = [i for i in range(1, N + 1)]  # 맨 처음에 원에 앉아있는 사람들

answer = []  # 제거된 사람들을 넣을 배열
num = 0  # 제거될 사람의 인덱스 번호
length = len(arr)

for t in range(N):
    num += K - 1 # 없어진 index에서 계속해서 +2 씩 더한다!
    num = num % length
    answer.append(str(arr.pop(num)))
    length -= 1
print("<", end = "")
for i in answer[:-1]:
    print(i, end=", ")
print(answer[-1], end = "")
print(">")