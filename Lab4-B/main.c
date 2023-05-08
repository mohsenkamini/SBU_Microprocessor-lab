#include "stm32f4xx_hal.h"
#include <stdio.h>

int binToDec (int p0, int p1,int p2,int p3 ) {
	int result=0;
	result+= p0;
	result+= (p1*2);
	result+= (p2*4);
	result+= (p3*8);
	return result;
}

void fillArray(int outArray[],int a0,int a1,int a2,int a3,int a4,int a5,int a6 )
{
				outArray[0]= a0;
				outArray[1]= a1; 
				outArray[2]= a2;
				outArray[3]= a3;
				outArray[4]= a4;
				outArray[5]= a5;
				outArray[6]= a6;
}

void set7Segment(GPIO_TypeDef *GPIOx, int outArray[]) {
	
	if (outArray[0])
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_4,GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_4,GPIO_PIN_RESET);
	
	if (outArray[1])
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_5,GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_5,GPIO_PIN_RESET);
	
	if (outArray[2])
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_6,GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_6,GPIO_PIN_RESET);
	
	if (outArray[3])
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_7,GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_7,GPIO_PIN_RESET);
	
	if (outArray[4])
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_8,GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_8,GPIO_PIN_RESET);
	
	if (outArray[5])
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_9,GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_9,GPIO_PIN_RESET);
	
	if (outArray[6])
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_10,GPIO_PIN_SET);
	else
		HAL_GPIO_WritePin(GPIOx,GPIO_PIN_10,GPIO_PIN_RESET);
	
}

int nth_fibo(int n)
{
  int t1 = 0, t2 = 1, nextTerm = 0, i;
  if(n == 0 || n == 1) 
    return n; 
  else
    nextTerm = t1 + t2;
  for (i = 2; i <= n; ++i)
  {
    t1 = t2;
    t2 = nextTerm;
    nextTerm = t1 + t2;
  }

  return t2;
}

void setArray (int outArray[],int x) {
	switch (x) {
			case 0:		
				fillArray(outArray, 1,1,1,1,1,1,0);
				break;
			case 1:		
				fillArray(outArray, 0,1,1,0,0,0,0);
				break;
			case 2:		
				fillArray(outArray, 1,1,0,1,1,0,1);
				break;
			case 3:		
				fillArray(outArray, 1,1,1,1,0,0,1);
				break;
			case 4:		
				fillArray(outArray, 0,1,1,0,0,1,1);
				break;
			case 5:		
				fillArray(outArray, 1,0,1,1,0,1,1);
				break;
			case 6:		
				fillArray(outArray, 1,0,1,1,1,1,1);
				break;
			case 7:		
				fillArray(outArray, 1,1,1,0,0,0,0);
				break;
			case 8:		
				fillArray(outArray, 1,1,1,1,1,1,1);
				break;
			case 9:		
				fillArray(outArray, 1,1,1,1,0,1,1);
				break;
			default: 	
				break;
		}
}

void delay(int x) {
	for (int i=0 ; i < x; i++);
}

int main (void) {
	
	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();
	
	GPIO_InitTypeDef PinConfig;
	
	PinConfig.Pin = GPIO_PIN_0;
	PinConfig.Mode = GPIO_MODE_INPUT;
	PinConfig.Pull = GPIO_PULLUP;
	PinConfig.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	
	PinConfig.Pull = GPIO_PULLDOWN;
	HAL_GPIO_Init(GPIOB, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_1;
	PinConfig.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_2;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_3;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	
		
		
		
	PinConfig.Pin = GPIO_PIN_4;
	PinConfig.Mode = GPIO_MODE_OUTPUT_PP;
	PinConfig.Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	HAL_GPIO_Init(GPIOB, &PinConfig);
	HAL_GPIO_Init(GPIOC, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_5;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	HAL_GPIO_Init(GPIOB, &PinConfig);
	HAL_GPIO_Init(GPIOC, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_6;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	HAL_GPIO_Init(GPIOB, &PinConfig);
	HAL_GPIO_Init(GPIOC, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_7;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	HAL_GPIO_Init(GPIOB, &PinConfig);
	HAL_GPIO_Init(GPIOC, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_8;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	HAL_GPIO_Init(GPIOB, &PinConfig);
	HAL_GPIO_Init(GPIOC, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_9;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	HAL_GPIO_Init(GPIOB, &PinConfig);
	HAL_GPIO_Init(GPIOC, &PinConfig);
	
	PinConfig.Pin = GPIO_PIN_10;
	HAL_GPIO_Init(GPIOA, &PinConfig);
	HAL_GPIO_Init(GPIOB, &PinConfig);
	HAL_GPIO_Init(GPIOC, &PinConfig);

	
		
	int counter=0;
	int edgeFlag = 0;
		
	int  outArrayA[7] = {0,0,0,0,0,0,1};
	int  outArrayB[7] = {1,1,1,1,1,1,0};
	int  outArrayC[7] = {1,1,1,1,1,1,0};
		
	while (1)
	{
		
		int x = binToDec(HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_0),HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_1),HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_2),HAL_GPIO_ReadPin(GPIOA,GPIO_PIN_3));
		setArray(outArrayA,x);
		set7Segment (GPIOA,outArrayA);
		/*
		if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_0) == GPIO_PIN_RESET )
		{
			delay();
			if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_0) == GPIO_PIN_SET )
				counter++;
		}
		*/
		
		if (HAL_GPIO_ReadPin(GPIOB,GPIO_PIN_0) == GPIO_PIN_SET)
		{
			if (!edgeFlag)
				counter++;
			//delay(250000);
			edgeFlag=1;
		}
		else
			edgeFlag=0;
		
		int n = nth_fibo(counter);
		
		if (n >= 100)
		{
			counter=0;
			n =0;
		}
		
		setArray(outArrayC,(n%10));
		setArray(outArrayB,((n%100)/10));
		set7Segment (GPIOB,outArrayB);
		set7Segment (GPIOC,outArrayC);
		
	}
	
	return 0;
}
