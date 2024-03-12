import collections
total_repeat = int(input())

for _ in range(total_repeat):
    input_string = str(input())
    k = int(input())
    shortest_count = 987654321
    longest_count = -987654321
    dict = collections.defaultdict(list) # list로 default value 값을 넣어준다.

    for i in range(len(input_string)):
        if input_string.count(input_string[i]) >= k:
            dict[input_string[i]].append(i)

    if not dict:
        print(-1)
        continue
    # { a: [0, 1, 2, 3..], b: [6, 7, 8, 9...] ..} 이런 식으로 dict가 구성이된다.

    for key in dict:
        for idx in range(len(dict[key]) - k + 1): # [1, 2, 3, 4, 5, 6]이고, k = 2라면? [1, 2], [2, 3], [3, 4]... 이렇게 나누어서 계산을 해야된다.
            length = dict[key][idx+k-1] - dict[key][idx] + 1 # 문자열의 길이 계산하기

            shortest_count = min(shortest_count, length)
            longest_count = max(longest_count, length)
    print(shortest_count, end= " ")
    print(longest_count)

