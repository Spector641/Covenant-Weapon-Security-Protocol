/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Dynamically checks if the player's current weapon is listed in the CBA Blacklist setting string.
*/

params ["_unit", "_weapon"];

// Retrieve the dynamic string from the CBA options menu
private _blacklistString = cwsp_blacklist_weapons;

// Split the string by commas and trim any accidental whitespaces
private _blacklistArray = (_blacklistString splitString ",") apply { trim _x };

// If the grabbed weapon matches any entry in the dynamic blacklist
if (_weapon in _blacklistArray) then {
    // Trigger the failsafe handler using the dynamically configured timer setting
    [_unit, _weapon, cwsp_failsafe_timer] spawn CWSP_fnc_startFailsafe;
};
