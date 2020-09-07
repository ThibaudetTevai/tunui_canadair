class CfgAmmo {
	class LaserBombCore;	// External class reference
	
	class water9000 : LaserBombCore {
		hit = 1;
		displayName = WATER;
		indirectHit = 0;
		indirectHitRange = 1;
		visibleFire = 0;	// how much is visible when this weapon is fired
		audibleFire = 0;
		visibleFireTime = 0;	// how long is it visible
		explosive = "false";
		cost = 30;
		airLock = "false";
	};
};
