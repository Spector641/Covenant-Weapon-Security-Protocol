params ["_unit","_weapon"];

hintSilent parseText
"
<t align='center' size='1.3' color='#ff4040'>
COVENANT WEAPON SECURITY PROTOCOL
</t>

<t align='center'>
Foreign biometric signature detected.
</t>
";

sleep 3;

if (!alive _unit) exitWith {};

if !(_weapon in weapons _unit) exitWith
{
    hintSilent "";
};

_unit removeWeapon _weapon;

"Bo_GBU12_LGB" createVehicle (getPosATL _unit);
