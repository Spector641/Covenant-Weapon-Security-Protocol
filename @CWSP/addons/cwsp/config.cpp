class CfgPatches
{
    class CWSP
    {
        name = "Covenant Weapon Security Protocol";
        author = "Spector641";
        requiredVersion = 2.16;

        requiredAddons[] =
        {
            "cba_main"
        };

        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions
{
    class CWSP
    {
        class Main
        {
            file = "addons\cwsp\functions";

            class detectWeapon {};
            class startFailsafe {};
            class abortFailsafe {};
            class isAuthorized {};
            class showWarning {};
            class showTerminal {};
            class playAudio {};
            class playEffects {};
        };
    };
};

class Extended_PostInit_EventHandlers
{
    class CWSP_PostInit
    {
        init = "player addEventHandler ['Take', { params ['_unit','','_item']; [_unit,_item] call CWSP_fnc_detectWeapon; }];";
    };
};