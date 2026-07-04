class CWSP_HUD
{
    idd = -1;
    duration = 999999;
    fadeIn = 0;
    fadeOut = 0;
    movingEnable = 0;

    class controls
    {
        class CWSP_Text
        {
            idc = 1000;

            type = 13;
            style = 0;

            x = 0.30;
            y = 0.22;
            w = 0.40;
            h = 0.50;

            size = 0.035;

            colorBackground[] = {0,0,0,0};

            text = "";

            class Attributes
            {
                align = "center";
                color = "#FFFFFF";
                font = "PuristaMedium";
                shadow = 1;
            };
        };
    };
};
