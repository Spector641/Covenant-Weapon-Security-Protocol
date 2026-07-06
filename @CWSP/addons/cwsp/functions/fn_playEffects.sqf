/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Handles specific weapon overrides with strict case-insensitivity and falls back to CBA choices.
*/

params ["_unit", "_weapon"];

// Forcefully strip the weapon from the unauthorized user
_unit removeWeapon _weapon;

private _pos = getPosATL _unit;
private _explosionClass = "";

// Convert the weapon string to uppercase to guarantee perfect case-insensitive matching
private _weaponUpper = toUpper _weapon;

// --- LAYER 1: COVENANT WEAPON SPECIFIC OVERRIDES ---
private _currentPreset = if (isNil "cwsp_weapon_preset") then { 0 } else { cwsp_weapon_preset };

if (_currentPreset == 0) then {
    switch (_weaponUpper) do {
        // Needler: Strict uppercase check
        case "OPTRE_FC_NEEDLER": {
            _explosionClass = "M_Titan_AP"; 
        };
        // Fuel Rod Cannon: Strict uppercase check
        case "OPTRE_FC_T33_FUELROD_CANNON": {
            _explosionClass = "M_Mocha_AT"; 
        };
        // Plasma Pistol: Strict uppercase check
        case "OPTRE_FC_PLASMA_PISTOL": {
            _explosionClass = "M_AirToAir_AA"; 
        };
        // Concussion Rifle & Carbine: Strict uppercase check
        case "OPTRE_FC_T50_CONCUSSIONRIFLE";
        case "OPTRE_FC_T51_CARBINE": {
            _explosionClass = "M_PG_AT";
        };
    };
};

// --- LAYER 2: DYNAMIC CBA SEVERITY FALLBACK ---
if (_explosionClass == "") then {
    private _severity = if (isNil "cwsp_explosion_severity") then { 1 } else { cwsp_explosion_severity };
    
    switch (_severity) do {
        case 0: { _explosionClass = "M_PG_AT"; };            // Light
        case 1: { _explosionClass = "Bo_GBU12_LGB"; };       // Medium (Original GBU)
        case 2: { _explosionClass = "Bo_Mk82"; };            // Heavy
    };
};

// Spawn the definitive explosion type at the target vector coordinates
private _explosive = _explosionClass createVehicle _pos;
