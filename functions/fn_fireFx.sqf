/*
    File: fn_fireFx.sqf
    Author: Cheynne S. (extracted of her mod : SCmod)
    Modified & implemented in SQF by: Ak. Tunui RICHMOND

	Copyright (C) TevaÃ¯ THIBAUDET- All Rights Reserved
	Unauthorized copying of this file (without authorization
	), via any medium is strictly prohibited
	Proprietary and confidential
	Written by TevaÃ¯ THIBAUDET <tunui.richmond.dev@gmail.com>, Novemnber 2017

    Description:
    Drop water animation when the player "fired"
*/

[] spawn {
	private["_firenear","_countF","_firelist","_clearView","_sleepTime","_distanceX"];
	_fogX = fogParams;
	_effprox = ppEffectCreate ["ColorCorrections", 1000];
	_clearView = true;
	_sleepTime = 1 ;

	while {true} do {
	 	_firelist = player nearObjects ["Fire_Modul", 2000];
		_countF = count _firelist;
		if(_countF > 0) then {
			_firenear = _firelist select 0;
			_distanceX = player distance _firenear;
			_sleepTime = (((_distanceX-300)*0.0011)+0.02);
			if((_sleepTime >= 2.0) || (_distanceX >= 2000)) then {_sleepTime = 2.0;};
			if((_sleepTime <= 0.02) || (_distanceX <= 500)) then {_sleepTime = 0.02;};
			_firelist = player nearObjects ["Fire_Modul", 300];
			_countF = count _firelist;

			if(_countF <= 0 && (_clearView) ) then {
				"ColorCorrections" ppEffectCommit 3;
				"ColorCorrections" ppEffectEnable true;
				"ColorCorrections" ppEffectAdjust [1.00,1.00,0.00,[0.00,0.00,0.00,0.00],[1.00,1.00,1.00,1.00],[0.50,0.25,0.25,1.00]];
				//3.01 setFog [_fogX select 0, _fogX select 1, _fogX select 2];
				sleep 3;
				"ColorCorrections" ppEffectEnable false;
				_clearView = false;
			};

			if(_countF > 0 && _distanceX <= 300) then {
				_sleepTime = 0.02;
				_clearView = true;
				_timeChange = _distanceX / 100 ;

				if(!(isNull _firenear)) then {
					_coeffD = _distanceX;
					_kA = 0.90 + (_coeffD/3000);
					_kB = -0.10 + (_coeffD/3000);

					_kC = 0.05 - (_coeffD/6000);
					_kD = 0.45 - (_coeffD*0.0015);
					_kE = 0.75 - (_coeffD*0.0025);

					//_kF = -0.50 + (_coeffD/600);
					_kG = 2.50 - (_coeffD*0.005);
					_kH = 1.70 - (_coeffD*0.00233);
					_kI = 0.60 + (_coeffD*0.00133);
					_kJ = 0.30 + (_coeffD*0.00233);

					_kK = 0.20 + (_coeffD*0.001);
					_kL = 0.30 - (_coeffD*0.00016);
					_kM = 0.20 + (_coeffD*0.00016);

					_fogV = 1 - (_coeffD*0.00165);
					_fogD = 0.01 - (_coeffD*0.000033);
					_fogB = 150 - (_coeffD/2);

					"ColorCorrections" ppEffectCommit _timeChange;
					"ColorCorrections" ppEffectEnable true;
					"ColorCorrections" ppEffectAdjust [1.00,_kA,_kB,[_kC,_kD,_kE,0.00],[_kG,_kH,_kI,_kJ],[_kK,_kL,_kM,1.00]];
					//0.75 setFog [_fogV, _fogD, _fogB];
				};
			};
		}else {_sleepTime = 2;};
	sleep _sleepTime;	
	};
};