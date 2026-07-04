waitUntil {!isNull player};

player addEventHandler ["Take",
{
    params ["_unit","","_item"];

    [_unit,_item] call CWSP_fnc_detectWeapon;
}];
