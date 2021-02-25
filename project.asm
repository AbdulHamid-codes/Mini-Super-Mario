
;-----------------------COAL-lab PROJECT--------------------------;
;-------------------FAST-NUCES Islamabad-------------------------;
;-----------------------Group Members----------------------------;
;--------------------Rohan Saeed 19i-0411-------------------------;
;--------------------Abdul Hamid 19i-0565-------------------------;
;--------------------Nouman Ahmed 19i-419---------------------------;



.model small
.stack

.data

	background db 2
	x_cordinate db 0
	y_cordinate db 0
	startMsg db "------Welcome to Mini Mario-----", '$'
	inputName db "Enter your name: ", '$'
	yourName db 100 dup('$')
	
	toStart db "Press S to start the game",'$'
	toLeave db "Press L to leave the game",'$'
	forHelp db "Press h to for help",'$'
	
	help db "Use up, down, left, right key to move mario",'$'
	
	winMsg db "----You Win----",'$'
	loseMsg db "----You Lose----",'$'
	scoreMsg db 0Ah,0Ah,"           Your Score : ",'$'
	
	p1 db "Score :",'$'
	p2 db "Level :",'$'
	p3 db "Lives :",'$'
	
	x_mario word 1
	y_mario word 163

	
	x_enemy1 word 95
	y_enemy1 word 168
	
	x_enemy2 word 175
	y_enemy2 word 168
	
	x_coin1 word  60
	y_coin1 word  150
	flag1 word 0
	
	x_coin2 word  140
	y_coin2 word  142
	flag2 word 0
	
	x_coin3 word  220
	y_coin3 word  134
	flag3 word 0
	
	x_monster word 30
	y_monster word 15	

	
	x_bomb word 125
	y_bomb word 50
	
	level word 1
	score word 0
	life word 3
	
	temp1 word 10
	temp2 word 10
	
	temp word 0	
	tempE1 byte 0
	tempE12 byte 1
	tempM1 byte 1
	
	

marioShape db 11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11	
	db 11,11,11,11,11,11, 2, 2, 2, 2, 2, 2, 2, 2, 2,11,11,11,11,11,11
	db 11,11,11,11,11,11, 2, 2, 0, 2, 2, 2, 0, 2, 2,11,11,11,11,11,11
	db 11,11,11,11,11,11, 2, 2, 2, 2, 2, 2, 2, 2, 2,11,11,11,11,11,11
	db 11,11,11,11,11,11, 2, 2, 2, 2, 2, 2, 2, 2, 2,11,11,11,11,11,11
	db 11,11,11,11,11,11, 2, 2, 2, 2, 0, 2, 2, 2, 2,11,11,11,11,11,11
	db 11,11,11,11,11,11, 2, 2, 2, 2, 2, 2, 2, 2, 2,11,11,11,11,11,11
	db 11,11,11,11,11,11, 2, 2, 2, 2, 2, 2, 2, 2, 2,11,11,11,11,11,11
	db 11,11,11,11,11,11,11,11,11, 4, 4,11,11,11,11,11,11,11,11,11,11
	db 11,11,11,11,11,11,11,11,11, 4, 4,11,11,11,11,11,11,11,11,11,11
	db 11,11,11,11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,11,11,11,11
	db 11,11,11, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4,11,11,11
	db 11,11, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4,11,11
	db 11, 4, 4,11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,11, 4, 4,11
	db  4, 4,11,11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,11,11, 4, 4
	db  4,11,11,11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,11,11,11, 4
	db 11,11,11,11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,11,11,11,11
	db 11,11,11,11,11, 4,11,11,11,11,11,11,11,11,11, 4,11,11,11,11,11
	db 11,11,11,11,11, 4,11,11,11,11,11,11,11,11,11, 4,11,11,11,11,11
	db 11,11,11,11, 4, 4,11,11,11,11,11,11,11,11,11, 4, 4,11,11,11,11
	db 11,11,11,11, 4, 4,11,11,11,11,11,11,11,11,11, 4, 4,11,11,11,11
	

enemy db 11,11,11,11,11,11, 6, 6, 6, 6,11,11,11,11,11,11,11
  db 11,11,11,11,11, 6, 6, 6, 6, 6, 6,11,11,11,11,11,11
  db 11,11,11,11, 6, 6, 6, 6, 6, 6, 6, 6,11,11,11,11,11
  db 11,11,11, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,11,11,11,11
  db 11,11, 6, 0, 0, 6, 6, 6, 6, 6, 6, 0, 0, 6,11,11,11
  db 11, 6, 6, 6,13, 0, 6, 6, 6, 6, 0,13, 6, 6, 6,11,11
  db 11, 6, 6, 6,13, 0, 0, 0, 0, 0, 0,13, 6, 6, 6,11,11
  db  6, 6, 6, 6,13, 0,13, 6, 6,13, 0,13, 6, 6, 6, 6,11
  db  6, 6, 6, 6,13, 0,13,13,13,13, 0,13, 6, 6, 6, 6,11
  db  6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,11
  db 11, 6, 6, 6, 6,13,13,13,13,13,13, 6, 6, 6, 6,11,11
  db 11,11,11,11,13,13,13,13,13,13,13,13,11,11,11,11,11
  db 11,11, 0, 0,13,13,13,13,13,13,13,13, 0, 0,11,11,11
  db 11, 0, 0, 0, 0, 0,13,13,13,13, 0, 0, 0, 0, 0,11,11
  db 11, 0, 0, 0, 0, 0, 0,13,13, 0, 0, 0, 0, 0, 0,11,11
  db 11,11, 0, 0, 0, 0, 0,11,11, 0, 0, 0, 0, 0,11,11,11

