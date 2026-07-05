// --- CWSP: GLOBAL CBA SETTINGS ---

// SETTING 1: Weapon Blacklist (User enters the desired weapon classnames separated by commas)
[
    "cwsp_blacklist_weapons", // Variable name used within the code
    "EDIT",                   // Setting type: Text box (Input field)
    ["Weapon Blacklist Classnames", "Enter the classnames of restricted weapons separated by commas."], // Title and description in the menu
    "Custom Weapon Security Protocol", // Main category name visible in the menu
    "OPTRE_fc_Hex_Shield, OPTRE_fc_Repeater, OPTRE_fc_Spiker, OPTRE_fc_Plasma_Pistol", // Default plasma weapons
    1                         // 1 = Server-side enforced setting
] call CBA_fnc_addSetting;

// SETTING 2: Countdown Timer (Slider in seconds)
[
    "cwsp_failsafe_timer",    // Variable name
    "SLIDER",                 // Setting type: Slider
    ["Authentication Timer", "How many seconds the player has to drop the weapon before detonation."],
    "Custom Weapon Security Protocol",
    [3, 30, 9, 0],            // [Min, Max, Default value, Decimal places] (Between 3 and 30 seconds, default 9)
    1
] call CBA_fnc_addSetting;

// SETTING 3: Visual Theme Selection (Covenant or Generic Sci-Fi)
[
    "cwsp_interface_theme",   // Variable name
    "LIST",                   // Setting type: Drop-down list
    ["Interface Theme", "Choose the visual HUD overlay theme for the warning protocol."],
    "Custom Weapon Security Protocol",
    [[0, 1], ["Covenant (Neon Purple)", "Sci-Fi / Universal (Red-White)"], 0], // [Values, Display names, Default index]
    1
] call CBA_fnc_addSetting;
