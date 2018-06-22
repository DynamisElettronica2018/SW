//
//  DP8 Graphic LCD Controller
//  Aaron Russo 01/03/2016
//
//  See .h for documentation
//

#include "dd_global_defines.h"
#include "../libs/eGlcd.h"
#include "dd_graphic_controller.h"
#include "dd_boardDebug.h"
#include "../input-output/d_hardReset.h"
#include "fonts/dd_fonts.h"
#include "dd_interfaces.h"
#include "dd_dashboard.h"
#include "dd_menu.h"
#include "d_gears.h"
#include <math.h>
#include "../input-output/d_signalLed.h"
#include"../input-output/d_controls.h"
#include "../libs/debug.h"
#include "../input-output/d_rpm.h"
#include "d_clutch.h"

#define DD_BACKLIGHT_PIN RG13_bit
#define DD_BACKLIGHT_PIN_DIRECTION TRISG13_bit

#define STARTUP_LOGO_PERIOD 1000 ///< Time interval logo is displayed on startup, in milliseconds.
#define OP_MODE_POPUP_PERIOD 700  ///< Time interval popup with new op mode title is displayed on op mode change, in ms.

static char dd_isInterfaceChangedFromLastFrame = FALSE, dd_isFrameUpdateForced = FALSE, dd_isNextFrameUpdateForced = FALSE, dd_isColorInversionQueued = FALSE;
static Interface dd_lastInterface = DASHBOARD_INTERFACE;
static char dd_lastInterfaceTitle[MAX_INTERFACE_TITLE_LENGTH] = "";

static Interface dd_currentInterface = DASHBOARD_INTERFACE;
Indicator** dd_currentIndicators = NULL;
unsigned char dd_currentIndicatorsCount = 0;
char dd_currentInterfaceTitle[MAX_INTERFACE_TITLE_LENGTH] = "";

char dd_onStartup = 0;
char dd_onInterfaceChange = 1;
unsigned char dd_tmr1Counter = 0;
unsigned char dd_onStartupCounterLimit = 0;
unsigned char dd_onInterfaceChangeCounterLimit = 0;

static char dd_notificationFlag = FALSE;
unsigned int dd_notificationTicks = 0;

void dd_GraphicController_timerSetup(void) {
    setInterruptPriority(TIMER1_DEVICE, LOW_PRIORITY);
    setTimer(TIMER1_DEVICE, FRAME_PERIOD);
    clearTimer1();
}

/**
   \param period Counter time period in milliseconds.
*/
unsigned char dd_GraphicController_getTmrCounterLimit(unsigned int period)
{
   return (unsigned char) floor(period/1000.0*FRAME_RATE);
}

void dd_printLogoAnimation();

void dd_GraphicController_startupLogo(void) {
    dd_onStartupCounterLimit = dd_GraphicController_getTmrCounterLimit(STARTUP_LOGO_PERIOD);
    //sprintf(str, "%d - %d", startupCounterLimit, startupCounter);
    //printf(str);
    dd_printLogoAnimation();
    dd_onStartup = 1;
    //eGlcd_LoadImage(DYNAMIS_LOGO);
}

void dd_GraphicController_turnOnBacklight(void) {
    DD_BACKLIGHT_PIN = TRUE;
}

void dd_GraphicController_turnOffBacklight(void) {
    DD_BACKLIGHT_PIN = FALSE;
}

void dd_GraphicController_switchBacklight(void) {
    DD_BACKLIGHT_PIN = !DD_BACKLIGHT_PIN;
}

void dd_GraphicController_init(void) {
//printf("graphic init");
    DD_BACKLIGHT_PIN_DIRECTION = OUTPUT;
    dd_GraphicController_turnOnBacklight();
    eGlcd_init();
    eGlcd_clear();
    eGlcd_setFont(DD_Dashboard_Font);
    if (!dHardReset_hasBeenReset()) {
        dd_GraphicController_startupLogo();
    }
    dd_GraphicController_timerSetup();
    dd_GraphicController_forceFullFrameUpdate();
}

void dd_GraphicController_invertColors(void) {
    dd_GraphicController_queueColorInversion();
    eGlcd_invertColors();
    dd_GraphicController_forceNextFrameUpdate();
}

