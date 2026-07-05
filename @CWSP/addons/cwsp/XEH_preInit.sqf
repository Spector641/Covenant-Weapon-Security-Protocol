/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Pre-initialization script to register fully dynamic server and client options via CBA Settings API.
*/

// CONFIGURATION 1: Target Weapon Preset Pack Selection
[
    "cwsp_weapon_preset",
    "LIST",
    "Target Weapon Preset Pack",
    "Custom Weapon Security Protocol",
    [
        [0, 1, 2], 
        ["Covenant (OPTRE First Contact)", "Sci-Fi / Universal Tech", "Vanilla / All Weapons (Testing)"], 
        0
    ],
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

// CONFIGURATION 3: UI Layout Concept Theme Drop-down Selection
[
    "cwsp_interface_theme",
    "LIST",
    "Interface Theme",
    "Custom Weapon Security Protocol",
    [[0, 1], ["Covenant (Neon Purple)", "Sci-Fi / Universal (Red-White)"], 0],
    1
] call CBA_fnc_addSetting;
