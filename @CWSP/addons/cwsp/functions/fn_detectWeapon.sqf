/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Dynamically maps the selected CBA preset to corresponding weapon arrays and runs authorization routines.
*/

params ["_unit", "_weapon"];

private _targetList = [];

// Fetch safe default fallback value if CBA variables aren't initialized yet
private _currentPreset = if (isNil "cwsp_weapon_preset") then { 0 } else { cwsp_weapon_preset };

// Map choices based on the drop-down index selection
switch (_currentPreset) do {
    case 0: {
        // Preset 0: Covenant Weapons Pack (Your original core list)
        _targetList = [
            "OPTRE_FC_T50_SRS",
            "OPTRE_FC_T51_Repeater",
            "OPTRE_FC_T33_FuelRod_Cannon",
            "OPTRE_FC_Plasma_Pistol",
            "OPTRE_FC_Needler",
            "OPTRE_FC_T25_Rifle",
            "OPTRE_FC_T25_Rifle_Folded",
            "OPTRE_FC_T31_NeedleRifle",
            "OPTRE_FC_T50_ConcussionRifle",
            "OPTRE_FC_T51_Carbine"
        ];
    };
    case 1: {
        // Preset 1: General Sci-Fi / Custom Universe Tech (Add any mod weapons here later)
        _targetList = [
            "arifle_ARX_blk_F", // Example: Vanilla Hex-Launcher rifle
            "srifle_DMR_05_blk_F" // Example: Cyrus 9.3mm fütüristik DMR
        ];
    };
    case 2: {
        // Preset 2: Global Catch-All (For testing, triggers on any primary/secondary weapon)
        _targetList = [currentWeapon _unit];
    };
};

// If the player's weapon is registered inside our active mapped target array
if (_weapon in _targetList) then {
    private _timerValue = if (isNil "cwsp_failsafe_timer") then { 9 } else { cwsp_failsafe_timer };
    [_unit, _weapon, _timerValue] spawn CWSP_fnc_startFailsafe;
};
