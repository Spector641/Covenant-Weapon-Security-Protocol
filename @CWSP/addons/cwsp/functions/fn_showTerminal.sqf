cutRsc ["CWSP_Terminal","PLAIN"];

private _display = uiNamespace getVariable "CWSP_Terminal";

if (isNull _display) exitWith {};

private _ctrl = _display displayCtrl 1000;

_ctrl ctrlSetStructuredText parseText "
<t size='1.4' align='center'>COVENANT WEAPON SECURITY PROTOCOL</t>
<br/><br/>
Weapon
<br/>
Type-51 Repeater
<br/><br/>
STATUS
<br/>
SCANNING...
";
