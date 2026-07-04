params ["_unit","_item"];

// Guarantee the weapons list is loaded instantly
CWSP_CovenantWeapons = [
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

// Is it a supported Covenant weapon?
if !(_item in CWSP_CovenantWeapons) exitWith {};

// If the unit IS authorized (e.g. Elite), do nothing
if ([_unit] call CWSP_fnc_isAuthorized) exitWith {};

// If unauthorized (BLUFOR), initiate security protocols
[_unit,_item] spawn CWSP_fnc_startFailsafe;