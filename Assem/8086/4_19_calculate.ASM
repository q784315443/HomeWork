
DATA SEGMENT                         ;�������ݶ�
	X DB 26H		     	;���� XΪ�ֽ����ͣ���ʼֵΪ26H
	Y DB 54H		     	;���� YΪ�ֽ����ͣ���ʼֵΪ54H
	Z DW ?			     	;���� ZΪ�ֽ����ͣ�������������
DATA ENDS			     ;���ݶν���

CODE SEGMENT			     ;��������
	ASSUME CS:CODE, DS: DATA     	;������μĴ�����������
	
START:				     
	MOV AX , DATA		     
	MOV DS, AX		     ;�������ݶ�
	MOV AH, 00H		     
	MOV AL, X		     ;��X��AX    		   AX = 0026
	MOV BX, AX		     ;AX��ֵ����BX		   BX = 0026		
	SHL AX, 1		     ;AX����һλ,�൱��2X   	   AX = 004C 
	SHL AX, 1		     ;AX����һλ,�൱��4X	   AX = 0098
	ADD BX ,AX		     ;AX��BX,�൱��5X,������BX��   BX = 00BE		   
	MOV AH ,00h		     
	MOV AL, Y		     ;��Y��AX			   AX = 0054
	MOV CX, AX		     ;AX��ֵ����CX                 CX = 0054
	SHL AX, 1		     ;AX����һλ,(2Y)    	   AX = 00AB
	SHL AX ,1		     ;AX������һλ,(4Y)  	   AX = 0150
	SHL AX ,1		     ;AX������һλ��(8Y)	   AX = 02A0
	SUB AX, CX		     ;AX-CX��������AX��(7Y)        AX = 024C
	ADD AX, BX		     ;5X+7Y������AX		   AX = 030A              
	SHR AX, 1		     ;AX����һλ(5X+7Y)/2          AX = 0185
	MOV Z, AX	             ;Z������			   Z = 0185
	MOV AH, 4CH
	INT 21H
CODE ENDS
END START
HLT