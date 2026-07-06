/*
    Author: Spector641
    Project: Custom Weapon Security Protocol (CWSP)
    Description: Handles the countdown sequence using the original warning hints, audio tracks, and explosion effects.
*/

params ["_unit", "_weapon", "_timer"];

private _hasDropped = false;

// 1. SCANNING Stage: Trigger initial audio and alert the user (Only if it's a real player)
if (isPlayer _unit) then {
    ["scan"] call CWSP_fnc_playAudio;
    [
        "<t color='#e63946'>FOREIGN SIGNATURE DETECTED</t><br/>Scanning weapon diagnostics..."
    ] call CWSP_fnc_showWarning;
};

uiSleep 1.5;

// Main Countdown Loop
while {_timer > 0} do {
    // Break the loop instantly if the player discards the blacklisted weapon
    if (currentWeapon _unit != _weapon) exitWith {
        _hasDropped = true;
    };

    // 2. COUNTDOWN Stage: Play beep sound and update the original right-side hint layout
    if (isPlayer _unit) then {
        ["countdown"] call CWSP_fnc_playAudio;
        
        private _warningText = format [
            "<t color='#ff3333' size='1.2'>FAILSAFE ACTIVATING</t><br/><br/>Unauthorized user detected.<br/>Detonation in: <t size='1.4' color='#ffffff'>%1</t> seconds.", 
            _timer
        ];
        [_warningText] call CWSP_fnc_showWarning;
    };

    uiSleep 1;
    _timer = _timer - 1;
};

// Post-loop validation check
if (_hasDropped) exitWith {
    if (isPlayer _unit) then {
        [] call CWSP_fnc_abortFailsafe;
    };
};

// 3. TERMINAL ACTIVATION Stage: BOOM!
if (currentWeapon _unit == _weapon) then {
    if (isPlayer _unit) then {
        ["activated"] call CWSP_fnc_playAudio;
        [
            "<t color='#ff0000' size='1.3'>PROTOCOL ACTIVATED</t><br/><br/>Failsafe detonation triggered."
        ] call CWSP_fnc_showWarning;
    };
    
    uiSleep 0.5;
    
    if (isPlayer _unit) then {
        hintSilent "";
    };
    
    // Execute our original effects file
    [_unit, _weapon] call CWSP_fnc_playEffects;
};
