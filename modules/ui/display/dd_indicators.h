/******************************************************************************/
//                             I N D I C A T O R S . H                        //
//                                    D P X                                   //
/******************************************************************************/


#ifndef DPX_DISPLAY_CONTROLLER_INDICATORS_H
#define DPX_DISPLAY_CONTROLLER_INDICATORS_H

#define MAX_INDICATOR_VALUE_LENGTH 10

#define INDICATOR_MARGIN 1
#define INDICATOR_RADIUS 3
#define INDICATOR_FONT_WIDTH DynamisFont_xTerminal_WIDTH
#define INDICATOR_FONT_HEIGHT DynamisFont_xTerminal_HEIGHT

#define INDICATOR_BLINK_PERIOD 0.5

/// [Indicator ID definitions]
typedef enum {
        /* car parameters */
        EBB, TH2O, OIL_PRESS, TPS, VBAT, RPM, ADC1, TRACTION_CONTROL,
        CLUTCH_POSITION, OIL_TEMP_IN, OIL_TEMP_OUT, CLUTCH_FEEDBACK, DRS,
        EFI_STATUS, TRIM1, TRIM2, EFI_CRASH_COUNTER, TH2O_SX_IN, TH2O_SX_OUT,
        TH2O_DX_IN, TH2O_DX_OUT, EBB_STATE, EFI_SLIP, LAUNCH_CONTROL,
        FUEL_PRESS, EBB_MOTOR_CURRENT, GCU_TEMP, FB_CODE, FB_VAL,
        /* settings */
        S_DASH_TOP_L, S_DASH_TOP_R, S_DASH_BOTTOM_L, S_DASH_BOTTOM_R,
        S_BYPASS_GEARS, S_INVERT_COLORS,
        /* boards */
        EBB_BOARD, GCU_BOARD, SW_BOARD, DCU_BOARD,
        DAU_FL_BOARD, DAU_FR_BOARD, DAU_R_BOARD,
        /* sensors */
        FUEL_PUMP, H2O_PUMP, H2O_FANS, CLUTCH, DRS_CURR,
        GEAR_MOTOR
} Indicator_ID;
/// [Indicator ID definitions]

//Indicator value types

typedef struct {
    int first;   //temp
    int second;  //curr
} IntCouple;

#define STRING 0
#define INT 1
#define FLOAT 2
#define BOOL 3
#define INT_COUPLE 4

/*sfruttiamo il principio di ereditarieta'  e polimorfismo,
viene definita una base class (struct) di tipo Indicator,
dopodiche' 3 classi ereditano i membri base da questa, e aggiungono
un membro specifico del tipo di dato di quell'indicatore
*/

//pending print update può essere di tre tipi, vero, falso, o FULL_PRINT_UPDATE
//label is the formatted string containing the Indicator value

//General information structure for any display item.. A proper Dashboard Indicator
//or even a Settings menu item.
//Each will make use of only the necessary members.

// pendingPrintUpdate can assume three values, so occupies 2bits
// printPosition can assume four values, so occupies 2bits
// same as valueType

/// [Indicator definition]
typedef struct Indicator {
    Indicator_ID id;
    char* name;
    char* description;
    unsigned char nameLength;
    unsigned char descriptionLength;
    unsigned pendingPrintUpdate : 2,
             isVisible : 1,
             parseValueLabel : 1,
             valueType : 3;
    unsigned char labelLength;
    char label[MAX_INDICATOR_VALUE_LENGTH];
} Indicator ;
/// [Indicator definition]

typedef struct {
    Indicator base;
    char* value;
} StringIndicator;

typedef struct {
    Indicator base;
    int value;
} IntegerIndicator;

typedef struct {
    Indicator base;
    float value;
} FloatIndicator;

typedef struct {
    Indicator base;
    unsigned char value;
} BooleanIndicator;

typedef struct {
    Indicator base;
    IntCouple value;
} IntCoupleIndicator;

