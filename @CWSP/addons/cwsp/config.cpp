class CfgPatches
{
    class CWSP
    {
        name = "Covenant Weapon Security Protocol";
        author = "Spector641";
        url = "https://www.patreon.com/Spector641";
        requiredVersion = 2.16;
        requiredAddons[] = 
        {
            "A3_Weapons_F",
            "cba_main",
            "cba_settings"
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
            
            // PostInit core function
            class init { postInit = 1; };
            
            // Security and validation functions
            class detectWeapon {};
            class checkWeapon {};
            class isAuthorized {};
            
            // Failsafe management functions
            class startFailsafe {};
            class abortFailsafe {};
            class handleFailsafe {};
            
            // UI and effects functions
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
