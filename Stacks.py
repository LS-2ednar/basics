# Simple script to show the power of stacks

#initialize a stack
s = Stack()

#add stuff to a stack
s.push('End...')
s.push('2')
s.push(3.231)

#check size and add more items to stack
c  = 0
while s.size() != 50:
    c += 1
    s.push(c)
    print(s.peek()) #see last added item of the stack
    
for item in range(s.size()):
    print(s.pop())
    
#Notes:
    # Stacks use methods 
    # LIFO --> Last in first out
    
    #Methods of Stacks:
        # Stack()       initializes a stack
        # push(item)    adds an item on top of the stack
        # pop()         removes the top item form the stack
        # peek()        returns the top value of the stack
        # isEmpty()     checks if the stack is empty and returns True or False
        # size()        shows the Size of the stack