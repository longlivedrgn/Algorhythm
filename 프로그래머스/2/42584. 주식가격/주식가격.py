def solution(prices):
    times = [0 for i in range(len(prices))]
    temp_stack = []
    
    for i in range(len(prices)):
        for element in temp_stack:
            price, index = element
            times[index] += 1
        
        while len(temp_stack) != 0 and temp_stack[-1][0] > prices[i]:
            temp_stack.pop()
        
        temp_stack.append((prices[i], i)) # price, index
    
    return times