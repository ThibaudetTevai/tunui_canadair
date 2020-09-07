/*
    File: fn_initPilotClient.sqf
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
params[["_plane",objNull,[objNull]]];
if(isNull _plane) exitWith {diag_log "fn_initPilotClient Object Null"};
if(isNil "FLAG_DROP") then {FLAG_DROP = false};	

_plane addEventHandler ["Fired", {
		{
			if(FLAG_DROP) exitWith {};
			[] spawn {FLAG_DROP = true;sleep 1;FLAG_DROP = false};
		    if(((position player) distance (position _x)) < 3000) then {
		    	diag_log "Shot2";
		        [_this select 0] remoteExec ["tc_fnc_drop",_x];
		    };
		    diag_log "Shot1";
		}foreach playableUnits;
	}];

_plane addWeaponGlobal "Water7000";	
if (player in _plane) then {player action ["MANUALFIRE", _plane];};

_this spawn {
	private _plane = _this select 0;
	while {alive _plane} do {
		_plane = assignedVehicle player;
		private _isWater = surfaceIsWater position _plane;	
		private _count = _plane ammo "water7000";
		if(_isWater && ((getpos _plane select 2) < 1)) then {
			if(_count < 100) then {
				_plane setAmmo [currentWeapon _plane, (_count + 1)];
			};
			_vel = velocityModelSpace _plane;
			if(((_vel select 0) >= 0)) then {
				_plane setVelocityModelSpace [(_vel select 0), (_vel select 1)-((_vel select 1)*0.01), (_vel select 2)];
			};
		};
		if(_isWater && _count >= 100) then {
			_count =0;
			_plane removeMagazineGlobal "Water9000Mag";
			_plane addMagazineGlobal "Water9000Mag";
		};
		sleep 0.1;
	};	
};