/*
    Covenant Weapon Security Protocol
    Aborts the failsafe sequence and alerts the user.
*/

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
