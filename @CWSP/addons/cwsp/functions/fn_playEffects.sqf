/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Dynamically creates explosion effects based on the severity chosen in the CBA settings menu.
*/

params ["_unit", "_weapon"];

// Forcefully strip the weapon from the unauthorized user
_unit removeWeapon _weapon;

private _explosionClass = "Bo_GBU12_LGB"; // Default fallback (Medium)
private _severity = if (isNil "cwsp_explosion_severity") then { 1 } else { cwsp_explosion_severity };

switch (_severity) do {
    case 0: { _explosionClass = "GrenadeHand"; };          // Light severity
    case 1: { _explosionClass = "Bo_GBU12_LGB"; };         // Medium severity (Original)
    case 2: { _explosionClass = "M_Modules_ExplodeBig"; }; // Heavy severity
};

// Spawn the chosen explosion directly at the player's vector coordinates
private _pos = getPosATL _unit;
_explosionClass createVehicle _pos;