monsterShape db 11,11,11,11,11,11, 0,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 0, 0,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11, 0, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 4, 4, 0,11,11,11,11,11,11,11,11,11,11,11,11,11, 0, 4, 4,11,11,11,11,11,11,11,11
db 11,11,11,11,11, 0, 4, 4, 0,11,11,11,11,11,11,11,11,11,11,11,11,11, 0, 4, 4, 0,11,11,11,11,11,11,11
db 11,11,11,11,11, 0, 4, 4, 4, 0,11,11,11,11,11,11,11,11,11,11,11, 0, 4, 4, 4, 0,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 4, 4, 4, 0,11,11,11,11,11, 0,11,11,11,11,11, 0, 4, 4, 4,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 0, 4, 4, 4, 0,11,11, 0,14,14,14, 0,11,11, 0, 4, 4, 4, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 0, 4, 4, 4, 4, 0,14,14,14,14,14,14,14, 0, 4, 4, 4, 4, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 0, 4, 4, 4, 4, 4, 0,14,14,14,14,14, 0, 4, 4, 4, 4, 4, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11, 4, 4, 4, 0,14,14,14,14,14,14,14,14,14, 0, 4, 4, 4,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11, 0, 4, 4,14,14,14,14,14,14,14,14,14,14,14, 4, 4, 0,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11, 0, 4, 0,14,14,14,14,14,14,14,14,14,14,14, 0, 4, 0,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11,11, 0,14,14,14,14,14,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11,11,14,14,14, 0, 0,14,14,14,14,14,14, 0, 0,14,14,11,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11, 0,14,14,14,14, 0, 0,14,14,14,14, 0, 0,14,14,14, 0,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 0,14,14,14,14,14, 0,15, 0, 0, 0, 0,15, 0,14,14,14,14, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 0,14,14,14,14,14, 0, 0,14,14,14,14, 0, 0,14,14,14,14, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11, 0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11,11
db 11,11,11,11,11,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,11,11,11,11,11,11,11
db 11,11,11,11, 0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11
db 11,11,11,11, 0,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11
db 11,11,11,11, 0,14,14,14,14,14,14,14,14,14,14, 0, 0,14,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11
db 11,11,11,11, 0,14,14,14,14,14,14,14,14,14, 0, 15, 15, 0,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11
db 11,11,11,11,11,14,14,14,14,14,14,14,14,14,15, 0, 0,15,14,14,14,14,14,14,14,14,11,11,11,11,11,11,11
db 11,11,11,11,11, 0,14,14,14,14,14,14,14, 0,15, 0, 0,15, 0,14,14,14,14,14,14, 0,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 0,14,14,14,14,14,14, 0, 0, 0, 0, 0, 0,14,14,14,14,14, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11, 0,14,14,14,14,14,14,14, 0, 0, 0, 0,14,14,14,14,14,14, 0,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11, 0,14,14,14,14,14,14, 0, 0, 0, 0,14,14,14,14,14, 0,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11, 0,14,14,14,14,14,14,14, 0, 0,14,14,14,14,14,14, 0,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11,11, 0,14,14,14,14,14,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11,11,11, 0,14,14,14,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11,11,11,11, 0,14,14,14,14,14,14,14,14,14, 0,11,11,11,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11,11,11,11,11,11, 0,14,14,14,14,14, 0,11,11,11,11,11,11,11,11,11,11,11,11,11,11
db 11,11,11,11,11,11,11,11,11,11,11,11,11,11, 0, 0, 0, 0,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11

bombShape db 11,11,11,11,42,11,11,11,11
db 11,11,11,42,43,42,11,11,11
db 11,11,42,43,43,43,42,11,11
db 11,42,43,43,43,43,43,42,11
db 42,43,43,43,43,43,43,43,42
db 42,43,43,43,14,43,43,43,42
db 42,43,43,14,14,14,43,43,42
db 42,43,43,14,14,14,43,43,42
db 11,42,43,43,14,43,43,42,11
db 11,11,42,43,43,43,42,11,11
db 11,11,11,42,43,42,11,11,11
  


 
 
