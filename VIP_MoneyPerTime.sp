#pragma semicolon 1

#include <sourcemod>
#include <sdktools>
#include <sdktools_functions>
#include <vip_core>
#include <shop>


public Plugin myinfo =
{
	name = "[VIP] Money per X minutes",
	author = "TTony",
	version = "1.0"
};

static const char g_sFeature[] = "Money_Time";

public void OnPluginStart() 
{
    if(VIP_IsVIPLoaded())
    {    
        VIP_OnVIPLoaded();
    }
}

public void OnPluginEnd() 
{
	VIP_UnregisterMe();
}

public void VIP_OnVIPLoaded()
{
    VIP_RegisterFeature(g_sFeature, INT);
}

public void OnMapStart()
{
    CreateTimer(60.0, TimerGiveCredits, _, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);
}

public Action TimerGiveCredits(Handle timer)
{    
    for(int iClient = 1; iClient <= MaxClients; iClient++){

        if(IsClientInGame(iClient) && !IsFakeClient(iClient) && VIP_IsClientVIP(iClient)){

            Shop_SetClientCredits(iClient, Shop_GetClientCredits(iClient) + 500);
            PrintToChat(iClient, "You're getting 500 more credits for being a VIP");
        }
    }

    return Plugin_Continue;
}