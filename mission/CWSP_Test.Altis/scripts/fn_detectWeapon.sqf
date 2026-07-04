params ["_unit","_item"];

// Only Covenant weapons
if !(_item find "OPTRE_FC_" == 0) exitWith {};

// Only unauthorized users
if !([_unit] call CWSP_fnc_isAuthorized) exitWith {};

[_unit,_item] spawn CWSP_fnc_startFailsafe;