kingdomShape2 db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4, 11, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4,  4, 11, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4,  4,  4,  4, 11, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4,  4,  4,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4,  4,  4,  4,  4,  4, 11, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4, 11, 11, 11 
db 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11
db 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11
db  8,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  6,  6,  6,  6,  6,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  6,  6,  6,  6,  6,  8,  8,  8, 11, 11, 11
db  8,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  6,  6,  6,  6,  6,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  6,  6,  6,  6,  6,  8,  8,  8, 11, 11, 11
db  8,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  6,  6,  6,  6,  6,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  6,  6,  6,  6,  6,  8,  8,  8, 11, 11, 11
db  8,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  6,  6,  6,  6,  6,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  8,  8,  8,  8, 11, 11, 11, 11,  8,  8,  8,  6,  6,  6,  6,  6,  8,  8,  8, 11, 11, 11
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8 
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8 
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8 
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8 
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8 
db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8


coin db 11,11,14,14,14,14,11,11
	db 11,14,14,14,14,14,14,11
	db 11,14,14,6 ,6 ,14,14,11
	db 14,14,6 ,14,14,0 ,14,14
	db 14,14,6 ,14,14,0 ,14,14
	db 14,14,6 ,14,14,0 ,14,14
	db 14,14,6 ,14,14,0 ,14,14
	db 11,14,14,0 ,0 ,14,14,11
	db 11,14,14,14,14,14,14,11
	db 11,11,14,14,14,14,11,11
.code

 
moonStar db 2,2,2,2,2,2,2,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
  db 2,2,2,2,2,2,15,15,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
  db 2,2,2,2,2,15,15,15,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
  db 2,2,2,2,15,15,15,15,15,15,2,2,2,2,15,15,15,15,15,2,2,2,2,2,2,2,2,2
  db 2,2,2,15,15,15,15,15,15,15,15,2,2,2,2,2,15,15,15,15,15,2,2,2,2,2,2,2
  db 15,15,15,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,15,15,15,15,2,2,2,2,2,2
  db 2,15,15,15,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,15,15,15,15,15,2,2,2,2
  db 2,2,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2,2,2,15,15,15,15,15,2,2,2
  db 2,2,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2,2,2,2,15,15,15,15,15,2,2,2
  db 2,2,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,2,2
  db 2,2,2,15,15,15,2,15,15,15,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,2,2
  db 2,2,2,15,15,2,2,2,15,15,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,2
  db 2,2,2,15,2,2,2,2,2,15,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,2
  db 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,2
  db 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,2
  db 2,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,2
  db 2,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,2
  db 2,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,2
  db 2,15,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,2,2
  db 2,2,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,2,2
  db 2,2,15,15,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,2,2,2
  db 2,2,15,15,15,2,2,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,15,2,2,2
  db 2,2,2,15,15,15,15,2,2,2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,2,2,2,2
  db 2,2,2,15,15,15,15,15,15,2,2,2,2,2,15,15,15,15,15,15,15,15,15,2,2,2,2,2
  db 2,2,2,2,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2
  db 2,2,2,2,2,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2,2
  db 2,2,2,2,2,2,2,15,15,15,15,15,15,15,15,15,15,15,15,2,2,2,2,2,2,2,2,2
  db 2,2,2,2,2,2,2,2,2,15,15,15,15,15,15,15,2,2,2,2,2,2,2,2,2,2,2,2
  db 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
  db 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
main proc
	mov ax, @data
	mov ds, ax
	
	
	call setBackground			;starting screen
	mov x_cordinate, 12
	mov y_cordinate, 5
	call setCursor
	
	mov dx,offset startMsg
	mov ah,09h
	int 21h
	
	mov ah,0h      ;key input
	int 16h
	
	
	call setBackground					;2nd screen
	mov x_cordinate, 10
	mov y_cordinate, 7
	call setCursor
	mov dx,offset inputName
	mov ah,09h
	int 21h
	

	mov x_cordinate,10			
	mov y_cordinate,8
	call setCursor
	mov dx,offset yourName
	mov ah,3fh
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	
	call setBackground
	
	giveOptions:					;option to choose between starting game,help, leave 		
		mov x_cordinate,10
		mov y_cordinate,10
		call setCursor
	
		mov dx,offset toStart
		mov ah,09h
		int 21h
	
		mov dl, 10
		mov ah, 02h
		int 21h
		
		mov x_cordinate,10
		mov y_cordinate,11
		call setCursor
		
		mov dx,offset forHelp
		mov ah,09h
		int 21h
	
		mov dl, 10
		mov ah, 02h
		int 21h
	
		mov x_cordinate,10
		mov y_cordinate,12
		call setCursor
	
		mov dx,offset toLeave
		mov ah,09h
		int 21h
	
	
		mov dl, 10
		mov ah, 02h
		int 21h
	
		mov x_cordinate,10
		mov y_cordinate,13
		call setCursor
	
		mov ah, 01h					;key input
		int 21h
	
		cmp al,'s'
		je startGame
		cmp al,'l'
		je exitGame
		cmp al,'h'
		je displayInstructions
		call setBackground
	
		mov cx,1      				  ;WAIT...
		mov dx,000fh
		mov ah,86h
		int 15h
	jmp giveOptions
	
	displayInstructions:
		call setBackground
		mov dx, offset help
		mov ah, 09h
		int 21h
		mov ah,0h     ;key input
		int 16h
		
		
	startGame:						;when game will start
		mov ah,0h						;video mode
		mov al, 13h
		int 10h
	
		
		call setBackground
		
		mov x_cordinate, 1			;displaying score at top
		mov y_cordinate, 0
		call setCursor	
		
		mov dx,offset p1			
		mov ah,09h
		int 21h
		
		mov dx,score
		add dx,48
		mov ah,02h
		int 21h
		
		mov x_cordinate, 17			;displaying level at top
		mov y_cordinate, 0
		call setCursor	
		
		mov dx,offset p2			
		mov ah,09h
		int 21h
		
		mov dx,level
		add dx,48
		mov ah,02h
		int 21h
		
		mov x_cordinate, 30			;displaying lives at top
		mov y_cordinate, 0
		call setCursor	
		
		mov dx,offset p3
		mov ah,09h
		int 21h
		
		mov dx,life
		add dx,48
		mov ah,02h
		int 21h
		
		
		call PrintMario					;printing mario cartoon
		
		cmp level,3					;flag will be shown in first two levels
		je moveNext4
		call flag
		call printMoonStar
		
