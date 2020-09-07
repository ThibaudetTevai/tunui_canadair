class CfgWeapons {
	class Laserdesignator;	// External class reference
	
	class water9000 : Laserdesignator {
		displayName = "Universal waterkit";
		sounds[] = {};
		scope = public;
		burst = 2;
		reloadTime = 1e-009;
		autoFire = "true";
		magazines[] = {"water9000Mag"};
		minRange = 1;
		minRangeProbab = 0.95;
		midRange = 500;
		midRangeProbab = 0.75;
		maxRange = 850;
		maxRangeProbab = 0.1;
		maxLeadSpeed = 10000;	// max estimated speed km/h
	};
	
	class water7000 : water9000 {
		displayName = "Large waterkit";
		sounds[] = {};
		scope = public;
		burst = 3;
		reloadTime = 1e-009;
		autoFire = "true";
		magazines[] = {"water9000Mag"};
		minRange = 1;
		minRangeProbab = 0.95;
		midRange = 500;
		midRangeProbab = 0.75;
		maxRange = 850;
		maxRangeProbab = 0.1;
		maxLeadSpeed = 10000;	// max estimated speed km/h
	};
};
