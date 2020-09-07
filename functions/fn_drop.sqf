/*
    File: fn_drop.sqf
    Author: Cheynne S. (extracted of her mod : SCmod)
    Modified & implemented in SQF by: Ak. Tunui RICHMOND

	Copyright (C) Tevaï THIBAUDET- All Rights Reserved
	Unauthorized copying of this file (without authorization
	), via any medium is strictly prohibited
	Proprietary and confidential
	Written by Tevaï THIBAUDET <tunui.richmond.dev@gmail.com>, Novemnber 2017

    Description:
    Drop water animation when the player "fired"
*/

params [["_veh",nil]];
if(isNil "_veh") exitWith {diag_log "ERROR DORPS _veh Nil"};

		    diag_log "Shot3";
if((_veh distance player) > 3000) exitWith {};
private _getOut = false;
if!(isNil "PROC_DROP") then {
	if(!isNull PROC_DROP) exitWith {_getOut=true};
};
if(_getOut) exitWith {};

		    diag_log "Shot4";
PROC_DROP = [_veh] spawn {
	params [["_veh",nil]];
	private["_color","_colorW","_weaponClass","_count","_countX","_vel","_pos"];
	private["_Move","_Shape","_ShapeW","_Size","_PSPos","_Anim","_Rot","_Wght","_Vol","_Rubb","_array","_playerArround","_dropArray"];

	_dropArray = [];
	_weaponClass = currentWeapon _veh;
	_count = _veh ammo _weaponClass;
	_countX = count (magazinesAmmoFull _veh);

	if(_count > 0) then {
		_vel = velocityModelSpace _veh; 
		_pos = getPosATL _veh;
		_veh setVelocityModelSpace [(_vel select 0), (_vel select 1), (_vel select 2)+5];
		_veh setPosATL [(_pos select 0), (_pos select 1), (_pos select 2)+0.05];
	};

	if((_weaponClass == "water9000") || (_weaponClass == "water10000") || (_weaponClass == "water7000")) then {
		if(_count == 0) then {
			_color = [[(0.45 + random 0.12), (0.50 + random 0.12), (0.85 + random 0.12), 0.00], [0.48, 0.52, 0.52, 0.00], [0.42, 0.5, 0.5, 0.00]];
			_colorW = [[(0.10 + random 0.05), (0.15 + random 0.05), (0.75 + random 0.05), 0.01], [0.10, 0.15, 0.75, 0.01], [0.10, 0.15, 0.85, 0.01]];	
		};
		if(_count < 50 && _countX == 1)  then {
			_color = [[(0.43 + random 0.12), (0.48 + random 0.12), (0.85 + random 0.12), (0.001 + (_count/145))], [0.48, 0.52, 0.52, 0.01], [0.42, 0.5, 0.5, 0.00]];
			_colorW = [[(0.10 + random 0.05), (0.15 + random 0.05), (0.75 + random 0.05), 0.02], [0.10, 0.15, 0.75, 0.01], [0.10, 0.15, 0.85, 0.01]];	
		};
		if(_count >= 50 && _countX >= 1) then {
			_color = [[(0.45 + random 0.12), (0.50 + random 0.12), (0.85 + random 0.12), 0.35], [0.48, 0.52, 0.52, 0.01], [0.42, 0.5, 0.5, 0.00]];
			_colorW = [[(0.10 + random 0.05), (0.15 + random 0.05), (0.75 + random 0.05), 0.03], [0.10, 0.15, 0.75, 0.02], [0.10, 0.15, 0.85, 0.01]];
		}; 
		if((_count < 50 && _countX == 2)) then {
			_color = [[(0.45 + random 0.12), (0.50 + random 0.12), (0.85 + random 0.12), 0.35], [0.48, 0.52, 0.52, 0.01], [0.42, 0.5, 0.5, 0.00]];
			_colorW = [[(0.10 + random 0.05), (0.15 + random 0.05), (0.75 + random 0.05), 0.03], [0.10, 0.15, 0.75, 0.02], [0.10, 0.15, 0.85, 0.01]];
		};
		_Move = [0.0,0.0,-20.0];
		_Shape = ["\A3\data_f\ParticleEffects\Universal\smoke.p3d",1,0,1];
		_ShapeW = ["\A3\data_f\cl_water",1,0,1,1];
		_Obj = _veh;
		_Size = [(4.2 + random 0.3), (52 + random 2), (60 + random 2)];
		_PSPos = [0.00, -0.50, 0.75];
		_Anim = [1.5, 0.9, 0.4];
		_Rot = (3 + random 2);
		_Wght = 100;
		_Vol = 0.1;
		_Rubb = 5;

		_dropArray pushBack [_Shape,  "", "Billboard", 1, 10, _PSPos, _Move, _Rot, _Wght, _Vol, _Rubb, _Size, _color, _Anim, 0.5, 0.5, "", "", _Obj, 45, true, 0.1, [[0.4,0.5,0.9,0.3]]];
		_dropArray pushBack [_ShapeW, "", "Billboard", 1, 6, _PSPos, _Move, _Rot, _Wght, _Vol, _Rubb, _Size, _colorW, _Anim, 0.5, 0.5, "", "", _Obj, 85, true, 0.1, [[0.4,0.5,0.9,0.3]]];
		_dropArray pushBack [_ShapeW, "", "Billboard", 1, 6, _PSPos, _Move, _Rot, _Wght, _Vol, _Rubb, _Size, _colorW, _Anim, 0.5, 0.5, "", "", _Obj, 95, true, 0.1, [[0.4,0.5,0.9,0.3]]];
		sleep 0.1;

		if((_veh distance player) < 50) then {addCamShake [1, 1, 1.5]};
		if!((count _dropArray) isEqualTo 3) exitWith {};
		for "_i" from 0 to 50 do {
			{drop _x} forEach _dropArray ;
			sleep 0.02;		
		}; 

		_array = [getpos _veh select 0, getpos _veh select 1, 0] nearObjects ["Fire_Modul", 20];
		{_x setdammage ((getdammage _x) + 1.0)} forEach _array;

	};
};