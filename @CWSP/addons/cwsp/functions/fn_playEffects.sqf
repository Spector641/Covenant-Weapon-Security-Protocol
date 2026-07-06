/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Handles specific weapon overrides (Covenant lore explosions) and falls back to dynamic CBA severity choices.
*/

params ["_unit", "_weapon"];

// Forcefully strip the weapon from the unauthorized user
_unit removeWeapon _weapon;

private _pos = getPosATL _unit;
private _explosionClass = "";

// --- LAYER 1: COVENANT WEAPON SPECIFIC OVERRIDES ---
private _currentPreset = if (isNil "cwsp_weapon_preset") then { 0 } else { cwsp_weapon_preset };

if (_currentPreset == 0) then {
    switch (_weapon) do {
        case "OPTRE_FC_Needler": {
            _explosionClass = "M_PinkNeeds_AmmoClass"; 
        };
        case "OPTRE_FC_T33_FuelRod_Cannon": {
            _explosionClass = "M_FuelRod_Plasma_AmmoClass"; 
        };
    };
};

// --- LAYER 2: DYNAMIC CBA SEVERITY FALLBACK ---
if (_explosionClass == "") then {
    private _severity = if (isNil "cwsp_explosion_severity") then { 1 } else { cwsp_explosion_severity };
    
    switch (_severity) do {
        case 0: { _explosionClass = "M_PG_AT"; };            // Light: Instant impact dynamic missile layout (Fixed mortar ground glitch)
        case 1: { _explosionClass = "Bo_GBU12_LGB"; };       // Medium: Original GBU Laser Guided Bomb
        case 2: { _explosionClass = "Bo_Mk82"; };            // Heavy: Massive 500lb bomb blast
    };
};

// Spawn the definitive explosion type at the target vector coordinates
private _explosive = _explosionClass createVehicle _pos;
