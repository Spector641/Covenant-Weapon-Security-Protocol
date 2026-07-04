/*
    Covenant Weapon Security Protocol
    Starts the biometric failsafe sequence.
*/

params ["_unit", "_weapon"];

//--------------------------------------------------
// Helper
//--------------------------------------------------

private _holdingWeapon = {
    _weapon in weapons _unit
};

//--------------------------------------------------
// Stage 1 - Warning
//--------------------------------------------------

[
"
<t align='center' color='#FFAA00'>
STATUS: WARNING
</t>

<br/><br/>

<t align='center'>
FOREIGN BIOMETRIC SIGNATURE DETECTED
</t>
"
] call CWSP_fnc_showWarning;

sleep 1;

if (!alive _unit) exitWith {};

if !([] call _holdingWeapon) exitWith {

    [
    "
    <t align='center' color='#66FF66'>
    FAILSAFE CANCELLED
    </t>

    <br/><br/>

    Weapon released before activation.
    "
    ] call CWSP_fnc_showWarning;

    sleep 2;

    hintSilent "";
};

//--------------------------------------------------
// Stage 2 - Scan
//--------------------------------------------------

[
"
<t align='center'>
SCANNING...
</t>

<br/><br/>

<t align='center'>
SPECIES IDENTIFICATION
</t>

<br/><br/>

<t align='center' color='#FF4040'>
RESULT: UNAUTHORIZED USER
</t>
"
] call CWSP_fnc_showWarning;

sleep 1;

if (!alive _unit) exitWith {};

if !([] call _holdingWeapon) exitWith {

    [
    "
    <t align='center' color='#66FF66'>
    FAILSAFE CANCELLED
    </t>

    <br/><br/>

    Weapon released before activation.
    "
    ] call CWSP_fnc_showWarning;

    sleep 2;

    hintSilent "";
};

//--------------------------------------------------
// Stage 3 - Countdown
//--------------------------------------------------

for "_i" from 3 to 1 step -1 do {

    [
    format
    [
        "
        <t align='center' color='#FF4040'>
        AUTHENTICATION FAILED
        </t>

        <br/><br/>

        <t align='center'>
        FAILSAFE PROTOCOL ARMED
        </t>

        <br/><br/>

        <t align='center' size='2.2' color='#FFAA00'>%1</t>
        ",
        _i
    ]
    ] call CWSP_fnc_showWarning;

    sleep 1;

    if (!alive _unit) exitWith {};

    if !([] call _holdingWeapon) exitWith {

        [
        "
        <t align='center' color='#66FF66'>
        FAILSAFE CANCELLED
        </t>

        <br/><br/>

        Weapon released before activation.
        "
        ] call CWSP_fnc_showWarning;

        sleep 2;

        hintSilent "";
    };
};

//--------------------------------------------------
// Final Verification
//--------------------------------------------------

[
"
<t align='center' color='#FFAA00'>
FINAL BIOMETRIC VERIFICATION
</t>
"
] call CWSP_fnc_showWarning;

sleep 0.5;

if (!alive _unit) exitWith {};

if !([] call _holdingWeapon) exitWith {

    [
    "
    <t align='center' color='#66FF66'>
    FAILSAFE CANCELLED
    </t>

    <br/><br/>

    Weapon released before activation.
    "
    ] call CWSP_fnc_showWarning;

    sleep 2;

    hintSilent "";
};

//--------------------------------------------------
// Activated
//--------------------------------------------------

[
"
<t align='center' color='#FF0000' size='1.5'>
FAILSAFE ACTIVATED
</t>
"
] call CWSP_fnc_showWarning;

sleep 0.3;

hintSilent "";

//--------------------------------------------------
// Effects
//--------------------------------------------------

[_unit, _weapon] call CWSP_fnc_playEffects;
