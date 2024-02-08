def solution(s):
    answer = 987654321
    # 먼저 s를 각 갯수만큼 나눈다!..
    for i in range(1, len(s) // 2 + 1):
        splitted = []
        start = 0
        end = start + i
        surplus = len(s) % i
        for _ in range(len(s) // i):
            splitted.append(s[start:end])
            start += i
            end += i

        length = len(splitted[0])
        current_value = splitted[0]  # 먼저 제일 먼저 값을 저장해두기
        count = 1
        result_count = 0
        for (idx, value) in enumerate(splitted):
            if idx == 0:
                continue
            if value == current_value:
                count += 1
            else:
                if count != 1:
                    result_count += len(str(count)) + length
                else:
                    result_count += length
                current_value = value
                count = 1
        if count != 1:
            result_count += len(str(count)) + length
        else:
            result_count += length

        result_count += surplus # 나머지 갯수들 더해주기!..

        if result_count < answer:
            answer = result_count
    if answer == 987654321:
        return 1

    return answer