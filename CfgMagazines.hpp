class CfgMagazines {
	class VehicleMagazine;	// External class reference
	
	class Laserbatteries : VehicleMagazine {};
	
	class water9000Mag : Laserbatteries {
		ammo = "water9000";
		count = 100;
		displayName = 9000L_MAG;
		initSpeed = 10000;
		autoFire = "true";
	};
};
