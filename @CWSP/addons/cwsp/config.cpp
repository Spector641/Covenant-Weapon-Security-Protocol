class CfgPatches
{
    class cwsp_addon
    {
        name = "Custom Weapon Security Protocol";
        author = "Spector641";
        url = "https://www.patreon.com/Spector641";
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        requiredAddons[] = {"A3_Weapons_F", "cba_main", "cba_settings"};
    };
};

class CfgFunctions
{
    class CWSP
    {
        class Functions
        {
            file = "\cwsp\functions";
            class init { postInit = 1; }; // Added postInit to force the script to run automatically on spawn
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

// --- CBA SETTINGS INTEGRATION ---
class Extended_PreInit_EventHandlers {
    class cwsp_settings_init {
        init = "call compile preprocessFileLineNumbers '\cwsp\XEH_preInit.sqf'";
    };
};
