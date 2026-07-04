call compile preprocessFileLineNumbers "scripts\cwsp_weapons.sqf";

waitUntil {!isNull player};

player addEventHandler ["Take",
{
    params ["_unit","","_item"];

    [_unit,_item] call CWSP_fnc_detectWeapon;
}];

// Lead Designer'ın test amaçlı eklenmesini istediği geçici kod:
[] spawn
{
    sleep 2;

    call compile preprocessFileLineNumbers "scripts\fn_showTerminal.sqf";
};
