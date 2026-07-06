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
// If the universe preset is Covenant, check for specialized signatures
private _currentPreset = if (isNil "cwsp_weapon_preset") then { 0 } else { cwsp_weapon_preset };

if (_currentPreset == 0) then {
    switch (_weapon) do {
        case "OPTRE_FC_Needler": {
            _explosionClass = "M_PinkNeeds_AmmoClass"; // Placeholder for your future custom Pink Needle burst particles
        };
        case "OPTRE_FC_T33_FuelRod_Cannon": {
            _explosionClass = "M_FuelRod_Plasma_AmmoClass"; // Placeholder for massive green plasma blast
        };
        // Add more weapon cases here as we develop them in Sprint 14!
    };
};

// --- LAYER 2: DYNAMIC CBA SEVERITY FALLBACK ---
// If no specific weapon override was triggered above, use the CBA options menu layout
if (_explosionClass == "") then {
    private _severity = if (isNil "cwsp_explosion_severity") then { 1 } else { cwsp_explosion_severity };
    
    switch (_severity) do {
        case 0: { _explosionClass = "Sh_82mm_AMOS"; };       // Light: Instant mortar shell impact (Fixed grenade fuse bug)
        case 1: { _explosionClass = "Bo_GBU12_LGB"; };       // Medium: Original GBU Laser Guided Bomb
        case 2: { _explosionClass = "Bo_Mk82"; };            // Heavy: Massive 500lb bomb blast (Fixed module no-damage bug)
    };
};

// Spawn the definitive explosion type at the target vector coordinates
private _explosive = _explosionClass createVehicle _pos;