moveNext4:							
		call hurdles			;displaying 3 hurdles
		call ground
		
		cmp level,2				;enemies will be present in second and third level
		jl moveNext5
		call printEnemy1		;printing enemies and moving them left right
		call printEnemy2
		call Enemy1CollisionFront	;checking collsion of enemies with mario
		call Enemy1CollisionBack
		call Enemy2CollisionFront
		call Enemy2CollisionBack
moveNext5:						
		cmp flag1,1			;when flag1 will be 1,i.e. mario will reach coin1 ,coin1 will disappear
		je moveNext1
		call printCoin1
		call coin1Detection
movenext1:
		cmp flag2,1			;when flag2 will be 1,i.e. mario will reach coin2 ,coin2 will disappear
		je moveNext2
		call printCoin2
		call coin2Detection
movenext2:
		cmp flag3,1			;when flag3 will be 1,i.e. mario will reach coin13 ,coin3 will disappear
		je moveNext3
		call printCoin3
		call coin3Detection
movenext3:
		cmp level,3			;kingdom, monster and bomb will be present in third level
		jl moveNext6
		call printKingdom		
		call printMonster	;printing monster and move it left right
		call printBomb		;printing bomb,dropping it and checking collision with mario
		call dropBomb
		call BombMarioCollision		;when collision occurs,game will be over
moveNext6:
		cmp level,3			;in level 3,mario has to reach kingdom
		jne moveNext8
		cmp x_mario,251
		jne moveNext7
		call IncreaseLevel	
movenext8:		
		cmp x_mario,291		;in level 1 and 2,mario has to reach flag
		jne moveNext7
		call IncreaseLevel	;next level will come
		
moveNext7:		

		cmp level,4			;when level 3 will be over
		jne moveNext9
		call setBackground
		
		mov x_cordinate,10	;displaying win message
		mov y_cordinate,12
		call setCursor
		mov dx,offset winMsg
		mov ah,09h
		int 21h
		
		mov dx,offset scoreMsg	;displaying score at the end
		mov ah,09h
		int 21h
		
		mov dx,score
		add dx,48
		mov ah,02h
		int 21h
		
		jmp exitGame

moveNext9:	

		cmp life,0			;when player loose all lives
		jne moveNext10
		call setBackground
		
		mov x_cordinate,10		;displaying loose message
		mov y_cordinate,12
		call setCursor
		mov dx,offset loseMsg
		mov ah,09h
		int 21h
		
		mov dx,offset scoreMsg		;displaying score at end
		mov ah,09h
		int 21h
		
		mov dx,score
		add dx,48
		mov ah,02h
		int 21h
		
		jmp exitGame
		
moveNext10:		
			
		mov cx,1        ;WAIT...
		mov dx,000fh
		mov ah,86h
		int 15h
		
		
		mov ah,01h        ;checking key input
		int 16h
		jz startGame
	
		mov ah,0h     ;key input
		int 16h

		cmp ah,72		;when up key pressed
		je MoveUp
		
		cmp ah,80		;when down key pressed
		je MoveDown
		
		cmp ah,75		;when left key pressed
		je MoveLeft
	
		cmp ah,77		;when right key pressed
		je MoveRight
		
		cmp ah,01		;when escape key pressed
		je Out2
		
		
		
MoveUp:				
		cmp y_mario,125			;mario wont move above this limit
		jle Nextl1
			
		sub y_mario,5			;mario will move up
		jmp Nextl1
			
