params ["_unit","_weapon"];

_unit removeWeapon _weapon;

"Bo_GBU12_LGB" createVehicle (getPosATL _unit);
