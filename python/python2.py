import random, sys

#print('This is code 1.')
# while True:
#     print('who are you?')
#     name = input()
#     if name != 'youfucai':
#         continue
#     print('hello, youfucai. Waht is the passwrod(it is a fish.)')
#     password = input()
#     if password == 'bigboy':
#          break
# print('Access granted.')


# #while True:
# #    print('i am a boot.')

# print('this is code 2')
# total = 0
# for num in range(11):
#     total = total + num
# print(total)

# print('This is code 3.')
# sum = 0
# i = 0
# while i < 11:
#     print('curr valus is: ' + str(i))
#     sum =sum + i
#     i = i + 1
# print('final sum is: ' + str(sum))

# print('This is code 4.')
# for j in range(10, -10, -2):
#     print(j)
#     print('current value lengeth is: ' + str(len(str(j))) + '.')

# print('This is code 4.')
# for i in range(0, 9, 1):
#     print(random.randint(-100, 200))

# print('This is code 5.')
# for i in range(0, 9, 1):
#     print(i * 100)
#     if i == 8:
#         print('the program will be stoped. ')
#         # sys.exit()

# print('This is code 6.')
# def printHello(name):
#     print('hello ' + name + '!', end = '')
#     print('you are shy ' + name + '!')
#     return 100;
# print('Please enter your name: ', end = '')
# myName = input()
# print(printHello(myName))

# print('This is code 7.')
# def spam(divibeBy):
#     try:
#         return 42 / divibeBy
#     except ZeroDivisionError:
#         print('Error: Invalid arguments.')
# print(spam(100))
# print(spam(2200))
# print(spam(0))
# print(spam(1030))

# print('This is code 8.')
# # This is a guess the number game.
# import random
# secretNumber = random.randint(1, 20)
# print('I am thinking of a number between 1 and 20.')

# # Ask the player to guess 6 time.
# for guessToken in range(1,7,1):
#     print('take a guess.')
#     guess = int(input())

#     if guess < secretNumber:
#         print('Your guess is to low.')
#     elif guess > secretNumber:
#         print('Your guess is to high.')
#     else:
#         break # This condition id the correct guess!
# if guess == secretNumber:
#     print('Good job! you guessed my numbetr in ' + str(guessToken))
# else:
#     print('Your chance is useed all. the number
#    I was thinking of was ' + str(secretNumber))

print('This is code 9.')
listStudy = ['hello', 'okkfd', 'fsdg', 'vfvf']
print('I will print a list')
for name in listStudy:
    print(' ' + name)

print('I will create a cat list')
catNames = []
while True:
    print('Enter the name of cat  ' + str(len(catNames) + 1) +
          ' or enter nothing to stop.):')
    name = input()
    if name == '':
        break
    catNames = catNames + [name]
print('Thme cat name are: ')
for name in catNames:
    print('' + name)

    
print('This is code 10.')
messages = ['It is certain',
           'It is directory so',
           'Reply hazy try again',
           'Connectrate and ask again',
           'My reply is no',
           'Qutlook not so good'
           'Very doubtful']
print(messages[random.randint(0,len(messages) - 1)])

print('This is code 10.')
grid = [['.', '.', '.', '.', '.', '.'],
        ['.', 'O', 'O', '.', '.', '.'],
        ['O', 'O', 'O', 'O', '.', '.'],
        ['O', 'O', 'O', 'O', 'O', '.'],
        ['.', 'O', 'O', 'O', 'O', 'O'],
        ['O', 'O', 'O', 'O', 'O', '.'],
        ['O', 'O', 'O', 'O', '.', '.'],
        ['.', 'O', 'O', '.', '.', '.'],
        ['.', '.', '.', '.', '.', '.']]
for i in range(0,9):
    for j in range(0,6):
        if j == 5:
            print(grid[i][j])
        else:
            print(grid[i][j] + '   ', end = '')

print('This is code 11.')
myCat = {'size': 'fat', 'color': 'gray', 'disposition': 'loud'}

friendBirthdays = {'Lisa': 'Apr 1', 'Mary': 'Dec 5', 'Mike': 'Mar 5'}
while True:
    print('Enter a neme: (block to quit)')
    name = input()
    if name == '':
        break

if name in friendBirthdays:
    print(friendBirthdays[name] + ' is the birthday of ' + name)
else:
    print('I do not have birthday information for ' + name)
    print('What is their birthday?')
    bady = input()
    friendBirthdays[name] = bady
    print('friendBirthdays databse updated.')

import pprint
message = 'It was a bright cold day in April, and the clocks were striking thirteen.'
msgCount = {}
for msgCharacter in message:
    msgCount.setdefault(msgCharacter, 0)
    msgCount[msgCharacter] = msgCount[msgCharacter] + 1
pprint.pprint(msgCount)
print(pprint.pformat(msgCount))