MoveDown:
		cmp y_mario,163			;mario wont go down in ground
		jge Nextl1
			
		cmp x_mario,28			;for crossing first hurdle	
		jle addHeight
		cmp x_mario,80
		jle checkH7
		
		cmp x_mario,108			;for crossing second hurdle
		jle addHeight
		cmp x_mario,160
		jle checkH8
			
		cmp x_mario,188			;for crossing third hurdle
		jle addHeight
		cmp	x_mario,240
		jle checkH9
				
			
		jmp addHeight	;if there is no hurdle
		
	checkH7:					
		cmp y_mario,135			;hurdle 1 will be crossed on this height 
		jle addHeight
		jmp Nextl1
			
	checkH8:
		cmp y_mario,125			;hurdle 2 will be crossed on this height 
		jle addHeight
		jmp Nextl1
			
	checkH9:
		cmp y_mario,120			;hurdle 3 will be crossed on this height 
		jle addHeight
		jmp Nextl1		
			
	addHeight:				
		add y_mario,5
		jmp Nextl1
	
MoveLeft:
			cmp x_mario,1	;for not going out of screen
			jle Nextl1
			
			cmp x_mario,28		;for 1st hurdle
			jle subLength
			cmp x_mario,82
			jle checkH4
			
			cmp x_mario,108		;for 2nd hurdle
			jle subLength
			cmp x_mario,162
			jle checkH5
			
			cmp x_mario,188		;for 3rd hurdle
			jle subLength
			cmp	x_mario,242
			jle checkH6
			
			
			jmp subLength		;when there is no hurdle in front
			
	checkH4:
		cmp y_mario,140		;player will only move left on this height on hurdle1
		jle subLength
		jmp Nextl1
	checkH5:
		cmp y_mario,130		;player will only move left on this height on hurdle2
		jle subLength
		jmp Nextl1		
	checkH6:
		cmp y_mario,125		;player will only move left on this height on hurdle3
		jle subLength
		jmp Nextl1		
			
	subLength:			;moving left
		sub x_mario,1
		jmp Nextl1
			
MoveRight:
			cmp x_mario,300		;for not going out of screen
			jge Nextl1
			
			cmp x_mario,26		;for 1st hurdle
			jle addLength
			cmp x_mario,80
			jle checkH1
					
			cmp x_mario,106		;for 2nd hurdle
			jle addLength
			cmp x_mario,160
			jle checkH2
			
			cmp x_mario,186		;for 3rd hurdle
			jle addLength
			cmp x_mario,240
			jle checkH3		
			jmp addLength 
				
	checkH1:
		cmp y_mario,140		;player will only move right on this height on hurdle1
		jle addLength
		jmp Nextl1
	checkH2:
		cmp y_mario,130		;player will only move right on this height on hurdle2
		jle addLength
		jmp Nextl1	
	checkH3:
		cmp y_mario,125		;player will only move right on this height on hurdle3
		jle addLength
		jmp Nextl1	
	
	addLength:				;moving right
		add x_mario,1
		jmp Nextl1
		
	Nextl1:				
	jmp startGame

	exitGame:
	
	Out2:			
	mov ah, 4ch 	;exiting game
	int 21h
main endp 







	;function to make screen clear
setBackground proc uses ax bx cx dx
	mov ah,06h
	mov al,0
	mov bl,0
	mov bh, 11         ;00011100b;background
	mov cx,0
	mov dl,80
	mov dh,80
	int 10h
	ret
setBackground endp

	;function to set cursor at a given point
setCursor proc uses ax bx cx dx si
	mov ah,02h
	mov bh, 0
	mov dh,y_cordinate
	mov dl,x_cordinate
	int 10h 
	ret
setCursor endp 


	;function ot print mario on screen using 2d array of marioShape
PrintMario proc uses ax bx cx dx si
								;pixels of screen will be changed to pixels of mario
	mov cx, x_mario		;starting point of mario
	mov temp1,cx
	mov cx,y_mario
	mov temp2,cx
	mov cx,21		;outer loop will run this times
	mov si,0
	alongRow:
		push cx
		mov cx,x_mario
		mov temp1,cx
		mov cx,21		;inner loop will run this times
		alongCol:
			push cx
			mov ah,0ch
			mov al,marioShape[si]		;pixels are changing one by one
			inc si
			mov cx,temp1
			mov dx,temp2
			int 10h
			inc temp1
			pop cx
		loop alongCol
	inc temp2
	pop cx
	loop alongRow
ret 
printMario endp


			;function to print 3 hurdles
hurdles proc	

	mov ah,06h
	mov al,0
	
			;hurdle1
	mov ch,20
	mov cl,6
	mov dh,20
	mov dl,9
	
	mov bh,12	;hurdle color
	int 10h
	
	mov ch,21
	mov cl,7
	mov dh,22
	mov dl,8
	
	mov bh,12	;hurdle color
	int 10h
	
			;hurdle2
	mov ch,19
	mov cl,16
	mov dh,19
	mov dl,19
	
	mov bh,4	;hurdle color
	int 10h
	
	mov ch,20
	mov cl,17
	mov dh,22
	mov dl,18
	
	mov bh,4	;hurdle color
	int 10h
	
			;hurdle3
	mov ch,18
	mov cl,26
	mov dh,18
	mov dl,29
	
	mov bh,12	;hurdle color
	int 10h
	
	mov ch,19
	mov cl,27
	mov dh,22
	mov dl,28
	
	mov bh,12	;hurdle color
	int 10h
	
	ret
hurdles endp		

	;function to print simple flag with moon and star
