params ["_unit","_weapon"];

private _countdown = 3;

while {_countdown > 0} do {

    if (!alive _unit) exitWith {};

    if !(_weapon in weapons _unit) exitWith {

        hintSilent
        parseText
        "<t align='center' color='#66FF66' size='1.3'>
        FAILSAFE ABORTED
        </t>";

        playSound "AddItemFailed";
    };

    hintSilent parseText format [

        "<t align='center' color='#ff4040' size='1.4'>
        COVENANT WEAPON SECURITY PROTOCOL
        </t><br/><br/>
        <t align='center'>
        FOREIGN BIOMETRIC SIGNATURE DETECTED
        </t><br/><br/>
        <t align='center'>
        FAILSAFE ACTIVATION IN
        </t><br/><br/>
        <t align='center' size='2.0' color='#ffaa00'>%1</t>",

        _countdown

    ];

    _countdown = _countdown - 1;

    sleep 1;
};

if (!alive _unit) exitWith {};

if !(_weapon in weapons _unit) exitWith {};

_unit removeWeapon _weapon;

hintSilent "";

"Bo_GBU12_LGB" createVehicle (getPosATL _unit);
