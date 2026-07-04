params ["_unit","_item"];

// Is it a supported Covenant weapon?
if !(_item in CWSP_CovenantWeapons) exitWith {};

// Is the player authorized?
if !([_unit] call CWSP_fnc_isAuthorized) exitWith {};

[_unit,_item] spawn CWSP_fnc_startFailsafe;
