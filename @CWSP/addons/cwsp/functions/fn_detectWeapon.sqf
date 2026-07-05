/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Dynamically maps the selected CBA preset to corresponding weapon arrays and runs authorization routines.
*/

params ["_unit", "_weapon"];

// Exit instantly if the weapon is empty (hands free)
if (_weapon == "") exitWith {};

private _targetList = [];
private _currentPreset = if (isNil "cwsp_weapon_preset") then { 0 } else { cwsp_weapon_preset };

switch (_currentPreset) do {
    case 0: {
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
        _targetList = [
            "arifle_ARX_blk_F",
            "srifle_DMR_05_blk_F"
        ];
    };
    case 2: {
        // Safe catch-all validation array check
        _targetList = [_weapon];
    };
};

// If the weapon is tracked in our active target pack configuration
if (_weapon in _targetList) then {
    private _timerValue = if (isNil "cwsp_failsafe_timer") then { 9 } else { cwsp_failsafe_timer };
    [_unit, _weapon, _timerValue] spawn CWSP_fnc_startFailsafe;
};
