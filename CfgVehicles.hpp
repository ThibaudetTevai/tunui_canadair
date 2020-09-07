class CfgVehicles {
	class Logic;	// External class reference
	
	class Module_F : Logic {
		class ArgumentsBaseUnits {
			class Units;	// External class reference
		};
		
		class ModuleDescription {
			class AnyBrain;	// External class reference
		};
	};

	class Land_MetalBarrel_empty_F;	// External class reference
		
	class Fire_Modul : Land_MetalBarrel_empty_F {
		model = "\tunui_canadair\data\TFfire.p3d";
		scope = public;
		Icon = "\tunui_canadair\data\TFfire.paa";
		coefInside = 2;
		coefInsideHeur = 4.3;
		vehicleClass = "TFS";
		displayName = "Fire Start";
		soundEngine[] = {};
		soundEnviron[] = {};
		mapSize = 0.3;
		side = "TEnemy";
		accuracy = 1;	// accuracy needed to recognize type of this target
		animated = "false";	// true = model is animated and cannot be assumed static
		Audible = 100;	// audible - bigger - better heard
		irtarget = "true";
		lasertarget = "true";
		armor = 9000;
		transportAmmo = 0;
		transportRepair = 0;
		transportFuel = 0;
		cost = 150000;
		
		// threat (VSoft, VArmor, VAir), how threatening vehicle is to unit types
		threat[] = {1, 1, 1};

		
		class DestructionEffects {};
		
		class eventhandlers {
			init = "_this execVM ""\tunui_canadair\functions\fn_initFire.sqf""";
		};
	};

	class Amphi_Modul : Module_F {
		scope = public;
		displayName = "Reservoir pour CL-415";
		icon = "\tunui_canadair\data\iconmodule_ca.paa";
		category = "TFmodModule";
		function = "tc_fnc_initAmphi";
		functionPriority = 1;
		isGlobal = 1;
		isPersistent = 1;
		isTriggerActivated = 1;
		isDisposable = 0;
		curatorInfoType = "RscDisplayAttributeBelly";
		
		class Arguments : ArgumentsBaseUnits {
			class Units : Units {};
		};
		
		class ModuleDescription : ModuleDescription {
			description = "Belly mounted water tank for amphibian";
			sync[] = {};
		};
	};

	class C_Rubberboat;	// External class reference
	//Author by Cheynne ( original author of mod SCmod)
	class SCmod_float : C_Rubberboat {
		scope = protected;
		animated = false;
		vehicleClass = "training";
		irTarget = false;
		mapSize = 1;
		model = "\tunui_canadair\data\TFmod_float.p3d";
		icon = "";
		displayName = "SCmod_floatX";
		accuracy = 0.1;	// accuracy needed to recognize type of this target
		camouflage = 0.1;	// how dificult to spot - bigger - better spotable
		transportAmmo = 0;
		transportRepair = 0;
		transportFuel = 0;
		destrType = "DestructTent";
		coefInside = 0.5;
		coefInsideHeur = 0.8;
		cost = 0;
		armor = 5000;
		memoryPointsLeftWaterEffect = "waterEffectR";
		memoryPointsRightWaterEffect = "waterEffectL";
		memoryPointsLeftEngineEffect = "EngineEffectL";
		memoryPointsRightEngineEffect = "EngineEffectR";
		waterEffectSpeed = 5;
		engineEffectSpeed = 5;
		waterFastEffectSpeed = 28;
		leftEngineEffect = "LEngEffectsSmall";
		rightEngineEffect = "REngEffectsSmall";
		leftFastWaterEffect = "LFastWaterEffects";
		rightFastWaterEffect = "RFastWaterEffects";
		
		class Turrets {};
	};
	//Author by Cheynne ( original author of mod SCmod)
	class SCmod_floatX : SCmod_float {
		model = "\tunui_canadair\data\TFmod_float.p3d";
		memoryPointsLeftWaterEffect = "waterEffectR";
		memoryPointsRightWaterEffect = "waterEffectL";
		memoryPointsLeftEngineEffect = "EngineEffectL";
		memoryPointsRightEngineEffect = "EngineEffectR";
		waterEffectSpeed = 5;
		engineEffectSpeed = 5;
		waterFastEffectSpeed = 28;
		leftEngineEffect = "LEngEffectsSmall";
		rightEngineEffect = "REngEffectsSmall";
		leftFastWaterEffect = "LFastWaterEffects";
		rightFastWaterEffect = "RFastWaterEffects";
		
		class Turrets {};
	};	
	//Author by Cheynne ( original author of mod SCmod)
	class SCmod_floatY : SCmod_floatX {
		model = "\tunui_canadair\data\TFmod_float_2.p3d";
		memoryPointsLeftWaterEffect = "waterEffectR";
		memoryPointsRightWaterEffect = "waterEffectL";
		memoryPointsLeftEngineEffect = "EngineEffectL";
		memoryPointsRightEngineEffect = "EngineEffectR";
		waterEffectSpeed = 5;
		engineEffectSpeed = 5;
		waterFastEffectSpeed = 28;
		leftEngineEffect = "LEngEffectsSmall";
		rightEngineEffect = "REngEffectsSmall";
		leftFastWaterEffect = "LFastWaterEffects";
		rightFastWaterEffect = "RFastWaterEffects";
		
		class Turrets {};
	};

	// class NonStrategic;	// External class reference
	// class HeliH : NonStrategic {};
	// class burned_grd : HeliH {
	// 	_generalMacro = "Helipad_base_F";
	// 	mapSize = 11.92;
	// 	scope = protected;
	// 	scopeCurator = 1;
	// 	displayName = "burned_grd";
	// 	model = "\tunui_canadair\data\burned_grd.p3d";
	// 	icon = "iconObject_circle";
	// 	vehicleClass = "TFmod";
	// 	destrType = "DestructNo";
	// 	accuracy = 0.2;	// accuracy needed to recognize type of this target
	// 	animated = false;
	// 	cost = 0;
	// };

	class SCmod_CL415;
	class TFmod_CL415 : SCmod_CL415 {
		faction = "TFmod";
		function = "";
		class eventhandlers {
			init = "_this execVM ""\tunui_core_server\Functions\Canadair\fn_initAmphi.sqf""";
		};
	};

	class SCmod_CL415_SC90;
	class TFmod_CL415_SC90 : SCmod_CL415_SC90 {
		faction = "TFmod";
		function = "";
		class eventhandlers {
			init = "_this execVM ""\tunui_core_server\Functions\Canadair\fn_initAmphi.sqf""";
		};
	};
};