flag proc		

	mov ah,06h
	mov al,0
	
	mov ch,1		;printing stick of flag
	mov cl,39
	mov dh,24
	mov dl,39
	
	mov bh,6
	int 10h
	
	mov ch,1		;printing green part of flag
	mov cl,32
	mov dh,5
	mov dl,38	
	
	mov bh,2
	int 10h
	
	mov ch,1	;printing white part of flag
	mov cl,38
	mov dh,5
	mov dl,38
	
	mov bh,15
	int 10h
	
	ret

flag endp	

		;function to print moon and star on flag
printMoonStar proc
	mov temp1,265 			;starting point 
	mov temp2,13
	mov cx,30		;outer loop will run this times
	mov si,0
	
	alongRow:
		push cx
		mov temp1,265
		mov cx,28	;inner loop will run this times
		alongColumn:
		
			push cx
			mov ah,0ch
			mov al,moonStar[si]	;pixels changing one by one
			inc si
			mov cx,temp1
			mov dx,temp2
			int 10h
			inc temp1
			pop cx
			
		loop alongColumn
		
	inc temp2
	pop cx
	
	loop alongRow

ret
printMoonStar endp
		
		;function to print green ground
ground proc
	mov ch,23		
	mov cl,0
	mov dh,24
	mov dl,39
	
	mov bh,2
	int 10h
	
	ret
ground endp

	;function for printing the monster using monsterShape and moving it left right
printMonster proc uses bx
	mov bx,x_monster	;starting point
	mov temp1,bx
	mov bx,y_monster
	mov temp2,bx
	mov cx,34		;outer loop count
	mov si,0
	
	alongRow:
		push cx
		mov bx,x_monster
		mov temp1,bx
		mov cx,33	;inner loop count
		alongColumn:
		
			push cx
			mov ah,0ch
			mov al,monsterShape[si]	;pixel changing one by one
			inc si
			mov cx,temp1
			mov dx,temp2
			int 10h
			inc temp1
			pop cx
			
		loop alongColumn
		
	inc temp2
	pop cx
	
	loop alongRow

				;moving monster left and right
	cmp tempM1,0	;when flag is 0,monster will move right	
	je jmpInc			;for moving right
	jmp Forward1	
	jmpInc:
	inc x_monster
	cmp x_monster,220	;max limit to move right
	je labell2
	jmp exit1
	labell2:
	mov tempM1,1	;monster will stop moving right
	jmp exit1			
	Forward1:
	cmp tempM1,1		;when flag is 1,monster will move left
	je jmpDec				;for moving left
	jmp exit1
	jmpDec:
	dec x_monster
	cmp x_monster,0		;max limit to move left
	je labell1
	jmp exit1
	labell1:
	mov tempM1,0		;monster will stop moving left
	
	exit1:
	ret
printMonster endp

		;function for printing bomb dropped by monster
printBomb proc
	mov bx,x_bomb	;starting point
	mov temp1,bx
	mov bx,y_bomb
	mov temp2,bx
	mov cx,11	;outer loop count
	mov si,0
	
	alongRow:
		push cx
		mov bx,x_bomb
		mov temp1,bx
		mov cx,9		;inner loop count
		alongColumn:
		
			push cx
			mov ah,0ch
			mov al,bombShape[si]	;pixels changing one by one
			inc si
			mov cx,temp1
			mov dx,temp2
			int 10h
			inc temp1
			pop cx
			
		loop alongColumn
		
	inc temp2
	pop cx
	
	loop alongRow

	ret
printBomb endp

	;function to drop the bomb down
dropBomb proc uses bx
		
	inc y_bomb	;move down by one pixel
	
	cmp x_bomb,39		;checking for hurdle1
	jle next123
	cmp x_bomb,80
	jle cmpHurdle1

next123:

	cmp x_bomb,119		;checking for hurdle2
	jle next124
	cmp x_bomb,160
	jle cmpHurdle2

next124:

	cmp x_bomb,199		;checking for hurdle3
	jle next125
	cmp x_bomb,240
	jle cmpHurdle3

next125:


	cmp y_bomb,175		;when bomb hits ground
	jge goStart
	jmp exit2

cmpHurdle1:			
	cmp y_bomb,145		;bomb should be disappeared on this height for hurdle1
	jge goStart
	jmp exit2
	
cmpHurdle2:
	cmp y_bomb,140		;bomb should be disappeared on this height for hurdle2
	jge goStart
	jmp exit2

cmpHurdle3:
	cmp y_bomb,135		;bomb should be disappeared on this height for hurdle3
	jge goStart
	jmp exit2
	

goStart:		;bomb will vanish and next bomb will come
	mov y_bomb,50
	mov bx,x_monster
	add bx,10
	mov x_bomb,bx

exit2:
ret
dropBomb endp	

			;function to check collision of bomb with mario
BombMarioCollision proc uses bx
	mov bx,y_bomb	;when bomb comes near mario wrt height
	add bx,11
	cmp bx,y_mario
	jl exit3
	
	mov bx,y_mario	
	add bx,21
	cmp y_bomb,bx
	jg exit3
	jmp cmpLength1	;checking whether bomb lies in range of mario wrt x-axis


