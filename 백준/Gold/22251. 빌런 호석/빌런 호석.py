N, K, P, X = map(int, input().split())

digital_number = ['1111110', '0110000', '1101101', '1111001', '0110011', '1011011', '1011111', '1110000', '1111111', '1111011']
zero_x = (K - len(str(X))) * "0" + str(X)

answer = -1
def check(value):
    temp_count = 0
    for m in range(K):
        a = value[m]
        b = zero_x[m]
        if a != b:
            temp_a = digital_number[int(a)]
            temp_b = digital_number[int(b)]

            for v in range(7):
                if temp_a[v] != temp_b[v]:

                    temp_count += 1
                if temp_count > P:
                    return -1
    return temp_count

for i in range(1, N+1):
    changed_a = (K - len(str(i))) * "0" + str(i)
    if check(changed_a) == -1:
        continue
    answer += 1
print(answer)
