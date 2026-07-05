/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Handles the dynamic countdown loop based on selected CBA interface themes and timer configurations.
*/

params ["_unit", "_weapon", "_timer"];

private _hasDropped = false;

// Theme configuration defaults (0 = Covenant Neon Purple)
private _themeColor = "#a124db"; 
private _themeHeader = "COVENANT WEAPON SECURITY PROTOCOL";

// Fetch safe default fallback values if CBA variables aren't fully populated yet
private _currentTheme = if (isNil "cwsp_interface_theme") then { 0 } else { cwsp_interface_theme };

// Apply Theme 1 override (1 = Sci-Fi / Universal Red-White)
if (_currentTheme == 1) then {
    _themeColor = "#e63946"; 
    _themeHeader = "WEAPON SECURITY PROTOCOL - UNAUTHORIZED";
};

// Main Countdown Loop
while {_timer > 0} do {
    // Break the loop instantly if the player discards the blacklisted weapon
    if (currentWeapon _unit != _weapon) exitWith {
        _hasDropped = true;
    };

    // Construct and display the dynamic HUD interface tile using theme elements
    private _structuredText = parseText format [
        "<t color='%1' size='1.5' font='PuristaMedium' align='center'>%2<br/><br/>WARNING<br/><br/>FOREIGN SIGNATURE DETECTED<br/><br/>Failsafe activating in:<br/><size='2'>%3</size></t>", 
        _themeColor, 
        _themeHeader,
        _timer
    ];
    [_structuredText, [0, 0.2, 1, 1], nil, 1, 0, 0] spawn BIS_fnc_textTiles;

    uiSleep 1;
    _timer = _timer - 1;
};

// Terminal Execution Layer
if (!_hasDropped && (currentWeapon _unit == _weapon)) then {
    // Forcefully strip the weapon from the unauthorized user
    _unit removeWeapon _weapon;
    
    // Trigger detonation at the target vector layout
    private _pos = getPosATL _unit;
    private _explosive = "M_Modules_ExplodeBig" createVehicle _pos; 
    _unit setDamage 0.8; 
};