cmpLength1:			
	mov bx,x_bomb
	add bx,9
	cmp bx,x_mario
	jl exit3
	mov bx,x_mario
	add bx,21
	cmp x_bomb,bx
	jg exit3
	
	mov life,0			;when collision occurs,game will be over
	
	mov x_mario,1
	mov y_mario,163
	
exit3:
	ret
BombMarioCollision endp

		;function to check whether mario picks coin1 or not 
coin1Detection proc uses bx
	mov bx,x_mario		;checking collision horizontally
	add bx,21
	cmp x_coin1,bx
	je HeightCh
	
	mov bx,x_mario
	cmp x_coin1,bx
	je HeightCh
	
	jmp exit4
	
	HeightCh:	;checking collision vertically
	mov bx,y_mario
	add bx,21
	cmp y_coin1,bx
	jg exit4
	
	cmp flag1,1		;checking whether coin is present there or not
	je exit4
	inc score	;score will increase on picking coin
	mov flag1,1		;flag will become 1 resulting in disappearance of coin set in main proc
exit4:
ret
coin1Detection endp

	;function to check whether mario picks coin2 or not 
coin2Detection proc uses bx
	mov bx,x_mario	;checking collision horizontally
	add bx,21
	cmp x_coin2,bx
	je HeightCh
	
	mov bx,x_mario
	cmp x_coin2,bx
	je HeightCh
	
	jmp exit4
	
	HeightCh:	;checking collision vertically
	mov bx,y_mario
	add bx,21
	cmp y_coin2,bx
	jg exit4
	
	cmp flag2,1	;checking whether coin is present there or not
	je exit4
	inc score	;score will increase on picking coin
	mov flag2,1	;flag will become 1 resulting in disappearance of coin set in main proc
exit4:
ret
coin2Detection endp

	;function to check whether mario picks coin2 or not 
coin3Detection proc uses bx
	mov bx,x_mario	;checking collision horizontally
	add bx,21
	cmp x_coin3,bx
	je HeightCh
	
	mov bx,x_mario
	cmp x_coin3,bx
	je HeightCh
	
	jmp exit4
	
	HeightCh:	;checking collision vertically
	mov bx,y_mario
	add bx,21
	cmp y_coin3,bx
	jg exit4
	
	cmp flag3,1	;checking whether coin is present there or not
	je exit4
	inc score	;score will increase on picking coin
	mov flag3,1	;flag will become 1 resulting in disappearance of coin set in main proc
exit4:
ret
coin3Detection endp

	;function to print enemy1 and checking its collsion with mario
printEnemy1 proc		

	push bx
	mov bx,x_enemy1
	mov di,offset enemy
	mov cx,16	;outer loop count
	rowWise:

		mov temp,cx
		mov cx,16	;inner loop count
		columnWise:
	
			push cx
			mov cx,x_enemy1	;starting point
			mov dx,y_enemy1
			mov al,[di]	;changing pixel one by one
			mov ah,0CH
			int 10h
			inc x_enemy1
			inc di
			pop cx
	
		Loop columnWise
		mov x_enemy1,bx
		inc y_enemy1
		inc di
		mov cx,temp
	
	Loop rowWise	
	sub y_enemy1,16
	
		;moving enemy1 left right 
		;logic similar to movement of monster
	cmp tempE1,0
	je jmpInc
	jmp Forward1
	jmpInc:
	inc x_enemy1
	cmp x_enemy1,119
	je labell2
	jmp exit1
	labell2:
	mov tempE1,1
	jmp exit1
	Forward1:
	cmp tempE1,1
	je jmpDec
	jmp exit1
	jmpDec:
	dec x_enemy1
	cmp x_enemy1,73
	je labell1
	jmp exit1
	labell1:
	mov tempE1,0
	
	exit1:
	pop bx
	ret

printEnemy1 endp	
	
	;function to print enemy2 and checking its collsion with mario
printEnemy2 proc		

	push bx
	mov bx,x_enemy2
	mov di,offset enemy
	mov cx,16	;outer loop count
	rowWise:
		mov temp,cx
		mov cx,16	;inner loop count
		columnWise:
	
			push cx
			mov cx,x_enemy2		;starting point
			mov dx,y_enemy2
			mov al,[di]		;changing pixel one by one
			mov ah,0CH
			int 10h
			inc x_enemy2
			inc di
			pop cx
	
		Loop columnWise
		mov x_enemy2,bx
		inc y_enemy2
		inc di
		mov cx,temp
	Loop rowWise
	sub y_enemy2,16
	
		;moving enemy2 left right
		;logic similar to movement of monster
	cmp tempE12,0
	je jmpInc
	jmp Forward1
	jmpInc:
	inc x_enemy2
	cmp x_enemy2,200
	je labell2
	jmp exit1
	labell2:
	mov tempE12,1
	jmp exit1
	Forward1:
	cmp tempE12,1
	je jmpDec
	jmp exit1
	jmpDec:
	dec x_enemy2
	cmp x_enemy2,152
	je labell1
	jmp exit1
	labell1:
	mov tempE12,0

	exit1:
	pop bx
	ret
