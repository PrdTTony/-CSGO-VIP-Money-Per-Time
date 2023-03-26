# -CSGO-VIP-Money-Per-Time

VIP CORE Module

Give x ammount of credits to VIP Player every y seconds

If you want to change the ammount of credits given or the time you need to change:

*Shop_SetClientCredits(iClient, Shop_GetClientCredits(iClient) + 500);*

Change **500** to whatever ammount of credits you want to give

*CreateTimer(60.0, TimerGiveCredits, _, TIMER_REPEAT|TIMER_FLAG_NO_MAPCHANGE);*

Change **60.0** to how many seconds you want 
