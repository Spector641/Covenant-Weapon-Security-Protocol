/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Core framework initialization. Automatically executes via postInit to monitor weapon states.
*/

if (!hasInterface) exitWith {};

// Enforce guard check until player object is initialized in the world space
waitUntil { !isNull player && time > 0 };

// Register global monitoring event handler layout via CBA
["weapon", {
    params ["_unit", "_weapon"];
    
    if (_unit == player) then {
        [_unit, _weapon] call CWSP_fnc_detectWeapon;
    };
}] call CBA_fnc_addPlayerEventHandler;