char dd_GraphicController_areColorsInverted(void) {
    return BLACK == PIXEL_OFF;
}

void dd_GraphicController_setInterface(Interface interface) {
     dd_isInterfaceChangedFromLastFrame = TRUE;
     dd_onInterfaceChange = TRUE;
     dd_isFrameUpdateForced = TRUE;
     dd_onInterfaceChangeCounterLimit = dd_GraphicController_getTmrCounterLimit(OP_MODE_POPUP_PERIOD);
     //printf("Set Interface");
     //sprintf(str, "%d", dd_onInterfaceChangeCounterLimit);
     //printf(str);
     dd_currentInterface = interface;
}

void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title) {
    //printf("set coll. interf.");
    dd_GraphicController_setInterface(interface);
    
    dd_Interface_init[dd_currentInterface]();
    if ( strlen(title) < MAX_INTERFACE_TITLE_LENGTH )
         strcpy(dd_currentInterfaceTitle, title);
    dd_currentIndicators = indicator_collection;
    dd_currentIndicatorsCount = indicator_count;
    //printf("finished");
    //printf("coll. int. set");
    //printf("collection set..");
    //printf("interface set..");
}

Interface dd_GraphicController_getInterface(void) {
    return dd_currentInterface;
}

void dd_GraphicController_saveCurrentInterface(void) {
    strcpy(dd_lastInterfaceTitle, dd_currentInterfaceTitle);
    dd_lastInterface = dd_currentInterface;
}

//notifications are timed as display frame rate, by timer1
void dd_GraphicController_setNotificationTimeout(float time) {
    dd_notificationTicks = (unsigned int) ((time / FRAME_PERIOD) + 0.5);
}

void dd_GraphicController_setNotificationFlag (void){
     dd_notificationFlag = TRUE;
}

void dd_GraphicController_unsetNotificationFlag (void){
     dd_notificationFlag = FALSE;
}

void dd_GraphicController_clearNotification(void) {
     eGlcd_clear();
     dd_isFrameUpdateForced = TRUE;
     dd_GraphicController_unsetNotificationFlag();
}

void dd_GraphicController_fireNotification(char *text, NotificationType type) {
    strcpy(dd_notificationText, text);
    dd_printMessage(dd_notificationText);
    dd_GraphicController_setNotificationFlag ();
}

/**
    \param time Time in milliseconds.
*/
void dd_GraphicController_fireTimedNotification(unsigned int time, char *text, NotificationType type) {
    dd_GraphicController_getTmrCounterLimit(time);
    dd_GraphicController_fireNotification(text, type);
}

void dd_GraphicController_handleNotification(void) {
    if (dd_notificationTicks > 0) {
        dd_notificationTicks -= 1;
        if (dd_notificationTicks == 0) {
            dd_GraphicController_clearNotification();
        }
    }
}

void dd_GraphicController_printFrame(void) {
    if (dd_isColorInversionQueued) {
        eGlcd_invertColors();
        dd_isColorInversionQueued = FALSE;
    }
    if (dd_isInterfaceChangedFromLastFrame || dd_isNextFrameUpdateForced) {
        eGlcd_clear();
        dd_GraphicController_forceFullFrameUpdate();
        dd_isInterfaceChangedFromLastFrame = FALSE;
    }
    dd_Interface_print[dd_currentInterface]();
    if (dd_GraphicController_isFrameUpdateForced) {
        dd_isFrameUpdateForced = FALSE;
    }
    if (dd_isNextFrameUpdateForced) {
        dd_isNextFrameUpdateForced = FALSE;
    }
}
// sono tutte inutili

void dd_GraphicController_forceFullFrameUpdate(void) {              //inutile
    dd_isFrameUpdateForced = TRUE;
}

void dd_GraphicController_releaseFullFrameUpdate(void) {
    dd_isFrameUpdateForced = FALSE;
}

void dd_GraphicController_forceNextFrameUpdate(void) {
    dd_isNextFrameUpdateForced = TRUE;
}

char dd_GraphicController_isFrameUpdateForced(void) {               
    return dd_isFrameUpdateForced;
}

void dd_GraphicController_queueColorInversion(void) {
    dd_isColorInversionQueued = TRUE;
}

