
struct PlayerShip{
	ESAT::Vec2 position;
	int vSize;
	int hSize;
	int lifepoints;
	int speed;
};

void InitShip(PlayerShip *ship, int xPos, int yPos){
	ship->position.x = xPos;
	ship->position.y = yPos;
	ship->vSize = 50;
	ship->hSize = 50;
	ship->lifepoints = 3;
	ship->speed = 2;
}

void MovePlayerShip(PlayerShip *ship, int right_limit, int left_limit){
	if(esat::IsSpecialKeyPressed(esat::kSpecialKey_Right) && (ship->position.x < right_limit)){
		ship->position.x += ship->speed;
	}else if(esat::IsSpecialKeyPressed(esat::kSpecialKey_Left) && (ship->position.x > left_limit)){
		ship->position.x -= ship->speed;
	}
}

