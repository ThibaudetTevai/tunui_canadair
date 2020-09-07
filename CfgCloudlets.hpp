class CfgCloudlets {
	class MediumDestructionSmoke;	// External class reference
	
	class SCBigDestructionSmoke : MediumDestructionSmoke {
		interval = 0.09;
		circleRadius = 0;
		circleVelocity[] = {0, 0, 0};
		particleShape = "\A3\data_f\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 7;
		particleFSFrameCount = 48;
		particleFSLoop = 1;
		angleVar = 1;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 1;
		lifeTime = 100;
		moveVelocity[] = {0, 2.5, 0};
		rotationVelocity = 0.8;
		weight = 0.05;
		volume = 0.04;
		rubbing = 0.05;
		size[] = {5, 55};
		sizeCoef = 1;
		color[] = {{0.6, 0.6, 0.6, 0.01}, {0.7, 0.7, 0.7, 0.06}, {0.8, 0.8, 0.8, 0.02}, {1, 1, 1, 0.005}};
		colorCoef[] = {3, 3, 3, 3.2};
		animationSpeed[] = {1, 0.55, 0.35};
		animationSpeedCoef = 1;
		randomDirectionPeriod = 0.15;
		randomDirectionIntensity = 0.15;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 12;
		position[] = {0, 0, 0};
		positionVar[] = {0.15, 0.15, 0.15};
		MoveVelocityVar[] = {0.25, 0.5, 0.25};
		rotationVelocityVar = 0.5;
		sizeVar = 0.1;
		colorVar[] = {0, 0, 0, 0.06};
		randomDirectionPeriodVar = 0.1;
		randomDirectionIntensityVar = 0.05;
	};
};
