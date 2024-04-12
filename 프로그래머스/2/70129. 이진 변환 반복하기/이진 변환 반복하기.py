def solution(s):
    real_answer = []
    delete_zero = 0
    times = 0
    while s != 1:
        count = 0
        deleted_count = 0
        answer = []
        
        for s_each in str(s):
            if s_each == "1":
                count += 1
            else:
                deleted_count += 1
        
        delete_zero += deleted_count
        
        while count != 1:
            answer.append(count % 2)
            count = count // 2
        answer.append(1)

        answer.reverse()
        s = int(''.join(map(str, answer)))
        times += 1
    real_answer.append(times)
    real_answer.append(delete_zero)

    return real_answer