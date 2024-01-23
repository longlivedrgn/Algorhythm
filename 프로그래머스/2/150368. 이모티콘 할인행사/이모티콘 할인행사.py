from itertools import product

def solution(users, emoticons):
    discount_list = [10, 20, 30, 40]
    discounts = list(product(discount_list, repeat = len(emoticons)))
    
    result = [] # 할인율 별 (가입자 수, 총 판매액) 저장하기
    
    for d in discounts:
        plus_members = 0
        profit = 0
        
        for (requirement, limit) in users:
            purchase = 0
            for i in range(len(d)):
                if d[i] >= requirement:
                    purchase += emoticons[i] - emoticons[i] * d[i] * 0.01
                
            if purchase >= limit:
                plus_members += 1
            else:
                profit += purchase
        
        result.append((plus_members, profit))
        
    sorted_result = sorted(result, reverse = True, key = lambda x: (x[0], x[1])) # 먼저 플러스 멤버 수로 내림차순, 그 다음 profit 기준으로 내림차순!
    
    return sorted_result[0]    
        
        
        
        
    
    answer = []
    return answer