params ["_unit", "_weapon"];

private _show = {
    params ["_text"];

    hintSilent parseText format [
        "<t align='center' size='1.4' color='#FFFFFF'>COVENANT WEAPON SECURITY PROTOCOL</t><br/><br/>%1",
        _text
    ];
};

private _holdingWeapon = {
    _weapon in weapons _unit
};

// ---------- Stage 1 ----------

[
"<t align='center' color='#FFAA00'>
STATUS: WARNING
</t><br/><br/>
<t align='center'>
FOREIGN BIOMETRIC SIGNATURE DETECTED
</t>"
] call _show;

sleep 1;

if (!alive _unit) exitWith {};
if !([] call _holdingWeapon) exitWith {
    ["<t align='center' color='#66FF66'>FAILSAFE CANCELLED</t>"] call _show;
    sleep 2;
    hintSilent "";
};

// ---------- Stage 2 ----------

[
"<t align='center'>
SCANNING...
</t><br/><br/>
<t align='center'>
SPECIES IDENTIFICATION
</t><br/><br/>
<t align='center' color='#FF4040'>
RESULT: UNAUTHORIZED USER
</t>"
] call _show;

sleep 1;

if (!alive _unit) exitWith {};
if !([] call _holdingWeapon) exitWith {
    ["<t align='center' color='#66FF66'>FAILSAFE CANCELLED</t>"] call _show;
    sleep 2;
    hintSilent "";
};

// ---------- Stage 3 ----------

for "_i" from 3 to 1 step -1 do {

    [
    format[
    "<t align='center' color='#FF4040'>
AUTHENTICATION FAILED
</t><br/><br/>
<t align='center'>
FAILSAFE PROTOCOL ARMED
</t><br/><br/>
<t align='center' size='2.2' color='#FFAA00'>%1</t>",
    _i
    ]
    ] call _show;

    sleep 1;

    if (!alive _unit) exitWith {};
    if !([] call _holdingWeapon) exitWith {
        ["<t align='center' color='#66FF66'>FAILSAFE CANCELLED</t>"] call _show;
        sleep 2;
        hintSilent "";
    };
};

// ---------- Stage 4 ----------

[
"<t align='center' color='#FF0000' size='1.5'>
FAILSAFE ACTIVATED
</t>"
] call _show;

sleep 0.5;

hintSilent "";

_unit removeWeapon _weapon;

"Bo_GBU12_LGB" createVehicle (getPosATL _unit);
