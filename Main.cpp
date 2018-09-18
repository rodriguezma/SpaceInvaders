#pragma once
#include <esat/window.h>
#include <esat/input.h>
#include <esat/time.h>
#include <esat/math.h>
#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>

void GameLoop(void){	
	
}


int esat::main(int argc, char **argv) {
	
	double current_time,last_time; 		
	unsigned int fps=60;
	esat::WindowInit(800,600);
	esat::DrawSetStrokeColor(255,255,255);
	esat::DrawSetFillColor(255,255,255);
	esat::DrawSetTextSize(30);
	
	WindowSetMouseVisibility(true);
	
	while(esat::WindowIsOpened() && !esat::IsSpecialKeyDown(esat::kSpecialKey_Escape)) {
		last_time = esat::Time();
		esat::DrawBegin();
	    esat::DrawClear(0,0,0);
		
				
		GameLoop();
		
		esat::DrawEnd();
		do{
	   	 	current_time = esat::Time();
	    }while((current_time-last_time)<=1000.0/fps);
	    esat::WindowFrame();
	}
	sqlite3_close(db);
	return 0;
}