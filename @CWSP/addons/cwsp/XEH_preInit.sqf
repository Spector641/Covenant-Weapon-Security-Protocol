/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Pre-initialization script to register fully dynamic server and client options via CBA Settings API.
*/

// CONFIGURATION 1: Weapon Blacklist Metin Box
[
    "cwsp_blacklist_weapons",
    "EDIT",
    "Weapon Blacklist Classnames",
    "Custom Weapon Security Protocol",
    "OPTRE_FC_T50_SRS, OPTRE_FC_T51_Repeater, OPTRE_FC_T33_FuelRod_Cannon, OPTRE_FC_Plasma_Pistol, OPTRE_FC_Needler, OPTRE_FC_T25_Rifle",
    1
] call CBA_fnc_addSetting;

// CONFIGURATION 2: Failsafe Timer Slider
[
    "cwsp_failsafe_timer",
    "SLIDER",
    "Authentication Timer",
    "Custom Weapon Security Protocol",
    [3, 30, 9, 0],
    1
] call CBA_fnc_addSetting;

// CONFIGURATION 3: UI Layout Concept Theme Selection
[
    "cwsp_interface_theme",
    "LIST",
    "Interface Theme",
    "Custom Weapon Security Protocol",
    [[0, 1], ["Covenant (Neon Purple)", "Sci-Fi / Universal (Red-White)"], 0],
    1
] call CBA_fnc_addSetting;
