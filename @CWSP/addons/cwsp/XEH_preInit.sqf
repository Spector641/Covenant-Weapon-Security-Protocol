// --- CWSP: GLOBAL CBA SETTINGS CONFIGURATION ---

// CONFIGURATION 1: Weapon Blacklist Text Edit Box (Ultra Safe Syntax)
[
    "cwsp_blacklist_weapons",
    "EDIT",
    "Weapon Blacklist Classnames (Separated by commas)",
    "Custom Weapon Security Protocol",
    "OPTRE_fc_Hex_Shield, OPTRE_fc_Repeater, OPTRE_fc_Spiker, OPTRE_fc_Plasma_Pistol",
    1
] call CBA_fnc_addSetting;

// CONFIGURATION 2: Failsafe Timer Slider
[
    "cwsp_failsafe_timer",
    "SLIDER",
    ["Authentication Timer", "How many seconds the player has to drop the weapon before detonation."],
    "Custom Weapon Security Protocol",
    [3, 30, 9, 0],
    1
] call CBA_fnc_addSetting;

// CONFIGURATION 3: UI Layout Concept Theme Drop-down Selection
[
    "cwsp_interface_theme",
    "LIST",
    ["Interface Theme", "Choose the visual HUD overlay theme for the warning protocol."],
    "Custom Weapon Security Protocol",
    [[0, 1], ["Covenant (Neon Purple)", "Sci-Fi / Universal (Red-White)"], 0],
    1
] call CBA_fnc_addSetting;
