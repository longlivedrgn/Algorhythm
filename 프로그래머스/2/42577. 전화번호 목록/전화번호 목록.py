def solution(phone_book):
    # ["1", "2", "3", "10"] -> ["1", "10", "2", "3"] 이렇게 정렬하기!..
    phone_book.sort()
    
    for i in range(len(phone_book)-1):
        if phone_book[i] == phone_book[i+1][:len(phone_book[i])]:
            return False
    return True