#define TRUE_STRING     "T"
#define FALSE_STRING    "F"

extern Indicator** dd_currentIndicators;
extern unsigned char dd_currentIndicatorsCount;

//const Indicator_ID DEFAULT_INDICATORS[MAX_VISIBLE_INDICATORS] = {TH2O, EBB, VBAT, OIL_PRESS};

//to allow both classical indicators and those which were the old MenuLine structs
//to share the same data structure and methods, without passing data as arguments to those
//methods to avoid overloading the stack, the methods need to know which collection of indicators
//to access.. thus it must be set to currentIndicators, and the methods will act
//always on this

unsigned char dd_getIndicatorIndex(Indicator_ID id);
//the next two methods are indipendent of the currentIndicators collection, by providing their own
unsigned char dd_getIndicatorIndexFromCollection(Indicator_ID id, Indicator** collection, unsigned char collection_count);

char dd_Indicator_isRequestingUpdate(unsigned char indicatorIndex);
char dd_Indicator_isRequestingFullUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestFullPrintUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestPrintUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestPrintUpdateP(Indicator* ind);
void dd_Indicator_clearPrintUpdateRequest(unsigned char indicatorIndex);

void dd_Indicator_setAsVisible(unsigned char indicatorIndex);

void dd_Indicator_hide(unsigned char indicatorIndex);

void dd_Indicator_setStringValue(Indicator_ID id, char *value);

void dd_Indicator_setIntValue(Indicator_ID id, int value);

void dd_Indicator_setFloatValue(Indicator_ID id, float value);

void dd_Indicator_setBoolValue(Indicator_ID id, char value);

void dd_Indicator_setIntCoupleValue(Indicator_ID id, IntCouple value);

void dd_Indicator_setStringValueP(Indicator* ind, char *value);

void dd_Indicator_setIntValueP(Indicator* ind, int value);

void dd_Indicator_setFloatValueP(Indicator* ind, float value);

void dd_Indicator_setBoolValueP(Indicator* ind, char value);

void dd_Indicator_setIntCoupleValueP(Indicator* ind, int first_value, int second_value);

void dd_Indicator_switchBoolValueP(Indicator* ind);

void dd_Indicator_switchBoolValue(Indicator_ID id);

void dd_Indicator_parseValueLabel(unsigned char indicatorIndex);

/** \file dd_indicators.h
*   \brief Provides methods for accessing or setting indicator parameters.
*
*   Whenever possible, these methods should be preferred over direct struct member accessing, 
*   to improve encapsulation and facilitate future changes, along with the fact that they
*   might perform additional checks or support other features.\n
*   To perform an operation on an indicator a method must be able to access such variable.
*   Occasionally some operations are performed iteratively on the indicators in a collection.
*   This can be done, either by accessing the elements and passing their pointers to the methods 
*   or by passing the collection pointer once, and then passing the indexes to the methods. This provides for 
*   4 byte(? for a pointer) stack usage for each nested function call, vs 1 byte(for an unsigned char index).
*   Therefore the second method is currently preferred and is the only one adopted.
*   This presents some problems, even concurrency problems. What happens if I have to switch collection
*   to change the value for an indicator while current interface adopts another collection, and the refresh interrupt
*   occurs during this change? It displays the wrong collection.
*   Additionally one could provide some duplicate functions, those called rather occasionally such as the set value functions
*   with indicator pointer access, bypassing collection switching.
*   Or alternatively create a specific function to load an indicator (by pointer) and save it.
*   Then perform all executions on it without the need to pass it again.
*   This is an advantage when nested or successive calls to these methods are performed, but an overhead of a few instructions
*   when only a call is performed on such indicator. And for indicator collections this could become a great advantage or
*   a great overhead. Thus it must be chosen carefully.
*/

#endif //DPX_DISPLAY_CONTROLLER_INDICATORS_H