printEnemy2 endp

	;function to print coin1
printCoin1 proc
	
	mov cx, x_coin1
	mov temp1,cx
	mov cx,y_coin1
	mov temp2,cx
	mov cx,10
	mov si,0
	alongRow:
		push cx
		mov cx,x_coin1
		mov temp1,cx
		mov cx,8
		alongCol:
			push cx
			mov ah,0ch
			mov al,coin[si]
			inc si
			mov cx,temp1
			mov dx,temp2
			int 10h
			inc temp1
			pop cx
		loop alongCol
	inc temp2
	pop cx
	loop alongRow
	
ret 
printCoin1 endp
	
		;function to print coin2
printCoin2 proc
	
	mov cx, x_coin2
	mov temp1,cx
	mov cx,y_coin2
	mov temp2,cx
	mov cx,10
	mov si,0
	alongRow:
		push cx
		mov cx,x_coin2
		mov temp1,cx
		mov cx,8
		alongCol:
			push cx
			mov ah,0ch
			mov al,coin[si]
			inc si
			mov cx,temp1
			mov dx,temp2
			int 10h
			inc temp1
			pop cx
		loop alongCol
	inc temp2
	pop cx
	loop alongRow
	
ret 
printCoin2 endp


		;function to print coin3
printCoin3 proc
	
	mov cx, x_coin3
	mov temp1,cx
	mov cx,y_coin3
	mov temp2,cx
	mov cx,10
	mov si,0
	alongRow:
		push cx
		mov cx,x_coin3
		mov temp1,cx
		mov cx,8
		alongCol:
			push cx
			mov ah,0ch
			mov al,coin[si]
			inc si
			mov cx,temp1
			mov dx,temp2
			int 10h
			inc temp1
			pop cx
		loop alongCol
	inc temp2
	pop cx
	loop alongRow

ret 
printCoin3 endp
	
	;function to print the kingdom using kingdomShape2 array
printKingdom proc uses ax bx cx dx si
	mov temp1,272	;starting point
	mov temp2,140
	mov cx,44	;outer loop count
	mov si,0
	
	alongRow:
		push cx
		mov temp1,272
		mov cx,48	;inner loop count
		alongColumn:
		
			push cx
			mov ah,0ch
			mov al,kingdomShape2[si]	;changing pixels one by one
			inc si
			mov cx,temp1
			mov dx,temp2
			int 10h
			inc temp1
			pop cx
			
		loop alongColumn
		
	inc temp2
	pop cx
	
	loop alongRow
ret 

printKingdom endp

	;function for checking enemy1 collision with mario from front
Enemy1CollisionFront proc uses bx
	mov bx,x_mario
	sub bx,17
	cmp bx,x_enemy1
	jne move12
	cmp y_mario,145
	jge collide1
	
	
	jmp move12
	collide1:	;when mario collides with enemy1
		dec life			;life will be decreased by one
		mov x_mario, 1		;mario will move to start
		mov y_mario,163	
		
		
		
	move12:
	
	ret
	
Enemy1CollisionFront endp
	;function for checking enemy1 collision with mario from back
Enemy1CollisionBack proc uses bx
	mov bx,x_enemy1
	sub bx,17
	cmp bx,x_mario
	jne move12
	cmp y_mario,145
	jge collide1
	jmp move12
	collide1:	;when mario collides with enemy1
		dec life		;life will be decreased by one
		mov x_mario, 1		;mario will move to start
		mov y_mario,163
		
		
		
	move12:
	
	ret
	
Enemy1CollisionBack endp

	;function for checking enemy2 collision with mario from front
Enemy2CollisionFront proc uses bx
	mov bx,x_mario
	sub bx,17
	cmp bx,x_enemy2
	jne move12
	cmp y_mario,145
	jge collide1
	
	jmp move12
	collide1:	;when mario collides with enemy2
		dec life	;life will be decreased by one
		mov x_mario, 1		;mario will move to start
		mov y_mario,163
		
		
		
	move12:
	
	ret
	
Enemy2CollisionFront endp

			;function for checking enemy2 collision with mario from back
Enemy2CollisionBack proc uses bx	
	mov bx,x_enemy2
	sub bx,17
	cmp bx,x_mario
	jne move12
	cmp y_mario,145
	jge collide1
	jmp move12
	collide1:	;when mario collides with enemy2
		dec life		;life will be decreased by one
		mov x_mario, 1	;mario will move to start
		mov y_mario,163
		
		
	move12:
	
	ret
	
Enemy2CollisionBack endp
	
		;function to move to next level when mario reaches at the end
IncreaseLevel proc
	inc level	;level will be increased
	mov x_mario,1	;mario will move to start
	mov y_mario,163
	mov flag1,0		;all coins will come back for next level
	mov flag2,0
	mov flag3,0

ret
IncreaseLevel endp
	
end main 

		; THE END :)
