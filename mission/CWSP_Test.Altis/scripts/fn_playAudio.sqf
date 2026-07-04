/*
    CWSP Audio Manager

    _event:
        warning
        scan
        countdown
        activated
*/

params ["_event"];

switch (_event) do
{
    case "warning":
    {
        playSound "FD_CP_Not_Clear_F";
    };

    case "scan":
    {
        playSound "FD_Start_F";
    };

    case "countdown":
    {
        playSound "FD_Timer_F";
    };

    case "activated":
    {
        playSound "FD_Finish_F";
    };
};
