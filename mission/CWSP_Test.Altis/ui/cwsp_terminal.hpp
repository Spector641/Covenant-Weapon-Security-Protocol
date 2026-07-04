class CWSP_Terminal
{
    idd = -1;
    duration = 999999;
    fadeIn = 0;
    fadeOut = 0;
    movingEnable = 0;

    onLoad = "uiNamespace setVariable ['CWSP_Terminal', _this select 0];";
    onUnload = "uiNamespace setVariable ['CWSP_Terminal', displayNull];";

    class controls
    {
        class TerminalText
        {
            idc = 1000;

            type = 13;
            style = 0;

            x = 0.30;
            y = 0.20;
            w = 0.40;
            h = 0.60;

            size = 0.032;

            colorBackground[] = {0,0,0,0.70};

            text = "";

            class Attributes
            {
                font = "PuristaMedium";
                color = "#FFFFFF";
                align = "center";
                shadow = 1;
            };
        };
    };
};
