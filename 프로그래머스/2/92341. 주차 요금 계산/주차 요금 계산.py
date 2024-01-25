import math

def translate(time):
    splited = time.split(":")

    return int(splited[0]) * 60 + int(splited[1])


def solution(fees, records):
    answer = []
    # Dictionary => { 차량번호 : 들어온 시간 }
    in_cars_time = {}
    # Dictionary => { 차량번호 : 돈!... }
    times = {}

    # 먼저 records를 파씽하기!..
    for record in records:
        space_splited = record.split()
        if space_splited[2] == "IN":
            in_cars_time[space_splited[1]] = translate(space_splited[0])
        else:
            temp_time = translate(space_splited[0]) - in_cars_time[space_splited[1]]
            if times.get(space_splited[1]):
                times[space_splited[1]] = (times[space_splited[1]] + temp_time)
            else:
                times[space_splited[1]] = temp_time
            in_cars_time[space_splited[1]] = -1  # 출차했다고 빵 찍기!..
    
    
    for key, value in in_cars_time.items():
        if value != -1: # 아직 못나간 차량이 있다.
            if key in times:
                times[key] = times[key] + (1439-value)
            else:
                times[key] = 1439 - value
    sorted_dict = sorted(times.items())
    
    print(sorted_dict)
    for e in sorted_dict:
        if int(e[1]) <= fees[0]:
            answer.append(fees[1])
        else:
            temp_fee = fees[1] + math.ceil((e[1] - fees[0])/fees[2]) * fees[3]
            answer.append(temp_fee)
    return answer