char dd_GraphicController_isColorInversionQueued(void) {               //inutile
    return dd_isColorInversionQueued;
}

void dd_printLogoAnimation() {
     char page = 0;
     int i =0, j=0, k=0;
    signed char new_y = 0;
    signed char old_y = 0;
    int y_center = 19;
    double cos_angle;
    signed char new_y_border = 0;
    
    eGlcd_LoadImage(DYNAMIS_LOGO);
    //_Lcd_PrintFrame();
    //delay_ms(200);

    for (k=5; k<=120; k++){
        resetTimer32();
        cos_angle = cos(0.10466*k);
        new_y_border = round((cos_angle*17));
        if (new_y_border<0) new_y_border = -new_y_border;
        for (i=0; i<=17-new_y_border; i++)
        {
            for (j=0; j<8; j++)
            {
                frameBuff[j*64+i] = 0xFF;
                frameBuff[j*64+i+y_center+new_y_border] = 0xFF;
            }
        }
        for (new_y=-new_y_border; new_y<=new_y_border; new_y++)
        {
            old_y = round(new_y/cos_angle);
            for (page = 0; page<8; page++)
            {
              i = page*2*64+old_y+y_center;
              j = page*64+new_y+y_center;
              frameBuff[j] = DYNAMIS_LOGO[i];
             }
         }
         Lcd_PrintFrame();
         Delay_Cyc(floor(pow(k*8,2)/30000+new_y_border/10), k*700);
     }
}

int __counter = 0;
void dd_GraphicController_onTimerInterrupt(void) 
{
     dRpm_set(8000);
     dRpm_updateLedStripe();

    if ( __counter == 10 )
    {
       dSignalLed_set(DSIGNAL_LED_RED_RIGHT);
    }
    if (__counter == 20)
    {
       dSignalLed_unset(DSIGNAL_LED_RED_RIGHT);
     __counter = 0;
    }

   __counter++;

    if(dd_onStartup)
    {
        dd_tmr1Counter++;
        if(dd_tmr1Counter  >= dd_onStartupCounterLimit)
        {
            dd_onStartup = 0;
            dd_tmr1Counter = 0;
            eGlcd_clear();
            Lcd_PrintFrame();
        }
    }
    else {
        //resetTimer32();
        if(dd_isInterfaceChangedFromLastFrame)
        {
            eGlcd_clear();
            dd_Interface_print[dd_currentInterface]();
            dd_printMessage(dd_currentInterfaceTitle);
            dd_isInterfaceChangedFromLastFrame = 0;
            Lcd_PrintFrame();
        }
        else if (dd_notificationFlag) {
            dd_GraphicController_handleNotification();
        }
        else if (dd_onInterfaceChange)
        {
             /* right now if we are in this situation, with the popup on screen
             and the Interface graphics visible below, the screen is frozen till
             the message disappears, for example if any indicators change, it will not
             appear on screen since the interrupt routine only increments the tmrcounter..
             we may like that the indicators change under the message, which would require
             redrawing Interface and message on every interrupt... */
          dd_tmr1Counter++;
           if(dd_tmr1Counter  >= dd_onInterfaceChangeCounterLimit)
           {
               dd_onInterfaceChange = 0;
               dd_tmr1Counter = 0;
               eGlcd_fill(WHITE);
               dd_Interface_print[dd_currentInterface]();
               Lcd_PrintFrame();
               dd_isFrameUpdateForced = FALSE;
           }
        }
        else
        {
            dd_Interface_print[dd_currentInterface]();
            Lcd_PrintFrame();
            dd_isFrameUpdateForced = FALSE;
        }
        //time = getExecTime();
        //sprintf(str, "%f", time);
        //printf(str);
    }

    clearTimer1();
    
    
//#ifdef LED_FRAME_DEBUG
    /*LED_DEBUG_PIN_DIRECTION*/        //questo probabilmente si può definire anche altrove.. per non rifarlo ogni volta
    /*LED_DEBUG_PIN*/
//#endif
    //dd_GraphicController_printFrame();
    //dd_GraphicController_handleNotification();
//#ifdef LED_FRAME_DEBUG
    //LED_DEBUG_PIN = FALSE;
//#endif
}