/*
    File: fn_remoteActionFirePlane.sqf
    Author: Cheynne S. (extracted of her mod : SCmod)
    Modified & implemented in SQF by: Ak. Tunui RICHMOND

	Copyright (C) Tevaï THIBAUDET- All Rights Reserved
	Unauthorized copying of this file (without authorization
	), via any medium is strictly prohibited
	Proprietary and confidential
	Written by Tevaï THIBAUDET <tunui.richmond.dev@gmail.com>, Novemnber 2017

    Description:
    remote Action asked by server
*/

params [["_action",nil]];

/*diag_log format ["==========REMOTE ACTION FIRE========"];
{
  diag_log format ["%1",_x];
} forEach _this;*/

switch (_action) do {
	case "ecope" : {
		_this spawn {			
			private _plane = _this select 1;
			private ["_lifetime","_a1","_a1_l","_a1_r","_a2","_a3","_velX","_size","_size_x","_playerArround","_timeSleep","_dstGround","_dropArray"];
			_dropArray = [];
			_lifetime = 6;
			_a1 = 0.00;
			_a1_l = 14.50;
			_a1_r = -14.50;
			_a2 = 1.60;
			_a3 = 0.035;
			_velX = [0, -0.1, 0.5];
			_size = [21,9.0,3.0];
			_size_x = [9,1.0,0.5];

			if((speed _plane ) > 90) then {	
				addCamShake [0.8, 1.5, 1.1];
				_dropArray pushBack [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,4], "", "Billboard", 1, _lifetime, [_a1,_a2,_a3]	, _velX , .1, 0.275, 0.2, 0.1, _size, 	[[0.25, 0.35, 0.60, 0.25], [0.25, 0.35, 0.60, 0.16], [0.25, 0.35, 0.60, 0.08]], [0, 1], .01, 0.05, "", "", _plane];
				_dropArray pushBack [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,4], "", "Billboard", 1, _lifetime, [_a1_l,_a2,_a3]	, _velX , .1, 0.275, 0.2, 0.1, _size_x, [[0.25, 0.35, 0.60, 0.20], [0.25, 0.35, 0.60, 0.10], [0.25, 0.35, 0.60, 0.08]], [0, 1], .01, 0.05, "", "", _plane];
				_dropArray pushBack [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,4], "", "Billboard", 1, _lifetime, [_a1_r,_a2,_a3]	, _velX , .1, 0.275, 0.2, 0.1, _size_x, [[0.25, 0.35, 0.60, 0.20], [0.25, 0.35, 0.60, 0.10], [0.25, 0.35, 0.60, 0.08]], [0, 1], .01, 0.05, "", "", _plane];
			};
			if((speed _plane ) > 35) then {
				_dropArray pushBack [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,4], "", "Billboard", 1, _lifetime, [_a1,_a2,_a3]	, _velX , .1, 0.275, 0.2, 0.1, _size, 	[[0.25, 0.35, 0.60, 0.18], [0.25, 0.35, 0.60, 0.10], [0.25, 0.35, 0.60, 0.08]], [0, 1], .01, 0.05, "", "", _plane];
				_dropArray pushBack [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,4], "", "Billboard", 1, _lifetime, [_a1_l,_a2,_a3]	, _velX , .1, 0.275, 0.2, 0.1, _size_x, [[0.25, 0.35, 0.60, 0.15], [0.25, 0.35, 0.60, 0.10], [0.25, 0.35, 0.60, 0.08]], [0, 1], .01, 0.05, "", "", _plane];
				_dropArray pushBack [["\a3\data_f\ParticleEffects\Universal\Universal.p3d",16,12,4], "", "Billboard", 1, _lifetime, [_a1_r,_a2,_a3]	, _velX , .1, 0.275, 0.2, 0.1, _size_x, [[0.25, 0.35, 0.60, 0.15], [0.25, 0.35, 0.60, 0.10], [0.25, 0.35, 0.60, 0.08]], [0, 1], .01, 0.05, "", "", _plane];
			};
			enableCamShake true; 

			if ((_plane distance player) < 30) then {					
				private _pSpeed = speed _plane;
				private _vibe = (_pSpeed*5)/100;
				if(_pSpeed < 100) then {addCamShake [_vibe, 5, 20 - (_vibe * 4)]} else {addCamShake [5, 5, 20]};	
			};

			for "_i" from 0 to 40 do {			
				{drop _x} forEach _dropArray;
				sleep 0.05;			
			};
		};	
	};
	case "say3D" : {(_this select 1) say3D (_this select 2)};
	case "particle" : {
		_source01 = _this select 1;	
		_randomSource = ["ObjectDestructionFire1Smallx","ObjectDestructionFire2Smallx"] call BIS_fnc_selectRandom;
		_source01 setParticleClass _randomSource;
		_source01 setParticleCircle [2 + random [1, 4, 7],[0.1,0.1,1.4]];
		_source01 setParticleRandom [random [2, 3, 5], [0, 0, 0], [0, 0, 0], 0, random [0.5, 1.25, 2], [0.8, 0, 0, 0.8], 0, 0];
		_source01 setParticleFire [0.1,3,1];

		_source02 = _this select 2;
		_source02 setParticleClass "SCBigDestructionSmoke";

/*		_source03 = _this select 3;
		_source03 setParticleClass "FireSparks";
		_source03 setParticleCircle [10.8 + random 0.4,[0,0,1]];
		_source03 setDropInterval 1;*/

		_li = _this select 4;	
		_li lightAttachObject [_this select 5, [0,0,0]];
		_li setLightBrightness 8;
		_li setLightAmbient[1,0.5,0];
		_li setLightColor[1, 0.5, 0];
		_li setLightAttenuation [4,4,4,8];
		_li setLightDayLight true;
	};
	case "steam" : {
		_steamSource = _this select 1;
		_steamSource setParticleCircle [6, [0, 0, 0]];
		_steamSource setParticleRandom [1, [2, 2, -10], [0.175, 0.175, 0], 0.25, 0.25, [0, 0, 0, 0], 1, 0.25];
		_steamSource setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, -8], [0, 0, 0.75], 0, 10.25, 8.5, 0.075, [2, 3, 4], [[0.92, 0.8, 0.7, 0.065], [0.82, 0.8, 0.8, 0.06], [0.8, 0.8, 0.8, 0.015]], [0.08], 1, 0.25, "", "", _this select 2];
		_steamSource setDropInterval 0.05;
	};
	default {  /*...code...*/ }; 
};

/*		_source03 = _this select 3;
		_source03 setParticleCircle [0, [0, 0, 0]];
		_source03 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_source03 setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 15, [0, 0, 0], [0, 0, 0], 50, 10, 10, 0.1, [30, 10], [[0.7, 0.2, 0, 0.1], [0, 0, 0, 0.2], [0.5, 0.5, 0.5, 0]], [0], 1, 2, "", "", _this select 5];
		_source03 setDropInterval 1;*/