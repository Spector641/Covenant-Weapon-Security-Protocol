/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Core framework initialization. Adds a CBA player event handler to monitor weapon changes.
*/

if (!hasInterface) exitWith {}; // Exit if running on a headless client or dedicated server system

// Wait for the mission display and CBA settings layout to be fully ready
waitUntil { !isNull player && time > 0 };

// Add a CBA Event Handler that triggers every time the unit changes their current weapon
["weapon", {
    params ["_unit", "_weapon"];
    
    // Only check if it is the actual player drawing the weapon
    if (_unit == player) then {
        [_unit, _weapon] call CWSP_fnc_detectWeapon;
    };
}] call CBA_fnc_addPlayerEventHandler;
