' BEGIN sxmath.bi
' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

DECLARE FUNCTION GetDecimalPos (TheStringIn AS STRING)
DECLARE FUNCTION InsertCharacter$ (TheStringIn AS STRING, TheCharIn AS STRING, TheDigitIn AS INTEGER, NumTimesIn AS INTEGER)
DECLARE FUNCTION ReadManyCharacter$ (TheStringIn AS STRING, StartDigitIn AS INTEGER, FinishDigitIn AS INTEGER)
DECLARE FUNCTION ReadOneCharacter$ (TheStringIn AS STRING, TheDigitIn AS INTEGER)
DECLARE FUNCTION RemoveCharacter$ (TheStringIn AS STRING, TheDigitIn AS INTEGER)
DECLARE FUNCTION RemoveDecimal$ (TheStringIn AS STRING)
DECLARE FUNCTION RemoveSign$ (TheStringIn AS STRING)
DECLARE FUNCTION RemoveZerosLeft$ (TheStringIn AS STRING, TheStartingDigitIn AS INTEGER)
DECLARE FUNCTION RemoveZerosRight$ (TheStringIn AS STRING)
DECLARE FUNCTION ReverseSign$ (TheStringIn AS STRING)
DECLARE FUNCTION SelectLargerInteger$ (Num1In AS STRING, Num2In AS STRING)
DECLARE FUNCTION RepairFormat$ (TheStringIn AS STRING)
DECLARE FUNCTION InternalAdd$ (Num1In AS STRING, Num2In AS STRING)
DECLARE FUNCTION InternalSub$ (Num1In AS STRING, Num2In AS STRING)
DECLARE FUNCTION InternalMul$ (Nusm1In AS STRING, Num2In AS STRING)
DECLARE FUNCTION InternalInv$ (DenomIn AS STRING, NumDigitsIn AS INTEGER)
DECLARE FUNCTION InternalDiv$ (NumerIn AS STRING, DenomIn AS STRING, NumDigitsIn AS INTEGER)
DECLARE FUNCTION BigNumAdd$ (Num1In AS STRING, Num2In AS STRING)
DECLARE FUNCTION BigNumSub$ (Num1In AS STRING, Num2In AS STRING)
DECLARE FUNCTION BigNumMul$ (Num1In AS STRING, Num2In AS STRING)
DECLARE FUNCTION BigNumInv$ (DenomIn AS STRING, NumDigitsIn AS INTEGER)
DECLARE FUNCTION BigNumDiv$ (NumerIn AS STRING, DenomIn AS STRING, NumDigitsIn AS INTEGER)

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

' BEGIN sxript.bi
' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

' JavaScript: STARTSKIP
'\\std::string subExecute (std::string TheScriptIn, std::string TheModeIn, std::string ScopeSwitchIn);
'\\std::string numberCrunch (std::string TheStringIn);
'\\std::string sxriptEval (std::string TheStringIn);
'\\std::string evalStep (std::string TheStringIn);
' JavaScript: ENDSKIP

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

DECLARE FUNCTION CountElements (TheStringIn AS STRING, TheSeparatorIn AS STRING)
DECLARE FUNCTION FindMatching (TheStringIn AS STRING, TheSymbolIn AS STRING, TheStartPosIn AS INTEGER)
DECLARE FUNCTION FindMostEmbedded (TheStringIn AS STRING)
DECLARE FUNCTION GetSeparatorPos (TheStringIn AS STRING, TheSeparatorTypeIn AS STRING, TheSeparatorNumIn AS INTEGER, TheStartPosIn AS INTEGER)
DECLARE FUNCTION ManageWhiteSpace$ (TheStringIn AS STRING)
DECLARE FUNCTION RemoveWrapping$ (TheStringIn AS STRING, TheWrapIn AS STRING)
DECLARE FUNCTION ReplaceWord$ (TheStringIn AS STRING, TheWordIn AS STRING, TheReplacementIn AS STRING, CurlyDepthIn As INTEGER)
DECLARE FUNCTION ReplaceRaw$ (TheStringIn AS STRING, TheWordIn AS STRING, TheReplacementIn AS STRING)
DECLARE FUNCTION ScanForName (TheStringIn AS STRING, TheCritPosIn AS INTEGER, TheSwitchIn AS STRING)
DECLARE FUNCTION ScanForOperator (TheStringIn AS STRING, TheSymbolIn AS STRING)
DECLARE FUNCTION TypeCheck$ (TheStringIn AS STRING)
DECLARE FUNCTION ManageOperators$ (TheStringIn AS STRING)
DECLARE FUNCTION PlotASCII$ (TheFuncIn AS STRING, LowLimitIn AS DOUBLE, HighLimitIn AS DOUBLE, StepSizeIn AS DOUBLE, WindowWidthIn AS INTEGER, WindowHeightIn AS INTEGER, DetailSwitchIn AS INTEGER)
DECLARE FUNCTION PlotScatter$ (TheListIn AS STRING, WindowWidthIn AS INTEGER, WindowHeightIn AS INTEGER, DetailSwitchIn AS INTEGER)
DECLARE FUNCTION HistASCII$ (TheListIn AS STRING, DetailSwitchIn AS INTEGER)
DECLARE FUNCTION ReturnElement$ (TheStringIn AS STRING, TheArgNumberIn AS INTEGER, TheSeparatorIn AS STRING)
DECLARE FUNCTION VectorASMD$ (Vector1In AS STRING, Vector2In AS STRING, TheOperatorIn AS STRING)
DECLARE FUNCTION StructureEval$ (TheVectorIn AS STRING, TheLeftBrackIn AS STRING, TheRightBrackIn AS STRING)
DECLARE FUNCTION StructureApplyFunc$ (TheVectorIn AS STRING, TheFunctionIn AS STRING, TheBracketsIn AS STRING)
DECLARE FUNCTION StructureTailOp$ (TheVectorIn AS STRING, TheFunctionIn AS STRING, TheBracketsIn AS STRING)
DECLARE FUNCTION FormatForTerminal$ (TheStringIn AS STRING)
DECLARE FUNCTION EvalStep$ (TheStringIn AS STRING)
DECLARE FUNCTION InternalEval$ (TheStringIn AS STRING)
DECLARE FUNCTION FunctionCrunch$ (ScannedNameIn AS STRING, MidFragmentIn AS STRING)
DECLARE FUNCTION SxriptEval$ (TheStringIn AS STRING)
DECLARE FUNCTION NumberCrunch$ (TheStringIn AS STRING)
DECLARE FUNCTION SubExecute$ (TheScriptIn AS STRING, TheModeIn AS STRING, ScopeSwitchIn AS STRING)

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

' Initialize globals and startup variables.
'DIM kglob AS INTEGER
'DIM jglob AS INTEGER
DIM SHARED BrackList AS STRING
DIM SHARED OpList AS STRING
DIM SHARED EscapeChar AS STRING

' Define array for Sxript logo.
DIM SHARED SxriptLogoText(30) AS STRING
DIM SHARED SxriptLogoSize AS INTEGER

' Define structure for function and variable storage.
DIM SHARED FunctionListSize AS INTEGER
DIM SHARED VariableListSize AS INTEGER
DIM SHARED ScopeLevel AS INTEGER
DIM SHARED FunctionList(131, 2) AS STRING
DIM SHARED VariableList(131, 2) AS STRING
DIM SHARED FunctionListScope(131, 2, 24) AS STRING
DIM SHARED VariableListScope(131, 2, 24) AS STRING

'kglob = 0
'jglob = 0

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

' CPP: STARTSKIP

DIM kglob AS INTEGER
DIM jglob AS INTEGER
kglob = 0
jglob = 0

'\\var document;
'\\var FunctionList = new Array(101);
'\\var VariableList = new Array(101);
'\\var FunctionListScope = new Array(101);
'\\var VariableListScope = new Array(101);

'\\(function () {
'\\    "use strict";
'\\for (kglob = 1; kglob <= 101; kglob += 1) {
'\\    FunctionList[kglob] = new Array(2);
'\\}
'\\for (kglob = 1; kglob <= 101; kglob += 1) {
'\\    VariableList[kglob] = new Array(2);
'\\}
'\\for (kglob = 1; kglob <= 101; kglob += 1) {
'\\    FunctionListScope[kglob] = new Array(2);
'\\}
'\\for (kglob = 1; kglob <= 101; kglob += 1) {
'\\    VariableListScope[kglob] = new Array(2);
'\\}
'\\for (kglob = 1; kglob <= 101; kglob += 1) {
'\\    for (jglob = 1; jglob <= 2; jglob += 1) {
'\\        FunctionListScope[kglob][jglob] = new Array(24);
'\\    }
'\\}
'\\for (kglob = 1; kglob <= 101; kglob += 1) {
'\\    for (jglob = 1; jglob <= 2; jglob += 1) {
'\\        VariableListScope[kglob][jglob] = new Array(24);
'\\    }
'\\}
' CPP: ENDSKIP

' CPP: STARTSKIP
SxriptLogoSize = 0
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "                  .      "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "    +@@@@,        @@     "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "   @@@@@@@'       @@@:   "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "  @@@@@@@@@      +@@@@@: "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "  #    @@@@#     @@@@@@  "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "       ,@@@@    .++@@@+  "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "        @@@@#   @    @   "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "        ;@@@@  ,@        "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "         @@@@# @         "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "         #@@@@'@         "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "          @@@@@,         "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "      '###@@@@@#######   "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "      @@@@@@@@@@@@@@@.   "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "     .@@@@@@@@@@@@@@@    "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "      ``....@@@@#        "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "           ,@@@@@        "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "           @`@@@@#       "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "          `@ @@@@@       "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "          @;  @@@@'      "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "          @   @@@@@      "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "    @;   #+   `@@@@'     "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "   ,@@@' @     @@@@@     "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "   @@@@@@@     .@@@@; +  "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "   @@@@@@       @@@@@@+  "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "    +@@@@       .@@@@#   "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "      @@.        #@@@    "
SxriptLogoSize = SxriptLogoSize + 1
SxriptLogoText(SxriptLogoSize) = "       `          `+     "

BrackList = "`',()<>[]{}"
OpList = "!^*/%+-=&|~?"
EscapeChar = "\"

FunctionListSize = 0
VariableListSize = 0
ScopeLevel = 1

' JavaScript: STARTSKIP
DIM kt AS INTEGER
DIM at AS STRING
DIM bt AS STRING
at = "<"
FOR kt = 1 TO SxriptLogoSize
    bt = SxriptLogoText(kt)
    bt = ReplaceRaw$(bt, "`", CHR$(26))
    bt = ReplaceRaw$(bt, CHR$(26), EscapeChar + "`")
    bt = ReplaceRaw$(bt, "'", CHR$(26))
    bt = ReplaceRaw$(bt, CHR$(26), EscapeChar + "'")
    bt = "`" + bt + "'"
    at = at + bt
    IF (kt < SxriptLogoSize) THEN
        at = at + ","
    END IF
NEXT
at = at + ">"
'at = SxriptEval$("let(sxlogo,apply($({[x]\n})," + at + "))")
' JavaScript: ENDSKIP

'\\}());
' CPP: ENDSKIP

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

' BEGIN sxript.bm
' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

'REM $Include: 'sxmath.bi'
'REM $Include: 'sxript.bi'
'REM $Include: 'sxmath.bm'

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

' 2019-01-22 Experimenting with ManageWhiteSpace.
' 2018-12-12 Passing "goto" target through SxriptEval.
'            Added switch to show or hide details on all plots.
' 2018-12-11 Upgraded x-axis labeling in existing plotascii function.
' 2018-12-10 Added scatter plot function.
' 2021-01-13 Improved plotascii function to be safer in c++ implementation.
'            To do: Test and apply similar to scatter plot.
' 2021-01-27 Added support for abs().
'            Added support for sgn().
'            Added support for sqrt().
' 2021-01-30 Fixed handling of chr(32).
' 2021-01-31 Changing behavior of quote subtraction.
'            Added unf() primitive.
' 2021-02-04 Modified vector bitwise handling.
' 2021-02-05 Expanded quote-number multiplication via operator.
'            Expanded vector-number multiplication via operator.
'            Expanded vector-quote multiplication via operator.
' 2021-02-09 Fixed bug in scientific notation evident in JS/C++ implementations.
'            Added trivial "identity" functions.
' 2021-02-10 Added function StructureApplyTailOp$.
' 2021-02-14 Commented part of ReplaceRaw$.
' 2021-02-25 Replacing "}{" with nothing.
' 2021-03-23 Fixed 0! bug.
' 2022-01-02 Changed the way cosine handles non-numerical input (experimental).
' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION CountElements (TheStringIn AS STRING, TheSeparatorIn AS STRING)
    DIM TheReturn AS INTEGER
    DIM TheString AS STRING
    DIM TheSeparator AS STRING
    TheString = TheStringIn
    TheSeparator = TheSeparatorIn
    DIM c AS STRING
    DIM d AS STRING
    DIM k AS INTEGER
    DIM BrackBal AS INTEGER
    DIM QuoteBal AS INTEGER
    BrackBal = 0
    QuoteBal = 0
    TheReturn = 1
    IF (INSTR(TheString, TheSeparator) > 0) THEN
        k = 1
        DO WHILE (k <= LEN(TheString))
            c = MID$(TheString, k, 1)
            IF (k > 1) THEN
                d = MID$(TheString, k - 1, 1)
            END IF
            IF (d <> EscapeChar) THEN
                IF (c = "`") THEN
                    QuoteBal = QuoteBal + 1
                END IF
                IF (c = "'") THEN
                    QuoteBal = QuoteBal - 1
                END IF
                IF (QuoteBal = 0) THEN
                    IF (INSTR("(<{[", c) > 0) THEN
                        BrackBal = BrackBal + 1
                    END IF
                    IF (INSTR(")>}]", c) > 0) THEN
                        BrackBal = BrackBal - 1
                    END IF
                    IF (BrackBal = 1) THEN
                        IF (c = TheSeparator) THEN
                            TheReturn = TheReturn + 1
                        END IF
                    END IF
                END IF
            END IF
            k = k + 1
        LOOP
    END IF
    CountElements = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION FindMatching (TheStringIn AS STRING, TheSymbolIn AS STRING, TheStartPosIn AS INTEGER)
    DIM TheReturn AS INTEGER
    DIM TheString AS STRING
    DIM TheSymbol AS STRING
    DIM TheStartPos AS INTEGER
    TheString = TheStringIn
    TheSymbol = TheSymbolIn
    TheStartPos = TheStartPosIn
    DIM c AS STRING
    DIM d AS STRING
    DIM k AS INTEGER
    DIM ClosingSymbol AS STRING
    DIM TheDirection AS INTEGER
    DIM TheEndPos AS INTEGER
    DIM BrackBal AS INTEGER
    DIM QuoteBal AS INTEGER
    ClosingSymbol = ""
    TheDirection = 0
    BrackBal = 0
    QuoteBal = 0
    TheEndPos = 0
    TheReturn = -1
    c = "`(<{["
    d = "')>}]"
    k = INSTR(c, TheSymbol)
    IF (k > 0) THEN
        ClosingSymbol = MID$(d, k, 1)
        TheDirection = 1
        TheEndPos = LEN(TheString)
    END IF

    k = INSTR(d, TheSymbol)
    IF (k > 0) THEN
        ClosingSymbol = MID$(c, k, 1)
        TheDirection = -1
        TheEndPos = 1
    END IF

    k = TheStartPos
    DO WHILE (1 = 1)
        c = MID$(TheString, k, 1)
        IF (k > 1) THEN
            d = MID$(TheString, k - 1, 1)
        END IF
        IF (d <> EscapeChar) THEN
            IF (c = "`") THEN
                QuoteBal = QuoteBal + 1
            END IF
            IF (c = "'") THEN
                QuoteBal = QuoteBal - 1
            END IF
            IF (QuoteBal = 0) THEN
                IF (INSTR("(<{[", c) > 0) THEN
                    BrackBal = BrackBal + 1
                END IF
                IF (INSTR(")>}]", c) > 0) THEN
                    BrackBal = BrackBal - 1
                END IF
                IF (BrackBal = 0) THEN
                    IF (c = ClosingSymbol) THEN
                        TheReturn = k
                        EXIT DO
                    END IF
                END IF
            END IF
        END IF

        IF (k = TheEndPos) THEN
            EXIT DO
        END IF
        k = k + TheDirection
        IF (k = TheStartPos) THEN
            EXIT DO
        END IF
    LOOP
    FindMatching = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION FindMostEmbedded (TheStringIn AS STRING)
    DIM TheReturn AS INTEGER
    DIM TheString AS STRING
    DIM MainBal AS INTEGER
    DIM QuoteBal AS INTEGER
    DIM AltBal AS INTEGER
    DIM MainCrit AS INTEGER
    DIM LeftPos AS INTEGER
    DIM k AS INTEGER
    DIM c AS STRING
    DIM d AS STRING
    TheString = TheStringIn
    TheReturn = 0
    MainBal = 0
    QuoteBal = 0
    AltBal = 0
    MainCrit = 0
    LeftPos = -1
    IF ((INSTR(TheString, "(") > 0) AND (INSTR(TheString, ")") > 0)) THEN
        k = 1
        DO WHILE (k <= LEN(TheString))
            c = MID$(TheString, k, 1)
            IF (k > 1) THEN
                d = MID$(TheString, k - 1, 1)
            END IF
            IF (d <> EscapeChar) THEN
                IF (c = "`") THEN
                    QuoteBal = QuoteBal + 1
                END IF
                IF (c = "'") THEN
                    QuoteBal = QuoteBal - 1
                END IF
                IF (QuoteBal = 0) THEN
                    IF (INSTR("<{[", c) > 0) THEN
                        AltBal = AltBal + 1
                    END IF
                    IF (INSTR(">}]", c) > 0) THEN
                        AltBal = AltBal - 1
                    END IF
                    IF (AltBal = 0) THEN
                        IF (c = "(") THEN
                            MainBal = MainBal + 1
                            IF (MainBal > MainCrit) THEN
                                MainCrit = MainBal
                                LeftPos = k
                            END IF
                        END IF
                        IF (c = ")") THEN
                            MainBal = MainBal - 1
                        END IF
                    END IF
                END IF
            END IF
            k = k + 1
        LOOP
        TheReturn = LeftPos
    ELSE
        TheReturn = -1
    END IF
    FindMostEmbedded = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION GetSeparatorPos (TheStringIn AS STRING, TheSeparatorTypeIn AS STRING, TheSeparatorNumIn AS INTEGER, TheStartPosIn AS INTEGER)
    DIM TheReturn AS INTEGER
    DIM TheString AS STRING
    DIM TheSeparatorType AS STRING
    DIM TheSeparatorNum AS INTEGER
    DIM TheStartPos AS INTEGER
    DIM c AS STRING
    DIM d AS STRING
    DIM k AS INTEGER
    DIM BrackBal AS INTEGER
    DIM QuoteBal AS INTEGER
    DIM SepCounter AS INTEGER
    DIM BrackConst AS INTEGER
    TheString = TheStringIn
    TheSeparatorType = TheSeparatorTypeIn
    TheSeparatorNum = TheSeparatorNumIn
    TheStartPos = TheStartPosIn
    BrackBal = 0
    QuoteBal = 0
    SepCounter = 0
    TheReturn = -1
    IF (TheStartPos > 1) THEN
        BrackConst = 0
        TheSeparatorNum = 1
    ELSE
        BrackConst = 1
    END IF
    IF (INSTR(TheString, TheSeparatorType) > 0) THEN
        k = TheStartPos
        DO WHILE (k <= LEN(TheString))
            c = MID$(TheString, k, 1)
            IF (k > 1) THEN
                d = MID$(TheString, k - 1, 1)
            END IF
            IF (d <> EscapeChar) THEN
                IF (c = "`") THEN
                    QuoteBal = QuoteBal + 1
                END IF
                IF (c = "'") THEN
                    QuoteBal = QuoteBal - 1
                END IF
                IF (QuoteBal = 0) THEN
                    IF (INSTR("(<{[", c) > 0) THEN
                        BrackBal = BrackBal + 1
                    END IF
                    IF (INSTR(")>}]", c) > 0) THEN
                        BrackBal = BrackBal - 1
                    END IF
                    IF (BrackBal = BrackConst) THEN
                        IF (c = TheSeparatorType) THEN
                            SepCounter = SepCounter + 1
                            IF (SepCounter = TheSeparatorNum) THEN
                                TheReturn = k
                                EXIT DO
                            END IF
                        END IF
                    END IF
                END IF
            END IF
            k = k + 1
        LOOP
    END IF
    GetSeparatorPos = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ManageWhiteSpace$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM QuoteBal AS INTEGER
    DIM k AS INTEGER
    DIM c AS STRING
    DIM d AS STRING
    TheString = TheStringIn
    TheReturn = ""
    QuoteBal = 0
    d = ""
    IF ((INSTR(TheString, " ") > 0) OR (INSTR(TheString, CHR$(9)) > 0) OR (INSTR(TheString, CHR$(10)) > 0) OR (INSTR(TheString, CHR$(13)) > 0)) THEN
        k = 1
        DO WHILE (k <= LEN(TheString))
            c = MID$(TheString, k, 1)
            IF (k > 1) THEN
                d = MID$(TheString, k - 1, 1)
            END IF
            IF (d <> EscapeChar) THEN
                IF (c = "`") THEN
                    QuoteBal = QuoteBal + 1
                END IF
                IF (c = "'") THEN
                    QuoteBal = QuoteBal - 1
                END IF
                IF (QuoteBal = 0) THEN
                    IF ((c <> " ") AND (c <> CHR$(9)) AND (c <> CHR$(10)) AND (c <> CHR$(13))) THEN
                        TheReturn = TheReturn + c
                    END IF
                ELSE
                    TheReturn = TheReturn + c
                END IF
            ELSE
                TheReturn = TheReturn + c
            END IF
            k = k + 1
        LOOP
    ELSE
        TheReturn = TheString
    END IF
    ManageWhiteSpace$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION RemoveWrapping$ (TheStringIn AS STRING, TheWrapIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TheWrap AS STRING
    DIM TheWidth AS INTEGER
    TheString = TheStringIn
    TheWrap = TheWrapIn
    TheReturn = TheString
    TheWidth = LEN(TheWrap) / 2
    IF (TheWrap <> "") THEN
        IF (LEFT$(TheString, TheWidth) = LEFT$(TheWrap, TheWidth)) THEN
            IF (RIGHT$(TheReturn, TheWidth) = RIGHT$(TheWrap, TheWidth)) THEN
                TheReturn = RIGHT$(TheReturn, LEN(TheReturn) - TheWidth)
                TheReturn = LEFT$(TheReturn, LEN(TheReturn) - TheWidth)
            END IF
        END IF
    END IF
    RemoveWrapping$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ReplaceWord$ (TheStringIn AS STRING, TheWordIn AS STRING, TheReplacementIn AS STRING, CurlyDepthIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TheWord AS STRING
    DIM TheReplacement AS STRING
    DIM CurlyDepth AS INTEGER
    DIM QuoteBal AS INTEGER
    DIM CurlyBal AS INTEGER
    DIM k AS INTEGER
    DIM c AS STRING
    DIM d AS STRING
    TheString = TheStringIn
    TheWord = TheWordIn
    TheReplacement = TheReplacementIn
    CurlyDepth = CurlyDepthIn
    TheReturn = TheString
    IF (INSTR(TheReturn, TheWord) > 0) THEN
        QuoteBal = 0
        CurlyBal = 0
        k = 1
        DO WHILE (k <= LEN(TheReturn) - LEN(TheWord) + 1)
            c = MID$(TheReturn, k, 1)
            IF (k > 1) THEN
                d = MID$(TheString, k - 1, 1)
            END IF
            IF (d <> EscapeChar) THEN
                IF (c = "`") THEN
                    QuoteBal = QuoteBal + 1
                END IF
                IF (c = "'") THEN
                    QuoteBal = QuoteBal - 1
                END IF
                IF (QuoteBal = 0) THEN
                    IF (CurlyDepth > -1) THEN
                        IF (c = "{") THEN
                            CurlyBal = CurlyBal + 1
                        END IF
                        IF (c = "}") THEN
                            CurlyBal = CurlyBal - 1
                        END IF
                    ELSE
                        CurlyBal = CurlyDepth
                    END IF
                    IF (CurlyBal <= CurlyDepth) THEN
                        c = MID$(TheReturn, k, LEN(TheWord))
                        IF (c = TheWord) THEN
                            TheReturn = LEFT$(TheReturn, k - 1) + TheReplacement + RIGHT$(TheReturn, LEN(TheReturn) - k - LEN(TheWord) + 1)
                            EXIT DO
                        END IF
                    END IF
                END IF
            END IF
            k = k + 1
        LOOP
    END IF
    IF ((INSTR(TheReturn, TheWord) > 0) AND (TheReturn <> TheString)) THEN
        TheReturn = ReplaceWord$(TheReturn, TheWord, TheReplacement, CurlyDepth)
    END IF
    ReplaceWord$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ReplaceRaw$ (TheStringIn AS STRING, TheWordIn AS STRING, TheReplacementIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TheWord AS STRING
    DIM TheReplacement AS STRING
    DIM CurlyBal AS INTEGER
    DIM k AS INTEGER
    DIM c AS STRING
    TheString = TheStringIn
    TheWord = TheWordIn
    TheReplacement = TheReplacementIn
    TheReturn = TheString
    IF (INSTR(TheReturn, TheWord) > 0) THEN
        CurlyBal = 0
        FOR k = 1 TO LEN(TheReturn) - LEN(TheWord) + 1
            c = MID$(TheReturn, k, LEN(TheWord))
            'IF (c = "{") THEN
            '    CurlyBal = CurlyBal + 1
            'END IF
            'IF (c = "}") THEN
            '    CurlyBal = CurlyBal - 1
            'END IF
            'IF (CurlyBal = 0) THEN
            IF (c = TheWord) THEN
                TheReturn = LEFT$(TheReturn, k - 1) + TheReplacement + RIGHT$(TheReturn, LEN(TheReturn) - k - LEN(TheWord) + 1)
                EXIT FOR
            END IF
            'END IF
        NEXT
    END IF
    IF ((INSTR(TheReturn, TheWord) > 0) AND (TheReturn <> TheString)) THEN
        TheReturn = ReplaceRaw$(TheReturn, TheWord, TheReplacement)
    END IF
    ReplaceRaw$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ScanForName (TheStringIn AS STRING, TheCritPosIn AS INTEGER, TheSwitchIn AS STRING)
    ' Returns the position of the beginning of a word or function name or number.
    DIM TheReturn AS INTEGER
    DIM TheString AS STRING
    DIM TheSwitch AS STRING
    DIM TheCritPos AS INTEGER
    DIM TheNaughtyList AS STRING
    DIM c AS STRING
    DIM k AS INTEGER
    DIM j AS INTEGER
    TheString = TheStringIn
    TheSwitch = TheSwitchIn
    TheCritPos = TheCritPosIn
    TheNaughtyList = BrackList + OpList
    TheReturn = -1
    IF (TheSwitch = "left") THEN
        FOR k = TheCritPos - 1 TO 1 STEP -1
            c = MID$(TheString, k, 1)
            FOR j = 1 TO LEN(TheNaughtyList)
                IF (c = MID$(TheNaughtyList, j, 1)) THEN
                    TheReturn = k + 1
                    EXIT FOR
                END IF
            NEXT
            IF (TheReturn > -1) THEN
                EXIT FOR
            END IF
        NEXT
        IF (TheReturn = -1) THEN
            TheReturn = 1
        END IF
    END IF
    IF (TheSwitch = "right") THEN
        FOR k = TheCritPos + 1 TO LEN(TheString)
            c = MID$(TheString, k, 1)
            FOR j = 1 TO LEN(TheNaughtyList)
                IF (c = MID$(TheNaughtyList, j, 1)) THEN
                    TheReturn = k - 1
                END IF
            NEXT
            IF (TheReturn > -1) THEN
                EXIT FOR
            END IF
        NEXT
        IF (TheReturn = -1) THEN
            TheReturn = LEN(TheString)
        END IF
    END IF
    ScanForName = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ScanForOperator (TheStringIn AS STRING, TheSymbolIn AS STRING)
    DIM TheReturn AS INTEGER
    DIM TheString AS STRING
    DIM TheSymbol AS STRING
    TheString = TheStringIn
    TheSymbol = TheSymbolIn
    DIM BrackBal AS INTEGER
    DIM QuoteBal AS INTEGER
    DIM k AS INTEGER
    DIM c AS STRING
    DIM d AS STRING
    BrackBal = 0
    QuoteBal = 0
    TheReturn = -1
    IF (INSTR(TheString, TheSymbol) > 0) THEN
        k = LEN(TheString)
        DO WHILE (k >= 1)
            c = MID$(TheString, k, 1)
            IF (k > 1) THEN
                d = MID$(TheString, k - 1, 1)
            END IF
            IF (d <> EscapeChar) THEN
                IF (c = "`") THEN
                    QuoteBal = QuoteBal + 1
                END IF
                IF (c = "'") THEN
                    QuoteBal = QuoteBal - 1
                END IF
                IF (QuoteBal = 0) THEN
                    IF (INSTR("(<{[", c) > 0) THEN
                        BrackBal = BrackBal + 1
                    END IF
                    IF (INSTR(")>}]", c) > 0) THEN
                        BrackBal = BrackBal - 1
                    END IF
                    IF (BrackBal = 0) THEN
                        c = "_yes"
                        IF (MID$(TheString, k, LEN(TheSymbol)) = TheSymbol) THEN
                            ' Prevents leading "+" and "-" signs from causing false triggers.
                            IF ((TheSymbol = "+") OR (TheSymbol = "-")) THEN
                                IF (k = 1) THEN
                                    c = "_no"
                                END IF
                            END IF
                            IF (k > 1) THEN
                                IF (INSTR(OpList, MID$(TheString, k - 1, 1)) > 0) THEN
                                    c = "_no"
                                END IF
                            END IF
                            IF (c = "_yes") THEN
                                TheReturn = k
                                EXIT DO
                            END IF
                        END IF
                    END IF
                END IF
            END IF
            k = k - 1
        LOOP
    END IF
    ScanForOperator = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION TypeCheck$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    TheString = TheStringIn
    IF (LEN(TheString) > 1) THEN
        TheString = LEFT$(TheString, 1)
    END IF
    TheReturn = ""
    IF (TheReturn = "") THEN
        IF (INSTR("+-.0123456789", TheString) > 0) THEN
            TheReturn = "number"
        END IF
    END IF
    IF (TheReturn = "") THEN
        IF (INSTR("()", TheString) > 0) THEN
            TheReturn = "paren"
        END IF
        IF (INSTR("`'", TheString) > 0) THEN
            TheReturn = "quote"
        END IF
        IF (INSTR("<>", TheString) > 0) THEN
            TheReturn = "vector"
        END IF
        IF (INSTR("{}", TheString) > 0) THEN
            TheReturn = "occult"
        END IF
        IF (INSTR("[]", TheString) > 0) THEN
            TheReturn = "symbol"
        END IF
        IF (TheString = ",") THEN
            TheReturn = "separator"
        END IF
    END IF
    IF (TheReturn = "") THEN
        TheReturn = "word"
    END IF
    TypeCheck$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ManageOperators$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    TheString = TheStringIn
    TheReturn = TheString
    TheReturn = ReplaceWord$(TheReturn, "^+", "^", -1)
    TheReturn = ReplaceWord$(TheReturn, "*+", "*", -1)
    TheReturn = ReplaceWord$(TheReturn, "/+", "/", -1)
    TheReturn = ReplaceWord$(TheReturn, "++", "+", -1)
    TheReturn = ReplaceWord$(TheReturn, "+-", "-", -1)
    TheReturn = ReplaceWord$(TheReturn, "-+", "-", -1)
    TheReturn = ReplaceWord$(TheReturn, "--", "+", -1)
    '''
    TheReturn = ReplaceWord$(TheReturn, "}{", "", -1)
    '''
    IF (TheReturn <> TheString) THEN
        TheReturn = ManageOperators$(TheReturn)
    END IF
    ManageOperators$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ReturnElement$ (TheStringIn AS STRING, TheArgNumberIn AS INTEGER, TheSeparatorIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TheArgNumber AS INTEGER
    DIM TheSeparator AS STRING
    DIM n AS INTEGER
    DIM m AS INTEGER
    TheString = TheStringIn
    TheArgNumber = TheArgNumberIn
    TheSeparator = TheSeparatorIn
    TheReturn = "_null"
    n = CountElements(TheString, TheSeparator)
    ' If seeking first argument:
    IF (TheReturn = "_null") THEN
        IF (TheArgNumber = 1) THEN
            IF (n = 1) THEN
                IF (TheSeparator = ",") THEN
                    TheReturn = RemoveWrapping$(TheString, "<>")
                END IF
                IF (TheSeparator = ":") THEN
                    TheReturn = TheString
                END IF
            END IF
            IF (n > 1) THEN
                TheReturn = TheString
                TheReturn = LEFT$(TheReturn, GetSeparatorPos(TheReturn, TheSeparator, 1, 1) - 1)
                TheReturn = RIGHT$(TheReturn, LEN(TheReturn) - 1)
            END IF
        END IF
    END IF
    ' If seeking last argument:
    IF (TheReturn = "_null") THEN
        IF (TheArgNumber = n) THEN
            TheReturn = TheString
            TheReturn = RIGHT$(TheReturn, LEN(TheReturn) - GetSeparatorPos(TheReturn, TheSeparator, n - 1, 1))
            TheReturn = LEFT$(TheReturn, LEN(TheReturn) - 1)
        END IF
    END IF
    ' Must have three or more arguments:
    IF (TheReturn = "_null") THEN
        TheReturn = TheString
        n = GetSeparatorPos(TheReturn, TheSeparator, TheArgNumber - 1, 1)
        m = GetSeparatorPos(TheReturn, TheSeparator, TheArgNumber, n + 1)
        TheReturn = MID$(TheReturn, n + 1, (m - n) - 1)
    END IF
    ReturnElement$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION VectorASMD$ (Vector1In AS STRING, Vector2In AS STRING, TheOperatorIn AS STRING)
    DIM TheReturn AS STRING
    DIM Vector1 AS STRING
    DIM Vector2 AS STRING
    DIM TheOperator AS STRING
    DIM size AS INTEGER
    DIM size2 AS INTEGER
    DIM k AS INTEGER
    Vector1 = Vector1In
    Vector2 = Vector2In
    TheOperator = TheOperatorIn
    size = CountElements(Vector1, ",")
    size2 = CountElements(Vector2, ",")
    IF (size > size2) THEN
        size = size2
    END IF
    TheReturn = "<"
    FOR k = 1 TO size
        TheReturn = TheReturn + "(" + ReturnElement$(Vector1, k, ",") + " " + TheOperator + " " + ReturnElement$(Vector2, k, ",") + ")"
        IF (k < size) THEN
            TheReturn = TheReturn + ","
        END IF
    NEXT
    TheReturn = TheReturn + ">"
    VectorASMD$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION InternalEval$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    TheString = TheStringIn
    TheString = ManageWhiteSpace$(TheString)
    TheReturn = ""
    DO WHILE (TheString <> TheReturn)
        TheReturn = TheString
        TheString = EvalStep$(TheString)
    LOOP
    TheReturn = TheString
    InternalEval$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION StructureEval$ (TheVectorIn AS STRING, TheLeftBrackIn AS STRING, TheRightBrackIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheVector AS STRING
    DIM TheLeftBrack AS STRING
    DIM TheRightBrack AS STRING
    DIM c AS STRING
    DIM c1 AS STRING
    DIM c2 AS STRING
    DIM d AS STRING
    DIM k AS INTEGER
    TheVector = TheVectorIn
    TheLeftBrack = TheLeftBrackIn
    TheRightBrack = TheRightBrackIn
    d = ""
    k = FindMatching(TheVector, TheLeftBrack, 1)
    c1 = LEFT$(TheVector, k)
    c1 = RemoveWrapping$(c1, TheLeftBrack + TheRightBrack)
    c2 = RIGHT$(TheVector, LEN(TheVector) - k)
    DO WHILE (1 = 1)
        k = GetSeparatorPos(TheLeftBrack + c1 + TheRightBrack, ",", 1, 1) - 1
        IF (k > -1) THEN
            c = LEFT$(c1, k - 1)
            c = InternalEval$(c)
            d = d + c + ","
            c1 = RIGHT$(c1, LEN(c1) - k)
        ELSE
            c = c1
            c = InternalEval$(c)
            d = d + c
            EXIT DO
        END IF
    LOOP
    d = TheLeftBrack + d + TheRightBrack
    TheReturn = d + InternalEval$(c2)
    StructureEval$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION PlotASCII$ (TheFuncIn AS STRING, LowLimitIn AS DOUBLE, HighLimitIn AS DOUBLE, StepSizeIn AS DOUBLE, WindowWidthIn AS INTEGER, WindowHeightIn AS INTEGER, DetailSwitchIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheFunc AS STRING
    DIM LowLimit AS DOUBLE
    DIM HighLimit AS DOUBLE
    DIM StepSize AS DOUBLE
    DIM WindowWidth AS INTEGER
    DIM WindowHeight AS INTEGER
    DIM DetailSwitch AS INTEGER
    TheFunc = TheFuncIn
    LowLimit = LowLimitIn
    HighLimit = HighLimitIn
    StepSize = StepSizeIn
    WindowWidth = WindowWidthIn
    WindowHeight = WindowHeightIn
    DetailSwitch = DetailSwitchIn
    DIM j AS DOUBLE
    DIM k AS INTEGER
    DIM kd AS DOUBLE
    DIM n AS INTEGER
    DIM NumPoints AS INTEGER
    DIM tmp AS STRING
    DIM c AS STRING
    DIM d AS STRING
    DIM xmin AS DOUBLE
    DIM xmax AS DOUBLE
    DIM ymin AS DOUBLE
    DIM ymax AS DOUBLE
    DIM xave AS DOUBLE
    DIM yave AS DOUBLE
    DIM xzoom AS DOUBLE
    DIM yzoom AS DOUBLE
    DIM xtext AS INTEGER
    DIM ytext AS INTEGER
    DIM x AS DOUBLE
    DIM y AS DOUBLE

    NumPoints = 2 + (HighLimit - LowLimit) / (StepSize)

    ' Factors of +1 added to accomodate C++ implementation.
    DIM PointArrayX(NumPoints + 1) AS DOUBLE
    DIM PointArrayY(NumPoints + 1) AS DOUBLE

    IF (WindowWidth = 0) THEN
        WindowWidth = 25
    END IF
    IF (WindowHeight = 0) THEN
        WindowHeight = 10
    END IF

    DIM AsciiPlane(WindowWidth + 1, WindowHeight + 1) AS STRING

    ' CPP: STARTSKIP
    '\\for (k = 1; k <= WindowWidth; k += 1) {
    '\\    AsciiPlane[k] = new Array(WindowHeight);
    '\\}
    ' CPP: ENDSKIP

    FOR k = 1 TO WindowHeight
        FOR n = 1 TO WindowWidth
            AsciiPlane(n, k) = "_"
        NEXT
    NEXT

    xmin = LowLimit
    xmax = HighLimit
    ymin = 999999
    ymax = -999999
    k = 0
    FOR j = LowLimit TO HighLimit + StepSize STEP StepSize
        tmp = TheFunc + "(" + LTRIM$(RTRIM$(STR$(j))) + ")"
        tmp = InternalEval$(tmp)
        y = VAL(tmp)
        IF (y > ymax) THEN
            ymax = y
        END IF
        IF (y < ymin) THEN
            ymin = y
        END IF
        k = k + 1
        PointArrayX(k) = j
        PointArrayY(k) = y
    NEXT
    NumPoints = k

    yave = (1 / 2) * (ymax + ymin)
    xave = (1 / 2) * (HighLimit + LowLimit)
    yzoom = (0.85 + 0.15) * ABS((WindowHeight) / (ymax - ymin))
    xzoom = (0.85 + 0.15) * ABS((WindowWidth) / (HighLimit - LowLimit))
    FOR k = 1 TO NumPoints
        x = PointArrayX(k)
        y = PointArrayY(k)
        x = (x - xave) * xzoom
        y = (y - yave) * yzoom
        xtext = INT(x + WindowWidth / 2)
        ytext = INT(WindowHeight / 2 - y)
        tmp = "*"
        IF (xtext < 1) THEN
            tmp = "<"
            xtext = 1
        END IF
        IF (xtext > WindowWidth) THEN
            tmp = ">"
            xtext = WindowWidth
        END IF
        IF (ytext < 1) THEN
            tmp = "^"
            ytext = 1
        END IF
        IF (ytext > WindowHeight) THEN
            tmp = "."
            ytext = WindowHeight
        END IF
        AsciiPlane(xtext, ytext) = tmp
    NEXT

    FOR k = 1 TO FunctionListSize
        IF (TheFunc = FunctionList(k, 1)) THEN
            TheFunc = FunctionList(k, 2)
        END IF
    NEXT

    TheReturn = "`"
    TheReturn = TheReturn + CHR$(10)
    IF (DetailSwitch = 1) THEN
        TheReturn = TheReturn + TheFunc + " {" + LTRIM$(RTRIM$(STR$(LowLimit))) + ", " + LTRIM$(RTRIM$(STR$(HighLimit))) + "}"
        TheReturn = TheReturn + CHR$(10)
    END IF
    FOR k = 1 TO WindowHeight
        kd = k

        ' JavaScript: STARTSKIP
        '\\kd = double(k);
        ' JavaScript: ENDSKIP

        tmp = ""
        FOR n = 1 TO WindowWidth
            TheReturn = TheReturn + AsciiPlane(n, k)
        NEXT
        IF (DetailSwitch = 1) THEN
            TheReturn = TheReturn + STR$(ymax - ((kd - 1) / WindowHeight) * (ymax - ymin) * (WindowHeight / (WindowHeight - 1)))
        END IF
        IF (k < WindowHeight) THEN
            TheReturn = TheReturn + CHR$(10)
        END IF
    NEXT

    IF (DetailSwitch = 1) THEN
        tmp = ""
        tmp = tmp + CHR$(10)
        FOR k = 1 TO 10
            FOR j = WindowWidth TO 1 STEP -1
                c = STR$(xmax - ((j - 1) / WindowWidth) * (xmax - xmin) * (WindowWidth / (WindowWidth - 1)))
                c = InternalEval$("1 * " + c)
                IF (k <= LEN(c)) THEN
                    d = MID$(c, k, 1)
                    IF (d = "") THEN
                        d = "0"
                    END IF
                    tmp = tmp + d
                END IF
            NEXT
            tmp = tmp + CHR$(10)
        NEXT
        TheReturn = TheReturn + CHR$(10)
        TheReturn = TheReturn + tmp
    END IF

    TheReturn = TheReturn + CHR$(10)
    TheReturn = TheReturn + "'"
    PlotASCII$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION PlotScatter$ (TheListIn AS STRING, WindowWidthIn AS INTEGER, WindowHeightIn AS INTEGER, DetailSwitchIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheList AS STRING
    DIM WindowWidth AS INTEGER
    DIM WindowHeight AS INTEGER
    DIM DetailSwitch AS INTEGER
    TheList = TheListIn
    WindowWidth = WindowWidthIn
    WindowHeight = WindowHeightIn
    DetailSwitch = DetailSwitchIn
    DIM j AS DOUBLE
    DIM k AS INTEGER
    DIM n AS INTEGER
    DIM NumPoints AS INTEGER
    DIM tmp AS STRING
    DIM c AS STRING
    DIM d AS STRING
    DIM xmin AS DOUBLE
    DIM xmax AS DOUBLE
    DIM ymin AS DOUBLE
    DIM ymax AS DOUBLE
    DIM xave AS DOUBLE
    DIM yave AS DOUBLE
    DIM xzoom AS DOUBLE
    DIM yzoom AS DOUBLE
    DIM xtext AS INTEGER
    DIM ytext AS INTEGER
    DIM x AS DOUBLE
    DIM y AS DOUBLE

    NumPoints = CountElements(TheList, ",")

    ' Factors of +1 added to accomodate C++ implementation.
    DIM PointArrayX(NumPoints + 1) AS DOUBLE
    DIM PointArrayY(NumPoints + 1) AS DOUBLE

    IF (WindowWidth = 0) THEN
        WindowWidth = 25
    END IF
    IF (WindowHeight = 0) THEN
        WindowHeight = 10
    END IF

    DIM AsciiPlane(WindowWidth + 1, WindowHeight + 1) AS STRING

    ' CPP: STARTSKIP
    '\\for (k = 1; k <= WindowWidth; k += 1) {
    '\\    AsciiPlane[k] = new Array(WindowHeight);
    '\\}
    ' CPP: ENDSKIP

    FOR k = 1 TO WindowHeight
        FOR n = 1 TO WindowWidth
            AsciiPlane(n, k) = " "
        NEXT
    NEXT

    xmin = 999999
    xmax = -999999
    ymin = 999999
    ymax = -999999
    FOR k = 1 TO NumPoints
        tmp = ReturnElement$(TheList, k, ",")
        x = VAL(ReturnElement$(tmp, 1, ","))
        y = VAL(ReturnElement$(tmp, 2, ","))
        IF (x > xmax) THEN
            xmax = x
        END IF
        IF (x < xmin) THEN
            xmin = x
        END IF
        IF (y > ymax) THEN
            ymax = y
        END IF
        IF (y < ymin) THEN
            ymin = y
        END IF
        PointArrayX(k) = x
        PointArrayY(k) = y
    NEXT

    yave = (1 / 2) * (ymax + ymin)
    xave = (1 / 2) * (xmax + xmin)
    yzoom = (0.85 + 0.15) * ABS((WindowHeight) / (ymax - ymin))
    xzoom = (0.85 + 0.15) * ABS((WindowWidth) / (xmax - xmin))
    FOR k = 1 TO NumPoints
        x = PointArrayX(k)
        y = PointArrayY(k)
        x = (x - xave) * xzoom
        y = (y - yave) * yzoom
        xtext = INT(x + WindowWidth / 2)
        ytext = INT(WindowHeight / 2 - y)
        tmp = "*"
        IF (xtext < 1) THEN
            tmp = "*"
            xtext = 1
        END IF
        IF (xtext > WindowWidth) THEN
            tmp = "*"
            xtext = WindowWidth
        END IF
        IF (ytext < 1) THEN
            tmp = "*"
            ytext = 1
        END IF
        IF (ytext > WindowHeight) THEN
            tmp = "*"
            ytext = WindowHeight
        END IF
        AsciiPlane(xtext, ytext) = tmp
    NEXT

    TheReturn = "`"
    TheReturn = TheReturn + CHR$(10)
    FOR k = 1 TO WindowHeight
        tmp = ""
        FOR n = 1 TO WindowWidth
            TheReturn = TheReturn + AsciiPlane(n, k)
        NEXT
        IF (DetailSwitch = 1) THEN
            TheReturn = TheReturn + STR$(ymax - ((k - 1) / WindowHeight) * (ymax - ymin) * (WindowHeight / (WindowHeight - 1)))
        END IF
        IF (k < WindowHeight) THEN
            TheReturn = TheReturn + CHR$(10)
        END IF
    NEXT

    IF (DetailSwitch = 1) THEN
        tmp = ""
        tmp = tmp + CHR$(10)
        FOR k = 1 TO 10
            FOR j = WindowWidth TO 1 STEP -1
                c = STR$(xmax - ((j - 1) / WindowWidth) * (xmax - xmin) * (WindowWidth / (WindowWidth - 1)))
                c = InternalEval$("1 * " + c)
                d = MID$(c, k, 1)
                IF (d = "") THEN
                    d = "0"
                END IF
                tmp = tmp + d
            NEXT
            tmp = tmp + CHR$(10)
        NEXT
        TheReturn = TheReturn + CHR$(10)
        TheReturn = TheReturn + tmp
    END IF

    TheReturn = TheReturn + CHR$(10)
    TheReturn = TheReturn + "'"
    PlotScatter$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION HistASCII$ (TheListIn AS STRING, DetailSwitchIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheList AS STRING
    DIM DetailSwitch AS INTEGER
    TheList = TheListIn
    DIM WindowHeight AS INTEGER
    DIM WindowWidth AS INTEGER
    DetailSwitch = DetailSwitchIn
    DIM j AS INTEGER
    DIM k AS INTEGER
    DIM n AS INTEGER
    DIM NumPoints AS INTEGER
    DIM tmp AS STRING
    DIM c AS STRING
    DIM d AS STRING
    DIM xmin AS DOUBLE
    DIM xmax AS DOUBLE
    DIM ymin AS DOUBLE
    DIM ymax AS DOUBLE
    DIM x AS DOUBLE
    DIM y AS DOUBLE

    NumPoints = CountElements(TheList, ",")

    ' Factors of +1 added to accomodate C++ implementation.
    DIM PointArrayX(NumPoints + 1) AS DOUBLE
    DIM PointArrayY(NumPoints + 1) AS DOUBLE

    WindowWidth = NumPoints
    WindowHeight = 10 + 1

    DIM AsciiPlane(WindowWidth + 1, WindowHeight + 1) AS STRING

    ' CPP: STARTSKIP
    '\\for (k = 1; k <= WindowWidth; k += 1) {
    '\\    AsciiPlane[k] = new Array(WindowHeight);
    '\\}
    ' CPP: ENDSKIP

    FOR k = 1 TO WindowHeight
        FOR n = 1 TO WindowWidth
            AsciiPlane(n, k) = "_"
        NEXT
    NEXT

    xmin = 999999
    xmax = -999999
    FOR j = 1 TO NumPoints
        tmp = "elem(elem(" + TheList + "," + LTRIM$(RTRIM$(STR$(j))) + "), 1)"
        tmp = InternalEval$(tmp)
        x = VAL(tmp)
        IF (x < xmin) THEN
            xmin = x
        END IF
        IF (x > xmax) THEN
            xmax = x
        END IF
        PointArrayX(j) = x
    NEXT

    ymin = 999999
    ymax = -999999
    FOR j = 1 TO NumPoints
        tmp = "elem(elem(" + TheList + "," + LTRIM$(RTRIM$(STR$(j))) + "), 2)"
        tmp = InternalEval$(tmp)
        y = VAL(tmp)
        IF (y < ymin) THEN
            ymin = y
        END IF
        IF (y > ymax) THEN
            ymax = y
        END IF
        PointArrayY(j) = y
    NEXT

    FOR k = 1 TO NumPoints
        n = INT(WindowHeight - (PointArrayY(k) * (WindowHeight - 1) / ymax))
        AsciiPlane(k, n) = "*"
    NEXT

    TheReturn = "`"
    TheReturn = TheReturn + CHR$(10)
    FOR k = 1 TO WindowHeight
        FOR n = 1 TO WindowWidth
            TheReturn = TheReturn + AsciiPlane(n, k)
        NEXT
        IF (DetailSwitch = 1) THEN
            TheReturn = TheReturn + STR$(ymax - ((k - 1) / WindowHeight) * (ymax - ymin) * (WindowHeight / (WindowHeight - 1)))
        END IF
        IF (k < WindowHeight) THEN
            TheReturn = TheReturn + CHR$(10)
        END IF
    NEXT

    IF (DetailSwitch = 1) THEN
        tmp = ""
        tmp = tmp + CHR$(10)
        FOR k = 1 TO 10
            FOR j = 1 TO NumPoints
                c = LTRIM$(RTRIM$(STR$(PointArrayX(j))))
                c = InternalEval$("1 * " + c)
                d = MID$(c, k, 1)
                IF (d = "") THEN
                    d = "0"
                END IF
                tmp = tmp + d
            NEXT
            tmp = tmp + CHR$(10)
        NEXT
        TheReturn = TheReturn + CHR$(10)
        TheReturn = TheReturn + tmp
    END IF

    TheReturn = TheReturn + CHR$(10)
    TheReturn = TheReturn + "'"
    HistASCII$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION StructureApplyFunc$ (TheVectorIn AS STRING, TheFunctionIn AS STRING, TheBracketsIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheVector AS STRING
    DIM TheFunction AS STRING
    DIM TheBrackets AS STRING
    DIM size AS INTEGER
    TheVector = TheVectorIn
    TheFunction = TheFunctionIn
    TheBrackets = TheBracketsIn
    DIM k AS INTEGER
    TheReturn = LEFT$(TheBrackets, 1)
    size = CountElements(TheVector, ",")
    FOR k = 1 TO size
        TheReturn = TheReturn + TheFunction + "(" + ReturnElement$(TheVector, k, ",") + ")"
        IF (k < size) THEN
            TheReturn = TheReturn + ","
        END IF
    NEXT
    TheReturn = TheReturn + RIGHT$(TheBrackets, 1)
    StructureApplyFunc$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION StructureApplyTailOp$ (TheVectorIn AS STRING, TheFunctionIn AS STRING, TheBracketsIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheVector AS STRING
    DIM TheFunction AS STRING
    DIM TheBrackets AS STRING
    DIM size AS INTEGER
    TheVector = TheVectorIn
    TheFunction = TheFunctionIn
    TheBrackets = TheBracketsIn
    DIM k AS INTEGER
    TheReturn = LEFT$(TheBrackets, 1)
    size = CountElements(TheVector, ",")
    FOR k = 1 TO size
        TheReturn = TheReturn + "(" + ReturnElement$(TheVector, k, ",") + TheFunction + ")"
        IF (k < size) THEN
            TheReturn = TheReturn + ","
        END IF
    NEXT
    TheReturn = TheReturn + RIGHT$(TheBrackets, 1)
    StructureApplyTailOp$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION FormatForTerminal$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    TheString = TheStringIn

    TheString = ReplaceRaw$(TheString, CHR$(26), "")

    TheString = ReplaceRaw$(TheString, EscapeChar + "t", CHR$(9))
    TheString = ReplaceRaw$(TheString, EscapeChar + "n", CHR$(10))
    TheString = ReplaceRaw$(TheString, EscapeChar + "r", CHR$(13))

    TheString = ReplaceRaw$(TheString, EscapeChar + "`", CHR$(26))
    TheString = ReplaceRaw$(TheString, "`", "")
    TheString = ReplaceRaw$(TheString, CHR$(26), "`")

    TheString = ReplaceRaw$(TheString, EscapeChar + "'", CHR$(26))
    TheString = ReplaceRaw$(TheString, "'", "")
    TheString = ReplaceRaw$(TheString, CHR$(26), "'")

    TheString = ReplaceRaw$(TheString, "{" + EscapeChar + "}", "")

    TheString = ReplaceRaw$(TheString, EscapeChar + EscapeChar, CHR$(26))
    TheString = ReplaceRaw$(TheString, EscapeChar, "")
    TheString = ReplaceRaw$(TheString, CHR$(26), EscapeChar)

    TheReturn = TheString
    FormatForTerminal$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION FunctionCrunch$ (ScannedNameIn AS STRING, MidFragmentIn AS STRING)
    DIM TheReturn AS STRING
    DIM ScannedName AS STRING
    DIM MidFragment AS STRING

    DIM ArgArray(101) AS STRING
    DIM ArgArraySize AS INTEGER

    DIM k AS INTEGER
    DIM m AS INTEGER
    DIM n AS INTEGER

    DIM t AS DOUBLE
    DIM z AS DOUBLE

    DIM c AS STRING
    DIM d AS STRING
    DIM e AS STRING
    DIM f AS STRING
    DIM g AS STRING

    ScannedName = ScannedNameIn
    MidFragment = MidFragmentIn

    ' Evaluate argument list.
    MidFragment = InternalEval$(MidFragment)

    IF (TypeCheck$(MidFragment) = "paren") THEN
        ArgArraySize = CountElements(MidFragment, ",")
        FOR n = 1 TO ArgArraySize
            ArgArray(n) = ReturnElement$(MidFragment, n, ",")
        NEXT
    ELSE
        ArgArray(1) = MidFragment
    END IF

    ' Identity:

    IF (ScannedName = "identity") THEN
        ScannedName = ""
        c = ArgArray(1)
        'd = ArgArray(2)
        MidFragment = c
    END IF

    IF (ScannedName = "join") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(2)
        MidFragment = c + d
    END IF

    ' Variables:

    IF (ScannedName = "let") THEN
        ScannedName = ""
        n = CountElements(MidFragment, ",")
        c = RemoveWrapping$(ArgArray(1), "`'")
        m = -1
        FOR k = 1 TO VariableListSize
            IF (c = VariableList(k, 1)) THEN
                m = k
            END IF
        NEXT
        IF (m = -1) THEN
            VariableListSize = VariableListSize + 1
            m = VariableListSize
            VariableList(m, 1) = c
        END IF
        IF (n = 2) THEN
            d = ArgArray(2)
        ELSE
            d = ""
            FOR k = 2 TO ArgArraySize
                d = d + ArgArray(k)
                IF (k < ArgArraySize) THEN
                    d = d + ","
                END IF
            NEXT
        END IF
        VariableList(m, 2) = d
        MidFragment = d
    END IF

    IF (ScannedName = "alet") THEN
        ScannedName = ""
        c = RemoveWrapping$(ArgArray(1), "`'")
        d = "-1"
        FOR k = 1 TO VariableListSize
            IF (c = VariableList(k, 1)) THEN
                d = LTRIM$(RTRIM$(STR$(k)))
                EXIT FOR
            END IF
        NEXT
        MidFragment = d
    END IF

    IF (ScannedName = "input") THEN
        ScannedName = ""
        f = ArgArray(1)
        g = FormatForTerminal$(ArgArray(2))

        ' CPP: STARTSKIP
        ' JavaScript: STARTSKIP
        PRINT g
        LINE INPUT "> ", c
        ' CPP: ENDSKIP
        ' JavaScript: ENDSKIP

        ' CPP: STARTSKIP
        '\\c = prompt(g, "");
        ' CPP: ENDSKIP

        ' JavaScript: STARTSKIP
        '\\std::cout << g;
        '\\std::cin >> c;
        ' JavaScript: ENDSKIP

        MidFragment = InternalEval$("let(" + f + "," + c + ")")
    END IF

    ' Function:

    IF (ScannedName = "func") THEN
        ScannedName = ""
        c = RemoveWrapping$(ArgArray(1), "`'")
        d = ArgArray(2)
        FOR k = 1 TO FunctionListSize
            IF (c = FunctionList(k, 1)) THEN
                FunctionList(k, 2) = d
                MidFragment = c
                c = "_null"
                EXIT FOR
            END IF
        NEXT
        IF (c <> "_null") THEN
            FunctionListSize = FunctionListSize + 1
            FunctionList(FunctionListSize, 1) = c
            FunctionList(FunctionListSize, 2) = d
            MidFragment = c
        END IF
    END IF

    ' Lambda:

    IF ((ScannedName = "lambda") OR (ScannedName = "$")) THEN
        ScannedName = ""
        c = "lambda" + LTRIM$(RTRIM$(STR$(INT(RND * 9999))))
        d = ArgArray(1)
        FOR k = 1 TO FunctionListSize
            IF (d = FunctionList(k, 2)) THEN
                MidFragment = FunctionList(k, 1)
                c = "_null"
                EXIT FOR
            END IF
        NEXT
        IF (c <> "_null") THEN
            FunctionListSize = FunctionListSize + 1
            FunctionList(FunctionListSize, 1) = c
            FunctionList(FunctionListSize, 2) = d
            MidFragment = c
        END IF
    END IF

    ' Date / Time:

    IF (ScannedName = "time") THEN
        ScannedName = ""

        ' JavaScript: STARTSKIP
        ' CPP: STARTSKIP
        c = TIME$
        ' JavaScript: ENDSKIP
        ' CPP: ENDSKIP

        ' CPP: STARTSKIP
        '\\var digital = new Date();
        '\\var hours = digital.getHours();
        '\\var minutes = digital.getMinutes();
        '\\var seconds = digital.getSeconds();
        '\\var c = hours + ":" + minutes + ":" + seconds;
        ' CPP: ENDSKIP

        ' CPP: STARTSKIP
        ' JavaScript: STARTSKIP
        '\\std::time_t thetime = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());
        '\\c = std::ctime(&thetime);
        '\\c = rIGHT(c, 14);
        '\\c = lEFT(c, 8);
        ' JavaScript: ENDSKIP
        ' CPP: ENDSKIP

        MidFragment = "`" + c + "'"
    END IF

    IF (ScannedName = "date") THEN
        ScannedName = ""

        ' JavaScript: STARTSKIP
        ' CPP: STARTSKIP
        c = DATE$
        ' JavaScript: ENDSKIP
        ' CPP: ENDSKIP

        ' CPP: STARTSKIP
        '\\var calendar = new Date();
        '\\var year = calendar.getFullYear();
        '\\var month = 1 + calendar.getMonth();
        '\\var day = calendar.getDate();
        '\\var c = month + "-" + day + "-" + year;
        ' CPP: ENDSKIP

        ' JavaScript: STARTSKIP
        ' JavaScript: ENDSKIP

        MidFragment = "`" + c + "'"
    END IF

    ' Memory:

    IF (ScannedName = "report") THEN
        ScannedName = ""
        IF (MidFragment = "()") THEN
            c = "{"
            FOR k = 1 TO FunctionListSize
                c = c + "func(" + FunctionList(k, 1) + "," + FunctionList(k, 2) + ")"
                c = c + " : "
            NEXT
            FOR k = 1 TO VariableListSize
                c = c + "let(" + VariableList(k, 1) + "," + VariableList(k, 2) + ")"
                c = c + " : "
            NEXT
            c = c + "print_()}"
        ELSE
            d = ArgArray(1)
            FOR k = 1 TO FunctionListSize
                IF (d = FunctionList(k, 1)) THEN
                    c = FunctionList(k, 2)
                    EXIT FOR
                END IF
            NEXT
        END IF
        MidFragment = c
    END IF

    IF (ScannedName = "reset") THEN
        ScannedName = ""
        VariableListSize = 0
        FunctionListSize = 0
        MidFragment = "report()"
    END IF

    ' Type-wrapping and unwrapping:

    IF (ScannedName = "type") THEN
        ScannedName = ""
        MidFragment = "`" + TypeCheck$(LEFT$(ArgArray(1), 1)) + "'"
    END IF
    IF (ScannedName = "quote") THEN
        ScannedName = ""
        MidFragment = "`" + ArgArray(1) + "'"
    END IF
    IF (ScannedName = "unquote") THEN
        ScannedName = ""
        MidFragment = RemoveWrapping$(ArgArray(1), "`'")
    END IF
    IF (ScannedName = "vector") THEN
        ScannedName = ""
        MidFragment = "<" + ArgArray(1) + ">"
    END IF
    IF (ScannedName = "unvector") THEN
        ScannedName = ""
        MidFragment = RemoveWrapping$(ArgArray(1), "<>")
    END IF
    IF (ScannedName = "occult") THEN
        ScannedName = ""
        MidFragment = "{" + ArgArray(1) + "}"
    END IF
    IF (ScannedName = "unoccult") THEN
        ScannedName = ""
        MidFragment = RemoveWrapping$(ArgArray(1), "{}")
    END IF
    IF (ScannedName = "symbol") THEN
        ScannedName = ""
        MidFragment = "[" + ArgArray(1) + "]"
    END IF
    IF (ScannedName = "unsymbol") THEN
        ScannedName = ""
        MidFragment = RemoveWrapping$(ArgArray(1), "[]")
    END IF

    ' Subprograms:

    IF (ScannedName = "sub") THEN
        ScannedName = ""
        MidFragment = SubExecute$(RemoveWrapping$(MidFragment, "{}"), "inline", "_yes")
    END IF
    IF (ScannedName = "block") THEN
        ScannedName = ""
        MidFragment = SubExecute$(RemoveWrapping$(MidFragment, "{}"), "inline", "_no")
    END IF
    IF (ScannedName = "exe") THEN
        ScannedName = ""
        MidFragment = SubExecute$(RemoveWrapping$(MidFragment, "`'"), "file", "_yes")
    END IF
    IF (ScannedName = "include") THEN
        ScannedName = ""
        MidFragment = SubExecute$(RemoveWrapping$(MidFragment, "`'"), "file", "_no")
    END IF

    ' Flow-Control:

    IF (ScannedName = "iff") THEN
        ScannedName = ""
        c = ArgArray(1)
        IF (VAL(c) = 1) THEN
            MidFragment = RemoveWrapping$(ArgArray(2), "{}")
        ELSE
            IF (CountElements(MidFragment, ",") = 2) THEN
                MidFragment = ""
            END IF
            IF (CountElements(MidFragment, ",") = 3) THEN
                MidFragment = RemoveWrapping$(ArgArray(3), "{}")
            END IF
        END IF
    END IF

    IF (ScannedName = "for") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = RemoveWrapping$(ArgArray(2), "{}")
        e = ""
        IF (VAL(ReturnElement$(c, 2, ",")) < VAL(ReturnElement$(c, 3, ","))) THEN
            z = VAL(ReturnElement$(c, 4, ","))
            FOR t = VAL(ReturnElement$(c, 2, ",")) TO VAL(ReturnElement$(c, 3, ",")) STEP z
                f = InternalEval$("let(" + ReturnElement$(c, 1, ",") + "," + STR$(t) + "+0)")
                e = e + InternalEval$(d)
            NEXT
        ELSE
            IF (VAL(ReturnElement$(c, 2, ",")) = VAL(ReturnElement$(c, 3, ","))) THEN
                f = InternalEval$("let(" + ReturnElement$(c, 1, ",") + "," + ReturnElement$(c, 2, ",") + ")")
                e = e + InternalEval$(d)
            ELSE
                z = ABS(VAL(ReturnElement$(c, 4, ",")))
                FOR t = VAL(ReturnElement$(c, 2, ",")) TO VAL(ReturnElement$(c, 3, ",")) STEP -1 * z
                    f = InternalEval$("let(" + ReturnElement$(c, 1, ",") + "," + STR$(t) + "+0)")
                    e = e + InternalEval$(d)
                NEXT
            END IF
        END IF
        MidFragment = e
    END IF

    ' Numeric (strict):

    IF (ScannedName = "abs") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            t = VAL(ArgArray(1))
            t = ABS(t)
            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        END IF
    END IF

    IF (ScannedName = "atan") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            t = VAL(ArgArray(1))
            t = ATN(t)
            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        END IF
    END IF

    IF (ScannedName = "cos") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            t = VAL(ArgArray(1))
            t = COS(t)
            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        ELSE
            MidFragment = "{cos(" + ArgArray(1) + ")}"
        END IF
    END IF

    IF (ScannedName = "greater") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(2)
        IF (VAL(c) > VAL(d)) THEN
            MidFragment = "1"
        ELSE
            MidFragment = "0"
        END IF
    END IF

    IF (ScannedName = "int") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            t = VAL(ArgArray(1))
            t = INT(t)
            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        END IF
    END IF

    IF (ScannedName = "ln") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            z = VAL(ArgArray(1))

            ' JavaScript: STARTSKIP
            ' CPP: STARTSKIP
            t = LOG(z)
            ' JavaScript: ENDSKIP
            ' CPP: ENDSKIP

            ' CPP: STARTSKIP
            '\\t = Math.log(z);
            ' CPP: ENDSKIP

            ' JavaScript: STARTSKIP
            '\\t = log(z);
            ' JavaScript: ENDSKIP

            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        END IF
    END IF

    IF (ScannedName = "rand") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            z = VAL(ArgArray(1))

            ' JavaScript: STARTSKIP
            ' CPP: STARTSKIP
            t = RND * z
            ' JavaScript: ENDSKIP
            ' CPP: ENDSKIP

            ' CPP: STARTSKIP
            '\\t = z * Math.random();
            ' CPP: ENDSKIP

            ' JavaScript: STARTSKIP
            '\\t = (rand() % RAND_MAX) * (z / RAND_MAX);
            ' JavaScript: ENDSKIP

            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        END IF
    END IF

    IF (ScannedName = "sgn") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            t = VAL(ArgArray(1))
            t = SGN(t)
            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        END IF
    END IF

    IF (ScannedName = "sin") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            t = VAL(ArgArray(1))
            t = SIN(t)
            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        END IF
    END IF

    IF (ScannedName = "sqrt") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            t = VAL(ArgArray(1))
            IF (t >= 0) THEN
                t = SQR(t)
                MidFragment = LTRIM$(RTRIM$(STR$(t)))
            ELSE
                MidFragment = "{ERROR: Negative argument sent to sqrt().}"
            END IF
        END IF
    END IF

    IF (ScannedName = "tan") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            t = VAL(ArgArray(1))
            t = TAN(t)
            MidFragment = LTRIM$(RTRIM$(STR$(t)))
        END IF
    END IF

    IF (ScannedName = "unf") THEN
        ScannedName = ""
        IF (TypeCheck$(LEFT$(ArgArray(1), 1)) = "number") THEN
            MidFragment = LTRIM$(RTRIM$(STR$(VAL(ArgArray(1)))))
        ELSE
            MidFragment = ArgArray(1)
        END IF
    END IF

    ' Graphics:

    IF (ScannedName = "plot") THEN
        ScannedName = ""
        MidFragment = PlotASCII$(ArgArray(1), VAL(ArgArray(2)), VAL(ArgArray(3)), VAL(ArgArray(4)), VAL(ArgArray(5)), VAL(ArgArray(6)), VAL(ArgArray(7)))
    END IF

    IF (ScannedName = "scatter") THEN
        ScannedName = ""
        MidFragment = PlotScatter$(ArgArray(1), VAL(ArgArray(2)), VAL(ArgArray(3)), VAL(ArgArray(4)))
    END IF

    IF (ScannedName = "hist") THEN
        ScannedName = ""
        MidFragment = HistASCII$(ArgArray(1), VAL(ArgArray(2)))
    END IF

    ' BigNum:

    IF (ScannedName = "largeadd") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(2)
        MidFragment = BigNumAdd$(c, d)
    END IF

    IF (ScannedName = "largesub") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(2)
        MidFragment = BigNumSub$(c, d)
    END IF

    IF (ScannedName = "largemul") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(2)
        MidFragment = BigNumMul$(c, d)
    END IF

    IF (ScannedName = "largediv") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(2)
        k = LEN(c)
        n = LEN(d)
        n = n + k
        IF (n < 16) THEN
            n = 16
        END IF
        MidFragment = BigNumDiv$(c, d, n)
    END IF

    ' Strings (strict):

    ' CPP: STARTSKIP
    IF (ScannedName = "asc") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "quote") THEN
            c = RemoveWrapping$(ArgArray(1), "`'")
            MidFragment = LTRIM$(RTRIM$(STR$(ASC(c))))
        END IF
    END IF
    ' CPP: ENDSKIP

    IF (ScannedName = "chr") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "number") THEN
            c = CHR$(VAL(ArgArray(1)))
            IF (c = " ") THEN
                c = EscapeChar + c
            END IF
            MidFragment = c
        END IF
    END IF

    IF (ScannedName = "instr") THEN
        ScannedName = ""
        c = RemoveWrapping$(ArgArray(1), "`'")
        d = RemoveWrapping$(ArgArray(2), "`'")
        MidFragment = LTRIM$(RTRIM$(STR$(INSTR(c, d))))
    END IF

    IF (ScannedName = "lcase") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "quote") THEN
            MidFragment = LCASE$(ArgArray(1))
        END IF
    END IF

    IF (ScannedName = "ucase") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(1), 1, 1)) = "quote") THEN
            MidFragment = UCASE$(ArgArray(1))
        END IF
    END IF

    ' Elements (shared):

    IF (ScannedName = "mid") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = TypeCheck$(LEFT$(c, 1))
        IF (d = "number") THEN
            f = ArgArray(2)
            g = ArgArray(3)
            c = MID$(c, VAL(f), VAL(g))
            MidFragment = c
        END IF
        IF (d = "quote") THEN
            c = RemoveWrapping$(c, "`'")
            f = ArgArray(2)
            g = ArgArray(3)
            c = MID$(c, VAL(f), VAL(g))
            MidFragment = "`" + c + "'"
        END IF
        IF (d = "vector") THEN
            f = ArgArray(2)
            g = ArgArray(3)
            IF ((VAL(f) > 0) AND (VAL(g) > 0)) THEN
                k = GetSeparatorPos(c, ",", VAL(f) - 1, 1)
                IF (k = -1) THEN
                    k = 1
                END IF
                n = GetSeparatorPos(c, ",", VAL(f) + VAL(g) - 1, 1)
                IF (n = -1) THEN
                    n = FindMatching(c, LEFT$(c, 1), 1)
                END IF
                IF ((k > -1) AND (n > -1)) THEN
                    MidFragment = LEFT$(c, 1) + MID$(c, k + 1, n - k - 1) + RIGHT$(c, 1)
                END IF
            ELSE
                MidFragment = LEFT$(c, 1) + RIGHT$(c, 1)
            END IF
        END IF
        IF (d = "occult") THEN
            f = ArgArray(2)
            g = ArgArray(3)
            IF ((VAL(f) > 0) AND (VAL(g) > 0)) THEN
                k = GetSeparatorPos(c, ":", VAL(f) - 1, 1)
                IF (k = -1) THEN
                    k = 1
                END IF
                n = GetSeparatorPos(c, ":", VAL(f) + VAL(g) - 1, 1)
                IF (n = -1) THEN
                    n = FindMatching(c, LEFT$(c, 1), 1)
                END IF
                IF ((k > -1) AND (n > -1)) THEN
                    MidFragment = LEFT$(c, 1) + MID$(c, k + 1, n - k - 1) + RIGHT$(c, 1)
                END IF
            ELSE
                MidFragment = LEFT$(c, 1) + RIGHT$(c, 1)
            END IF
        END IF
    END IF

    IF (ScannedName = "left") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = TypeCheck$(LEFT$(c, 1))
        IF (d = "number") THEN
            e = ArgArray(2)
            c = LEFT$(c, VAL(e))
            MidFragment = c
        END IF
        IF (d = "quote") THEN
            c = RemoveWrapping$(c, "`'")
            e = ArgArray(2)
            c = LEFT$(c, VAL(e))
            MidFragment = "`" + c + "'"
        END IF
        IF (d = "vector") THEN
            e = ArgArray(2)
            IF (VAL(e) > 0) THEN
                k = GetSeparatorPos(c, ",", VAL(e), 1)
                IF (k = -1) THEN
                    k = FindMatching(c, LEFT$(c, 1), 1)
                END IF
                IF (k > -1) THEN
                    MidFragment = LEFT$(c, k - 1) + RIGHT$(c, 1)
                END IF
            ELSE
                MidFragment = LEFT$(c, 1) + RIGHT$(c, 1)
            END IF
        END IF
        IF (d = "occult") THEN
            e = ArgArray(2)
            IF (VAL(e) > 0) THEN
                k = GetSeparatorPos(c, ":", VAL(e), 1)
                IF (k = -1) THEN
                    k = FindMatching(c, LEFT$(c, 1), 1)
                END IF
                IF (k > -1) THEN
                    MidFragment = LEFT$(c, k - 1) + RIGHT$(c, 1)
                END IF
            ELSE
                MidFragment = LEFT$(c, 1) + RIGHT$(c, 1)
            END IF
        END IF
    END IF

    IF (ScannedName = "right") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = TypeCheck$(LEFT$(c, 1))
        IF (d = "number") THEN
            e = ArgArray(2)
            c = RIGHT$(c, VAL(e))
            MidFragment = c
        END IF
        IF (d = "quote") THEN
            c = RemoveWrapping$(c, "`'")
            e = ArgArray(2)
            c = RIGHT$(c, VAL(e))
            MidFragment = "`" + c + "'"
        END IF
        IF (d = "vector") THEN
            e = ArgArray(2)
            IF (VAL(e) > 0) THEN
                k = GetSeparatorPos(c, ",", CountElements(c, ",") - VAL(e), 1)
                IF (k = -1) THEN
                    k = 1
                END IF
                IF (k > -1) THEN
                    MidFragment = LEFT$(c, 1) + RIGHT$(c, LEN(c) - k)
                END IF
            ELSE
                MidFragment = LEFT$(c, 1) + RIGHT$(c, 1)
            END IF
        END IF
        IF (d = "occult") THEN
            e = ArgArray(2)
            IF (VAL(e) > 0) THEN
                k = GetSeparatorPos(c, ":", CountElements(c, ":") - VAL(e), 1)
                IF (k = -1) THEN
                    k = 1
                END IF
                IF (k > -1) THEN
                    MidFragment = LEFT$(c, 1) + RIGHT$(c, LEN(c) - k)
                END IF
            ELSE
                MidFragment = LEFT$(c, 1) + RIGHT$(c, 1)
            END IF
        END IF
    END IF

    IF (ScannedName = "len") THEN
        ScannedName = ""
        d = TypeCheck$(ArgArray(1))
        IF ((d = "number") OR (d = "word")) THEN
            c = ArgArray(1)
            MidFragment = LTRIM$(RTRIM$(STR$(LEN(c))))
        END IF
        IF (d = "quote") THEN
            c = RemoveWrapping$((ArgArray(1)), "`'")
            MidFragment = LTRIM$(RTRIM$(STR$(LEN(c))))
        END IF
        IF (d = "vector") THEN
            MidFragment = LTRIM$(RTRIM$(STR$(CountElements(ArgArray(1), ","))))
        END IF
        IF (d = "occult") THEN
            MidFragment = LTRIM$(RTRIM$(STR$(CountElements(ArgArray(1), ":"))))
        END IF
    END IF

    IF (ScannedName = "elem") THEN
        ScannedName = ""
        d = TypeCheck$(ArgArray(1))
        IF (d = "vector") THEN
            c = ReturnElement$(ArgArray(1), VAL(ArgArray(2)), ",")
        END IF
        IF (d = "occult") THEN
            c = ReturnElement$(ArgArray(1), VAL(ArgArray(2)), ":")
            c = "{" + c + "}"
        END IF
        MidFragment = c
    END IF

    IF (ScannedName = "stack") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(2)
        f = TypeCheck$(c)
        IF (f = "vector") THEN
            c = RemoveWrapping$(c, "<>")
            d = RemoveWrapping$(d, "<>")
            e = "<" + c + "," + d + ">"
        END IF
        IF (f = "occult") THEN
            c = RemoveWrapping$(c, "{}")
            d = RemoveWrapping$(d, "{}")
            e = "{" + c + ":" + d + "}"
        END IF
        MidFragment = e
    END IF

    IF (ScannedName = "replace") THEN
        ScannedName = ""
        c = ArgArray(1)
        n = VAL(ArgArray(2))
        d = RemoveWrapping$(ArgArray(3), "{}")
        e = TypeCheck$(c)
        IF (e = "vector") THEN
            k = CountElements(c, ",")
            IF (n = 1) THEN
                c = RIGHT$(c, LEN(c) - GetSeparatorPos(c, ",", 1, 1) + 1)
                c = "<" + d + c
            END IF
            IF (n = k) THEN
                c = LEFT$(c, GetSeparatorPos(c, ",", k - 1, 1))
                c = c + d + ">"
            END IF
            IF ((n > 1) AND (n < CountElements(c, ","))) THEN
                c = LEFT$(c, GetSeparatorPos(c, ",", n - 1, 1)) + d + RIGHT$(c, LEN(c) - GetSeparatorPos(c, ",", n, 1) + 1)
            END IF
        END IF
        IF (e = "occult") THEN
            k = CountElements(c, ":")
            IF (n = 1) THEN
                c = RIGHT$(c, LEN(c) - GetSeparatorPos(c, ":", 1, 1) + 1)
                c = "{" + d + c
            END IF
            IF (n = k) THEN
                c = LEFT$(c, GetSeparatorPos(c, ":", k - 1, 1))
                c = c + d + "}"
            END IF
            IF ((n > 1) AND (n < CountElements(c, ":"))) THEN
                c = LEFT$(c, GetSeparatorPos(c, ":", n - 1, 1)) + d + RIGHT$(c, LEN(c) - GetSeparatorPos(c, ":", n, 1) + 1)
            END IF
        END IF
        MidFragment = c
    END IF

    ' Vectors (strict):

    IF (ScannedName = "column") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(2)
        n = CountElements(c, ",")
        e = ""
        IF (CountElements(ReturnElement$(c, 1, ","), ",") > 1) THEN
            FOR k = 1 TO n
                e = e + ReturnElement$(ReturnElement$(c, k, ","), VAL(d), ",")
                IF (k < n) THEN
                    e = e + ","
                END IF
            NEXT
            e = "<" + e + ">"
        ELSE
            e = ReturnElement$(c, VAL(d), ",")
        END IF
        MidFragment = e
    END IF

    IF (ScannedName = "smooth") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = TypeCheck$(c)
        IF (d = "vector") THEN
            c = ReplaceWord$(c, ",,", ",", -1)
            c = ReplaceWord$(c, "<,", "<", -1)
            c = ReplaceWord$(c, ",>", ">", -1)
        END IF
        IF (d = "occult") THEN
            c = ReplaceWord$(c, "::", ":", -1)
            c = ReplaceWord$(c, "{:", "{", -1)
            c = ReplaceWord$(c, ":}", "}", -1)
        END IF
        MidFragment = c
    END IF

    ' Vectors (processing):

    IF (ScannedName = "apply") THEN
        ScannedName = ""
        IF (TypeCheck$(MID$(ArgArray(2), 1, 1)) = "vector") THEN
            MidFragment = StructureApplyFunc$(ArgArray(2), ArgArray(1), "<>")
        END IF
    END IF

    IF (ScannedName = "map") THEN
        ScannedName = ""
        c = ArgArray(1)
        d = ArgArray(3)
        e = ArgArray(2)
        n = CountElements(c, ",")
        m = CountElements(d, ",")
        IF (n > m) THEN
            n = m
        END IF
        f = LEFT$(c, 1)
        FOR k = 1 TO n
            f = f + e + "(" + ReturnElement$(c, k, ",") + "," + ReturnElement$(d, k, ",") + ")"
            IF (k < n) THEN
                f = f + ","
            END IF
        NEXT
        f = f + RIGHT$(c, 1)
        MidFragment = f
    END IF

    IF (ScannedName = "reduce") THEN
        ScannedName = ""
        d = ArgArray(1)
        e = ArgArray(2)
        c = d + "(" + ReturnElement$(e, 1, ",") + "," + ReturnElement$(e, 2, ",") + ")"
        FOR k = 2 TO CountElements(e, ",") - 1
            c = d + "(" + c + "," + ReturnElement$(e, k + 1, ",") + ")"
        NEXT
        MidFragment = c
    END IF

    '''
    ' Experimental:
    'IF (ScannedName = "") THEN
    '    TheReturn = ScannedName + MidFragment
    'ELSE
    '    TheReturn = "{" + ScannedName + "(" + MidFragment + ")}"
    'END IF
    '''

    ''' Legacy:
    TheReturn = ScannedName + MidFragment
    '''

    FunctionCrunch$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION EvalStep$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM LeftBrackPos AS INTEGER
    DIM RightBrackPos AS INTEGER
    DIM ScannedNameStart AS INTEGER
    DIM ScannedName AS STRING
    DIM LeftFragment AS STRING
    DIM MidFragment AS STRING
    DIM RightFragment AS STRING
    DIM k AS INTEGER
    DIM n AS INTEGER
    DIM m AS INTEGER
    'DIM t AS DOUBLE
    'DIM z AS DOUBLE
    DIM c AS STRING
    DIM d AS STRING
    TheString = TheStringIn
    TheReturn = ""
    LeftBrackPos = -1
    RightBrackPos = -1
    ScannedNameStart = -1
    ScannedName = ""
    LeftFragment = ""
    MidFragment = ""
    RightFragment = ""

    ' Replace variable references with literal representations:
    '   Variables in square brackets ( [] ) are replaced outside of all occulted ( {} ) brackets.
    '   Variables in curvy brackets ( {} ) are replaced down to the fourth (4th) level of occulted ( {} ) brackets.
    IF (TheReturn = "") THEN
        c = TheString
        FOR k = 1 TO VariableListSize
            c = ReplaceWord$(c, "[" + VariableList(k, 1) + "]", VariableList(k, 2), 0)
            c = ReplaceWord$(c, "{" + VariableList(k, 1) + "}", VariableList(k, 2), 4)
        NEXT
        IF (c <> TheString) THEN
            TheReturn = c
        END IF
    END IF

    ' Scan for most-embedded structure and break the input string into fragments:
    '   LeftFragment = Everything to the left of the inner-most parenthesized structure or ScannedName (can be empty).
    '   ScannedName = Word to the left of the most-embedded set of parentheses (if found).
    '   MidFragment = (i)  Most-embedded structure contained in parens ( ), OR
    '                 (ii) If no parens detected, the whole input string.
    '   RightFragment = Everything to the right of the inner-most parenthesized structure (can be empty).
    '   Note: LeftFragment and RightFragment remain static. All changes occur in ScannedName and MidFragment.
    IF (TheReturn = "") THEN
        LeftBrackPos = FindMostEmbedded(TheString)
        IF (LeftBrackPos > -1) THEN
            RightBrackPos = FindMatching(TheString, "(", LeftBrackPos)
        ELSE
            MidFragment = TheString
        END IF
        IF (RightBrackPos > -1) THEN
            MidFragment = MID$(TheString, LeftBrackPos, (RightBrackPos - LeftBrackPos) + 1)
            RightFragment = RIGHT$(TheString, LEN(TheString) - RightBrackPos)
            ScannedNameStart = ScanForName(TheString, LeftBrackPos, "left")
            IF (ScannedNameStart <> LeftBrackPos) THEN
                LeftFragment = LEFT$(TheString, ScannedNameStart - 1)
                ScannedName = MID$(TheString, ScannedNameStart, (LeftBrackPos - ScannedNameStart))
            ELSE
                LeftFragment = LEFT$(TheString, LeftBrackPos - 1)
            END IF
        END IF
    END IF

    ' If input expression contains no zero-level (unocculted) parens:
    IF ((LeftBrackPos = -1) AND (RightBrackPos = -1) AND (ScannedName = "")) THEN

        ' Pass through NumberCrunch (regardless of input type).
        '   If NumberCrunch changes input string, loop until a stable result is reached. (--> ^)
        '   If input was already stable (emerges unchanged), pass control downward.
        IF (TheReturn = "") THEN
            d = TheString
            c = ""
            DO WHILE (TheString <> c)
                c = TheString
                TheString = NumberCrunch$(TheString)
            LOOP
            c = TheString
            IF (c = d) THEN
                TheReturn = ""
            ELSE
                TheReturn = c
            END IF
        END IF

        ' If handed a vector, evaluate* each component. (--> ^)
        IF (TheReturn = "") THEN
            c = TheString
            IF (TypeCheck$(c) = "vector") THEN
                d = c
                c = StructureEval$(c, "<", ">")
            END IF
            IF (c = d) THEN
                TheReturn = ""
            ELSE
                TheReturn = c
            END IF
        END IF

    END IF

    ' If input expression contains zero-level parens but no scanned function name:
    IF ((LeftBrackPos > -1) AND (RightBrackPos > -1) AND (ScannedName = "")) THEN

        IF (TheReturn = "") THEN
            n = CountElements(MidFragment, ",")
            IF (n = 1) THEN
                ' If argument is singular, strip the outer parens and evaluate* content. (--> ^)
                c = RemoveWrapping$(MidFragment, "()")
                c = InternalEval$(c)
                MidFragment = c
                TheReturn = LeftFragment + MidFragment + RightFragment
            END IF
            IF (n > 1) THEN
                ' If argument is a parenthesized list, evaluate* each component and retain parens. (--> ^)
                c = StructureEval$(MidFragment, "(", ")")
                MidFragment = c
                TheReturn = LeftFragment + MidFragment + RightFragment
            END IF
        END IF

    END IF

    ' If input expression contains parens and a name was scanned:
    IF ((LeftBrackPos > -1) AND (RightBrackPos > -1) AND (ScannedName <> "")) THEN

        ' If ScannedName is a user-defined function:
        '   Replace the function call with the literal function content.
        '   Replace variables [x], [y], etc. with arguments sent to the function. (--> ^)
        IF (TheReturn = "") THEN
            m = CountElements(MidFragment, ",")
            FOR k = FunctionListSize TO 1 STEP -1
                IF (ScannedName = FunctionList(k, 1)) THEN
                    c = FunctionList(k, 2)
                    c = RemoveWrapping$(c, "{}")

                    IF (m > 0) THEN
                        d = InternalEval$(ReturnElement$(MidFragment, 1, ","))
                        c = ReplaceWord$(c, "[x]", d, 1)
                    END IF
                    IF (m > 1) THEN
                        d = InternalEval$(ReturnElement$(MidFragment, 2, ","))
                        c = ReplaceWord$(c, "[y]", d, 1)
                    END IF
                    IF (m > 2) THEN
                        d = InternalEval$(ReturnElement$(MidFragment, 3, ","))
                        c = ReplaceWord$(c, "[z]", d, 1)
                    END IF
                    IF (m > 3) THEN
                        d = InternalEval$(ReturnElement$(MidFragment, 4, ","))
                        c = ReplaceWord$(c, "[t]", d, 1)
                    END IF
                    IF (m > 4) THEN
                        d = InternalEval$(ReturnElement$(MidFragment, 5, ","))
                        c = ReplaceWord$(c, "[u]", d, 1)
                    END IF
                    IF (m > 5) THEN
                        d = InternalEval$(ReturnElement$(MidFragment, 6, ","))
                        c = ReplaceWord$(c, "[v]", d, 1)
                    END IF

                    MidFragment = c
                    TheReturn = LeftFragment + MidFragment + RightFragment
                    EXIT FOR
                END IF
            NEXT
        END IF

        ' If ScannedName is a primitive, pass through FunctionCrunch. (--> ^)
        IF (TheReturn = "") THEN
            MidFragment = FunctionCrunch$(ScannedName, MidFragment)
            TheReturn = LeftFragment + MidFragment + RightFragment
        END IF

    END IF

    IF (TheReturn = "") THEN
        TheReturn = TheString
    END IF

    EvalStep$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION SxriptEval$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    TheString = TheStringIn
    TheString = InternalEval$(TheString)
    TheString = FormatForTerminal$(TheString)
    TheReturn = TheString
    SxriptEval$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION NumberCrunch$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TypeLeft AS STRING
    DIM TypeRight AS STRING
    DIM ArgLeft AS STRING
    DIM ArgRight AS STRING
    DIM LeftFragment AS STRING
    DIM MidFragment AS STRING
    DIM RightFragment AS STRING
    DIM TheOperator AS STRING
    DIM k AS INTEGER
    DIM m AS INTEGER
    DIM n AS INTEGER
    DIM t1 AS DOUBLE
    DIM t2 AS DOUBLE
    DIM t3 AS DOUBLE
    DIM c AS STRING
    DIM c1 AS STRING
    DIM c2 AS STRING
    DIM c3 AS STRING
    DIM Divergence AS INTEGER
    TheString = TheStringIn
    TheReturn = ""
    TypeLeft = ""
    TypeRight = ""
    ArgLeft = ""
    ArgRight = ""
    TheOperator = ""
    k = -1
    m = -1
    n = -1
    c = ""
    c1 = ""
    c2 = ""
    c3 = ""
    Divergence = 0

    TheString = ManageOperators$(TheString)
    c3 = TheString

    TheString = ReplaceWord$(TheString, "D+", "Dp", -1)
    TheString = ReplaceWord$(TheString, "D-", "Dm", -1)
    TheString = ReplaceWord$(TheString, "E+", "Ep", -1)
    TheString = ReplaceWord$(TheString, "E-", "Em", -1)
    TheString = ReplaceWord$(TheString, "e+", "ep", -1)
    TheString = ReplaceWord$(TheString, "e-", "em", -1)
    TheString = ReplaceWord$(TheString, "DE", "00", -1)
    TheReturn = TheString

    IF (TheReturn = TheString) THEN

        FOR n = 1 TO LEN(OpList)
            c = MID$(OpList, n, 1)
            k = ScanForOperator(TheString, c)
            IF (k > -1) THEN
                m = k
                TheOperator = c
                EXIT FOR
            END IF
        NEXT

        ' Special case (1 of 2) for tilde operator.
        IF (TheOperator = "~") THEN
            m = ScanForName(TheString, k - 1, "left") - 1
            TheOperator = MID$(TheString, m, k - m + 1)
            k = m
        END IF

    END IF

    IF (TheOperator = "") THEN
        TheString = c3
        TheReturn = TheString
    END IF

    IF (TheOperator <> "") THEN

        c1 = MID$(TheString, k - 1, 1)
        c2 = MID$(TheString, k + LEN(TheOperator), 1)

        ' Special case (1 of 2) for factorial symbol as an operator.
        IF (TheOperator = "!") THEN
            c2 = "0"
        END IF

        IF ((c1 <> "") AND (c2 <> "")) THEN

            TypeLeft = TypeCheck$(c1)
            TypeRight = TypeCheck$(c2)

            ' Handle left side of operator.
            IF (TypeLeft = "number") THEN
                m = ScanForName(TheString, k - 1, "left")
                IF (m > 1) THEN
                    IF ((MID$(TheString, m - 1, 1) = "+") OR (MID$(TheString, m - 1, 1) = "-")) THEN
                        m = m - 1
                    END IF
                END IF
            END IF
            IF ((TypeLeft = "vector") OR (TypeLeft = "quote") OR (TypeLeft = "occulted")) THEN
                m = FindMatching(TheString, c1, k - 1)
                IF (m = -1) THEN
                    m = 1
                END IF
            END IF
            IF (TypeLeft = "word") THEN
                m = ScanForName(TheString, k - 1, "left")
            END IF

            ' Handle right side of operator.
            IF (TypeRight = "number") THEN
                n = ScanForName(TheString, k + LEN(TheOperator), "right")
            END IF
            IF ((TypeRight = "vector") OR (TypeRight = "quote") OR (TypeRight = "occulted")) THEN
                n = FindMatching(TheString, c2, k + LEN(TheOperator))
                IF (n = -1) THEN
                    n = LEN(TheString)
                END IF
            END IF
            IF (TypeRight = "word") THEN
                n = ScanForName(TheString, k + LEN(TheOperator), "right")
            END IF

            ' Special case (2 of 2) for factorial symbol as an operator.
            IF (TheOperator = "!") THEN
                n = k
                TypeRight = "number"
            END IF

            ' Break the string into fragments.

            TheString = c3
            TheReturn = TheString

            ArgLeft = MID$(TheString, m, k - m)
            ArgRight = MID$(TheString, k + LEN(TheOperator), n - k - LEN(TheOperator) + 1)
            LeftFragment = LEFT$(TheString, m - 1)
            RightFragment = RIGHT$(TheString, LEN(TheString) - n)

            ' Special case (2 of 2) for tilde operator.
            IF (TheReturn = TheString) THEN
                IF (LEFT$(TheOperator, 1) = "~") THEN
                    TheOperator = RemoveWrapping$(TheOperator, "~~")
                    MidFragment = "(" + TheOperator + "(" + ArgLeft + "," + ArgRight + ")" + ")"
                    MidFragment = InternalEval$(MidFragment)
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF

            ' Special case for ? operator.
            IF (TheReturn = TheString) THEN
                IF (TheOperator = "?") THEN
                    MidFragment = ArgLeft + "(" + ArgRight + ")"
                    MidFragment = InternalEval$(MidFragment)
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF

            ' Case: word @ word
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "word") AND (TypeRight = "word")) THEN
                    IF (TheOperator = "=") THEN
                        IF (ArgLeft = ArgRight) THEN
                            MidFragment = "1"
                        ELSE
                            MidFragment = "0"
                        END IF
                    END IF
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF

            ' Case: number @ number
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "number") AND (TypeRight = "number")) THEN

                    t1 = VAL(ArgLeft)
                    t2 = VAL(ArgRight)

                    IF (TheOperator = "!") THEN
                        t2 = ABS(t1)
                        IF (t2 <> 0) THEN
                            t1 = t1 / ABS(t1)
                            t3 = 1
                            FOR k = 1 TO t2
                                t3 = t3 * k
                            NEXT
                            t3 = t3 * t1
                        ELSE
                            t3 = 1
                        END IF
                    END IF

                    IF (TheOperator = "^") THEN
                        ' CPP: STARTSKIP
                        ' JavaScript: STARTSKIP
                        t3 = t1 ^ t2
                        ' CPP: ENDSKIP
                        ' JavaScript: ENDSKIP
                        ' CPP: STARTSKIP
                        '\\t3 = Math.pow(t1, t2);
                        ' CPP: ENDSKIP
                        ' JavaScript: STARTSKIP
                        '\\t3 = pow(t1, t2);
                        ' JavaScript: ENDSKIP
                    END IF

                    IF (TheOperator = "*") THEN
                        t3 = t1 * t2
                    END IF

                    IF (TheOperator = "/") THEN
                        IF (t2 = 0) THEN
                            Divergence = 1
                        ELSE
                            t3 = t1 / t2
                        END IF
                    END IF

                    IF (TheOperator = "%") THEN
                        t3 = t1
                        IF (t2 <> 0) THEN
                            ' CPP: STARTSKIP
                            t3 = t1 MOD t2
                            ' CPP: ENDSKIP
                        END IF
                    END IF

                    IF (TheOperator = "+") THEN
                        t3 = t1 + t2
                    END IF

                    IF (TheOperator = "-") THEN
                        t3 = t1 - t2
                    END IF

                    IF (TheOperator = "=") THEN
                        IF ((t1 - t2) = 0) THEN
                            t3 = 1
                        ELSE
                            t3 = 0
                        END IF
                    END IF

                    IF (TheOperator = "&") THEN
                        IF ((t1 > 0) AND (t2 > 0)) THEN
                            t3 = 1
                        ELSE
                            t3 = 0
                        END IF
                    END IF

                    IF (TheOperator = "|") THEN
                        IF ((t1 > 0) OR (t2 > 0)) THEN
                            t3 = 1
                        ELSE
                            t3 = 0
                        END IF
                    END IF

                    IF (Divergence = 0) THEN

                        ' Inserts a "+" sign in front of positive results.
                        IF (t3 >= 0) THEN
                            MidFragment = "+" + LTRIM$(RTRIM$(STR$(t3)))
                        ELSE
                            MidFragment = LTRIM$(RTRIM$(STR$(t3)))
                        END IF

                        '''
                        '2021 edit: Added this.
                        ' This could be faster with a non-recursive word replacement function.
                        IF ((INSTR(MidFragment, ".") < 1) AND (INSTR(MidFragment, "e") > 1)) THEN
                            MidFragment = ReplaceWord$(MidFragment, "e", ".0X", -1)
                            MidFragment = ReplaceWord$(MidFragment, "X", "e", -1)
                        END IF
                        '''

                        ' Inserts ".0" for numbers not containing decimals.
                        IF (INSTR(MidFragment, ".") < 1) THEN
                            MidFragment = MidFragment + ".0"
                        END IF

                        ' More strict format for small decimals.
                        MidFragment = ReplaceWord$(MidFragment, "+.", "+0.", -1)
                        MidFragment = ReplaceWord$(MidFragment, "-.", "-0.", -1)

                    ELSE
                        MidFragment = "{ERROR: Division by zero.}"
                    END IF

                    TheReturn = LeftFragment + MidFragment + RightFragment

                END IF
            END IF

            ' Case: number @ quote
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "number") AND (TypeRight = "quote")) THEN
                    IF (TheOperator = "*") THEN
                        ArgRight = RemoveWrapping$(ArgRight, "`'")
                        c = ""
                        FOR k = 1 TO INT(VAL(ArgLeft))
                            c = c + ArgRight
                        NEXT
                        c = "`" + c + "'"
                        MidFragment = c
                    END IF
                    IF (TheOperator = "+") THEN
                        ArgRight = RemoveWrapping$(ArgRight, "`'")
                        c = ArgLeft + ArgRight
                        c = "`" + c + "'"
                        MidFragment = c
                    END IF
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF

            ' Case: quote @ number
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "quote") AND (TypeRight = "number")) THEN
                    IF (TheOperator = "*") THEN
                        ArgLeft = RemoveWrapping$(ArgLeft, "`'")
                        c = ""
                        FOR k = 1 TO INT(VAL(ArgRight))
                            c = c + ArgLeft
                        NEXT
                        c = "`" + c + "'"
                        MidFragment = c
                    END IF
                    IF (TheOperator = "+") THEN
                        ArgLeft = RemoveWrapping$(ArgLeft, "`'")
                        c = ArgLeft + ArgRight
                        c = "`" + c + "'"
                        MidFragment = c
                    END IF
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF

            ' Case: number @ vector
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "number") AND (TypeRight = "vector")) THEN
                    MidFragment = StructureApplyFunc$(ArgRight, ArgLeft + TheOperator, "<>")
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF

            '''
            ' Case: vector @ number
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "vector") AND (TypeRight = "number")) THEN
                    MidFragment = StructureApplyTailOp$(ArgLeft, TheOperator + ArgRight, "<>")
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF
            '''

            ' Case: quote @ vector
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "quote") AND (TypeRight = "vector")) THEN
                    MidFragment = StructureApplyFunc$(ArgRight, ArgLeft + TheOperator, "<>")
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF

            '''
            ' Case: vector @ quote
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "vector") AND (TypeRight = "quote")) THEN
                    MidFragment = StructureApplyTailOp$(ArgLeft, TheOperator + ArgRight, "<>")
                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF
            '''

            ' Case: quote @ quote
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "quote") AND (TypeRight = "quote")) THEN

                    ArgLeft = RemoveWrapping$(ArgLeft, "`'")
                    ArgRight = RemoveWrapping$(ArgRight, "`'")

                    IF (TheOperator = "*") THEN
                        c = ""
                        FOR k = 1 TO LEN(ArgLeft)
                            c = c + MID$(ArgLeft, k, 1) + ArgRight
                        NEXT
                        MidFragment = "`" + c + "'"
                    END IF

                    IF (TheOperator = "/") THEN
                        c1 = ArgLeft
                        n = -1
                        DO WHILE (n = -1)
                            k = INSTR(c1, ArgRight)
                            IF (k > 0) THEN
                                c1 = LEFT$(c1, k - 1) + RIGHT$(c1, LEN(c1) - k - LEN(ArgRight) + 1)
                            ELSE
                                n = 1
                            END IF
                        LOOP
                        MidFragment = "`" + c1 + "'"
                    END IF

                    IF (TheOperator = "+") THEN
                        MidFragment = "`" + ArgLeft + ArgRight + "'"
                    END IF

                    IF (TheOperator = "-") THEN
                        IF (RIGHT$(ArgLeft, LEN(ArgRight)) = ArgRight) THEN
                            MidFragment = "`" + LEFT$(ArgLeft, LEN(ArgLeft) - LEN(ArgRight)) + "'"
                        ELSE
                            '''MidFragment = "`" + ArgLeft + "'-`" + ArgRight + "'"
                            MidFragment = "`" + ArgLeft + "'"
                        END IF
                    END IF

                    IF (TheOperator = "=") THEN
                        IF (ArgLeft = ArgRight) THEN
                            c = "1"
                        ELSE
                            c = "0"
                        END IF
                        MidFragment = c
                    END IF

                    IF (TheOperator = "&") THEN
                        IF ((ArgLeft <> "") AND (ArgRight <> "")) THEN
                            c = "1"
                        ELSE
                            c = "0"
                        END IF
                        MidFragment = c
                    END IF

                    IF (TheOperator = "|") THEN
                        IF ((ArgLeft <> "") OR (ArgRight <> "")) THEN
                            c = "1"
                        ELSE
                            c = "0"
                        END IF
                        MidFragment = c
                    END IF

                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF
            END IF

            ' Case: vector @ vector
            IF (TheReturn = TheString) THEN
                IF ((TypeLeft = "vector") AND (TypeRight = "vector")) THEN

                    IF (TheOperator = "^") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "^")
                    END IF
                    IF (TheOperator = "*") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "*")
                    END IF
                    IF (TheOperator = "/") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "/")
                    END IF
                    IF (TheOperator = "%") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "/")
                    END IF
                    IF (TheOperator = "+") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "+")
                    END IF
                    IF (TheOperator = "-") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "-")
                    END IF
                    IF (TheOperator = "=") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "=")
                    END IF
                    IF (TheOperator = "&") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "&")
                    END IF
                    IF (TheOperator = "|") THEN
                        MidFragment = VectorASMD$(ArgLeft, ArgRight, "|")
                    END IF

                    TheReturn = LeftFragment + MidFragment + RightFragment
                END IF

            END IF
        ELSE
            TheString = c3
            TheReturn = TheString
        END IF

    END IF

    IF (TheReturn = "") THEN
        TheReturn = TheString
    END IF

    NumberCrunch$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION SubExecute$ (TheScriptIn AS STRING, TheModeIn AS STRING, ScopeSwitchIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheScript AS STRING
    DIM TheMode AS STRING
    DIM ScopeSwitch AS STRING
    DIM TheFile AS STRING
    DIM AnchorCount AS INTEGER
    DIM LineCount AS INTEGER
    DIM LoopCounter AS INTEGER
    DIM LoopIndex AS INTEGER
    DIM LineIndex AS INTEGER
    DIM k AS INTEGER
    DIM m AS INTEGER
    DIM c AS STRING
    DIM d AS STRING
    DIM EvalDone AS INTEGER
    DIM FunctionListSizeOrig AS INTEGER
    DIM VariableListSizeOrig AS INTEGER
    TheReturn = ""
    TheScript = TheScriptIn
    TheMode = TheModeIn
    ScopeSwitch = ScopeSwitchIn
    AnchorCount = 0
    LineCount = 0
    LoopCounter = 0
    LoopIndex = 0
    LineIndex = 0
    EvalDone = 0

    IF (ScopeSwitch = "_yes") THEN
        ' Increment function and variable scope.
        FunctionListSizeOrig = FunctionListSize
        VariableListSizeOrig = VariableListSize
        ScopeLevel = ScopeLevel + 1
        FOR k = 1 TO FunctionListSize
            FunctionListScope(k, 1, ScopeLevel) = FunctionList(k, 1)
            FunctionListScope(k, 2, ScopeLevel) = FunctionList(k, 2)
        NEXT
        FOR k = 1 TO VariableListSize
            VariableListScope(k, 1, ScopeLevel) = VariableList(k, 1)
            VariableListScope(k, 2, ScopeLevel) = VariableList(k, 2)
        NEXT
    END IF

    IF (TheMode = "file") THEN
        TheFile = RemoveWrapping$(TheScript, "`'")
        TheScript = ""

        ' CPP: STARTSKIP
        ' JavaScript: STARTSKIP

        'IF (_FILEEXISTS(TheFile)) THEN
        OPEN TheFile FOR INPUT AS #1
        DO WHILE NOT EOF(1)
            LINE INPUT #1, d
            d = LTRIM$(RTRIM$(d))
            TheScript = TheScript + d
        LOOP
        CLOSE #1
        'ELSE
        '    TheScript = "print_`ERROR: File not found.'"
        'END IF
        ' CPP: ENDSKIP
        ' JavaScript: ENDSKIP

        ' JavaScript: STARTSKIP
        ' CPP: STARTSKIP
        '\\ Special lines for nodejs file IO.
        '\\ var data = "";
        '\\ var fs = require("fs");
        '\\ if (fs.existsSync(TheFile)) {data = fs.readFileSync(TheFile, "utf8");}
        ' CPP: ENDSKIP
        ' JavaScript: ENDSKIP

        ' CPP: STARTSKIP
        '\\$.ajax({
        '\\     url: "../" + TheFile,
        '\\     async: false,
        '\\     dataType: "text",
        '\\     success: function (data){
        '\\          TheScript = data;
        '\\     }
        '\\});
        '\\TheScript = TheScript.replace(/(\r\n|\n|\r)/gm,"");
        ' CPP: ENDSKIP

        ' JavaScript: STARTSKIP
        '\\std::ifstream myfile(TheFile.c_str());
        '\\if (myfile.is_open()) {
        '\\    while (std::getline(myfile, d)) {
        '\\        c = lTRIM(rTRIM(d));
        '\\        TheScript.append("\n");
        '\\        TheScript.append(c);
        '\\    }
        '\\    myfile.close();
        '\\}
        ' JavaScript: ENDSKIP

        TheScript = ManageWhiteSpace$(TheScript)
    END IF

    LineCount = CountElements("(" + TheScript + ")", ":")

    ' Scale arrays according to line count.
    ' Offsets of +1 added to accomodate C++ implementation.

    DIM ScriptLine(LineCount + 1) AS STRING
    DIM ScriptLinePrintFlag(LineCount + 1) AS INTEGER
    DIM LoopStartPosition(LineCount + 1) AS INTEGER
    DIM LoopIterationCount(LineCount + 1) AS INTEGER
    DIM AnchorList(LineCount + 1, 2) AS STRING

    ' CPP: STARTSKIP
    '\\for (k = 1; k <= 299; k += 1) {
    '\\    AnchorList[k] = new Array(2);
    '\\}
    ' CPP: ENDSKIP

    ' Break input string apart at each (:) symbol.
    m = 0
    DO WHILE (1 = 1)
        k = GetSeparatorPos("(" + TheScript + ")", ":", 1, 1) - 1
        IF (k > -1) THEN
            m = m + 1
            ScriptLine(m) = LEFT$(TheScript, k - 1)
            TheScript = RIGHT$(TheScript, LEN(TheScript) - k)
        ELSE
            m = m + 1
            ScriptLine(m) = TheScript
            EXIT DO
        END IF
    LOOP

    ' Prepare loops.
    k = LineCount
    DO WHILE (k > 1)
        FOR k = LineCount TO 1 STEP -1
            IF (ScriptLine(k) = "do") THEN
                LoopCounter = LoopCounter + 1
                ScriptLine(k) = "_do " + LTRIM$(STR$(LoopCounter))
                LoopStartPosition(LoopCounter) = k
                FOR m = k TO LineCount
                    IF (ScriptLine(m) = "loop") THEN
                        ScriptLine(m) = "_loop " + LTRIM$(STR$(LoopCounter))
                        EXIT FOR
                    END IF
                NEXT
                EXIT FOR
            END IF
        NEXT
    LOOP

    ' Prepare `print' and `anchor'.
    FOR k = 1 TO LineCount
        c = ScriptLine(k)
        ScriptLinePrintFlag(k) = 0
        IF (LEFT$(c, 6) = "print_") THEN
            ScriptLinePrintFlag(k) = 1
            ScriptLine(k) = RIGHT$(c, LEN(c) - 6)
        END IF
        IF (LEFT$(c, 7) = "anchor_") THEN
            AnchorCount = AnchorCount + 1
            AnchorList(AnchorCount, 1) = RIGHT$(c, LEN(c) - 7)
            AnchorList(AnchorCount, 2) = LTRIM$(STR$(k))
        END IF
    NEXT

    '
    ' Main script evaluation loop.
    '
    DO WHILE (LineIndex < LineCount)
        LineIndex = LineIndex + 1
        c = ScriptLine(LineIndex)
        EvalDone = 0

        IF (LEFT$(c, 3) = "_do") THEN
            EvalDone = 1
            LoopIndex = VAL(RIGHT$(c, LEN(c) - 3))
            LoopIterationCount(LoopIndex) = VAL(InternalEval$(ScriptLine(LineIndex - 1)))
        END IF

        IF (LEFT$(c, 5) = "_loop") THEN
            EvalDone = 1
            LoopIndex = VAL(RIGHT$(c, LEN(c) - 5))
            IF (LoopIterationCount(LoopIndex) > 1) THEN
                LoopIterationCount(LoopIndex) = LoopIterationCount(LoopIndex) - 1
                LineIndex = LoopStartPosition(LoopIndex)
            END IF
        END IF

        IF (LEFT$(c, 5) = "goto_") THEN
            EvalDone = 1
            FOR k = 1 TO AnchorCount
                IF (AnchorList(k, 1) = InternalEval$(RIGHT$(c, LEN(c) - 5))) THEN
                    LineIndex = VAL(AnchorList(k, 2))
                END IF
            NEXT
        END IF

        IF (LEFT$(c, 3) = "if_") THEN
            EvalDone = 1
            c = RIGHT$(c, LEN(c) - 3)
            k = ScanForOperator(c, "@")
            d = RIGHT$(c, LEN(c) - k)
            c = LEFT$(c, k - 1)
            c = InternalEval$(c)
            IF (VAL(c) = 1) THEN
                FOR k = 1 TO AnchorCount
                    IF (AnchorList(k, 1) = d) THEN
                        LineIndex = VAL(AnchorList(k, 2))
                        EXIT FOR
                    END IF
                NEXT
            END IF
        END IF

        IF (LEFT$(c, 7) = "anchor_") THEN
            EvalDone = 1
        END IF

        IF (EvalDone = 0) THEN
            EvalDone = 1
            c = InternalEval$(c)
            IF (ScriptLinePrintFlag(LineIndex) = 1) THEN
                TheReturn = TheReturn + c
            END IF
        END IF

    LOOP

    IF (ScopeSwitch = "_yes") THEN
        ' Decrement function and variable scope.
        FOR k = 1 TO FunctionListSize
            FunctionList(k, 1) = FunctionListScope(k, 1, ScopeLevel)
            FunctionList(k, 2) = FunctionListScope(k, 2, ScopeLevel)
        NEXT
        FOR k = 1 TO VariableListSize
            VariableList(k, 1) = VariableListScope(k, 1, ScopeLevel)
            VariableList(k, 2) = VariableListScope(k, 2, ScopeLevel)
        NEXT
        ScopeLevel = ScopeLevel - 1
        FunctionListSize = FunctionListSizeOrig
        VariableListSize = VariableListSizeOrig
    END IF

    SubExecute$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

' BEGIN sxmath.bm
' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION GetDecimalPos (TheStringIn AS STRING)
    DIM TheReturn AS INTEGER
    DIM TheString AS STRING
    TheString = TheStringIn
    TheReturn = INSTR(TheString, ".")
    IF (TheReturn < 1) THEN
        TheReturn = -1
    END IF
    GetDecimalPos = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION InsertCharacter$ (TheStringIn AS STRING, TheCharIn AS STRING, TheDigitIn AS INTEGER, NumTimesIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TheChar AS STRING
    DIM TheDigit AS INTEGER
    DIM NumTimes AS INTEGER
    DIM a AS STRING
    DIM b AS STRING
    DIM c AS STRING
    DIM k AS INTEGER
    TheString = TheStringIn
    TheChar = TheCharIn
    TheDigit = TheDigitIn
    NumTimes = NumTimesIn
    a = LEFT$(TheString, TheDigit - 1)
    b = ""
    FOR k = 1 TO NumTimes
        b = b + TheChar
    NEXT
    c = RIGHT$(TheString, LEN(TheString) - TheDigit + 1)
    TheReturn = a + b + c
    InsertCharacter$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ReadManyCharacter$ (TheStringIn AS STRING, StartDigitIn AS INTEGER, FinishDigitIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM StartDigit AS INTEGER
    DIM FinishDigit AS INTEGER
    TheString = TheStringIn
    StartDigit = StartDigitIn
    FinishDigit = FinishDigitIn
    TheReturn = ""
    IF ((StartDigit > 0) AND ((FinishDigit - StartDigit) >= 0)) THEN
        TheReturn = MID$(TheString, StartDigit, (FinishDigit - StartDigit) + 1)
    END IF
    ReadManyCharacter$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ReadOneCharacter$ (TheStringIn AS STRING, TheDigitIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TheDigit AS INTEGER
    TheString = TheStringIn
    TheDigit = TheDigitIn
    TheReturn = ""
    IF (TheDigit > 0) THEN
        TheReturn = MID$(TheString, TheDigit, 1)
    END IF
    ReadOneCharacter$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION RemoveCharacter$ (TheStringIn AS STRING, TheDigitIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TheDigit AS INTEGER
    DIM a AS STRING
    DIM b AS STRING
    TheString = TheStringIn
    TheDigit = TheDigitIn
    a = LEFT$(TheString, TheDigit - 1)
    b = RIGHT$(TheString, LEN(TheString) - TheDigit)
    TheReturn = a + b
    RemoveCharacter$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION RemoveDecimal$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM n AS INTEGER
    TheString = TheStringIn
    TheReturn = TheString
    n = GetDecimalPos(TheString)
    IF (n <> -1) THEN
        IF (n = LEN(TheString)) THEN
            TheReturn = LEFT$(TheString, LEN(TheString) - 1)
        ELSE
            TheReturn = LEFT$(TheString, n - 1) + RIGHT$(TheString, (LEN(TheString) - n))
        END IF
    END IF
    RemoveDecimal$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION RemoveSign$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    TheString = TheStringIn
    IF ((LEFT$(TheString, 1) = "+") OR (LEFT$(TheString, 1) = "-")) THEN
        TheReturn = RemoveCharacter$(TheString, 1)
    ELSE
        TheReturn = TheString
    END IF
    RemoveSign$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION RemoveZerosLeft$ (TheStringIn AS STRING, TheStartingDigitIn AS INTEGER)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM TheStartingDigit AS INTEGER
    DIM n AS INTEGER
    DIM i AS INTEGER
    DIM c AS STRING
    TheString = TheStringIn
    TheStartingDigit = TheStartingDigitIn
    n = 0
    FOR i = TheStartingDigit TO LEN(TheString)
        c = ReadOneCharacter$(TheString, i)
        IF (c = "0") THEN
            n = n + 1
        ELSE
            EXIT FOR
        END IF
    NEXT
    TheReturn = LEFT$(TheString, TheStartingDigit - 1) + RIGHT$(TheString, LEN(TheString) - TheStartingDigit - n + 1)
    RemoveZerosLeft$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION RemoveZerosRight$ (TheStringIn AS STRING)
    DIM TheReturn AS STRING
    DIM TheString AS STRING
    DIM n AS INTEGER
    DIM i AS INTEGER
    DIM c AS STRING
    TheString = TheStringIn
    n = 0
    FOR i = LEN(TheString) TO 1 STEP -1
        c = ReadOneCharacter$(TheString, i)
        IF (c = "0") THEN
            n = n + 1
        ELSE
            EXIT FOR
        END IF
    NEXT
    TheReturn = LEFT$(TheString, LEN(TheString) - n)
    RemoveZerosRight$ = TheReturn
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION ReverseSign$ (TheStringIn AS STRING)
    DIM Temp AS STRING
    DIM TheString AS STRING
    TheString = TheStringIn
    Temp = ""
    IF (LEFT$(TheString, 1) = "+") THEN
        Temp = RemoveCharacter$(TheString, 1)
        Temp = "-" + Temp
    END IF
    IF (LEFT$(TheString, 1) = "-") THEN
        Temp = RemoveCharacter$(TheString, 1)
        Temp = "+" + Temp
    END IF
    IF (Temp = "") THEN
        Temp = "-" + TheString
    END IF
    ReverseSign$ = Temp
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION SelectLargerInteger$ (Num1In AS STRING, Num2In AS STRING)
    ' Select the larger of two integers. The arguments must have no sign and no decimal.
    DIM Num1 AS STRING
    DIM Num2 AS STRING
    DIM Temp AS STRING
    DIM LenDiff AS INTEGER
    DIM TempDiff AS INTEGER
    DIM k AS INTEGER
    Num1 = Num1In
    Num2 = Num2In
    Temp = ""
    LenDiff = LEN(Num1) - LEN(Num2)
    IF (LenDiff > 0) THEN
        Temp = "first"
    END IF
    IF (LenDiff < 0) THEN
        Temp = "second"
    END IF
    IF (LenDiff = 0) THEN
        FOR k = 1 TO LEN(Num1)
            TempDiff = VAL(ReadOneCharacter$(Num1, k)) - VAL(ReadOneCharacter$(Num2, k))
            IF (TempDiff <> 0) THEN
                IF (TempDiff > 0) THEN
                    Temp = "first"
                    EXIT FOR
                ELSE
                    Temp = "second"
                    EXIT FOR
                END IF
            END IF
        NEXT
    END IF
    IF (Temp = "") THEN
        Temp = "neither"
    END IF
    SelectLargerInteger$ = Temp
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION RepairFormat$ (TheStringIn AS STRING)
    ' Repair the format of a number.
    DIM Temp AS STRING
    DIM NewSign AS STRING
    DIM n AS INTEGER
    DIM c AS STRING
    DIM i AS INTEGER

    Temp = TheStringIn

    ' Remove and store the sign if there is one.
    NewSign = ""
    IF (LEFT$(Temp, 1) = "+") THEN
        NewSign = "+"
        Temp = RemoveSign$(Temp)
    END IF
    IF (LEFT$(Temp, 1) = "-") THEN
        NewSign = "-"
        Temp = RemoveSign$(Temp)
    END IF
    IF (NewSign = "") THEN
        NewSign = "+"
    END IF

    ' If the string has no decimal, place one at the end of the string.
    IF (GetDecimalPos(Temp) = -1) THEN
        ' This can be made faster.
        Temp = InsertCharacter$(Temp, ".", LEN(Temp) + 1, 1)
    END IF

    ' Remove unnecessary zeros on the left.
    n = 0
    FOR i = 1 TO LEN(Temp)
        c = ReadOneCharacter$(Temp, i)
        IF (c = "0") THEN
            n = n + 1
        ELSE
            EXIT FOR
        END IF
    NEXT
    Temp = RIGHT$(Temp, LEN(Temp) - n)

    ' Remove unnecessary zeros on the right.
    n = 0
    FOR i = LEN(Temp) TO 1 STEP -1
        c = ReadOneCharacter$(Temp, i)
        IF (c = "0") THEN
            n = n + 1
        ELSE
            EXIT FOR
        END IF
    NEXT
    Temp = LEFT$(Temp, LEN(Temp) - n)

    ' If last character is a decimal then add a zero to the right.
    IF (RIGHT$(Temp, 1) = ".") THEN
        Temp = Temp + "0"
    END IF

    ' If leading character is a decimal then insert a zero to the left.
    IF (LEFT$(Temp, 1) = ".") THEN
        Temp = "0" + Temp
    END IF

    ' Attach the sign on the left.
    Temp = NewSign + Temp

    IF (Temp = "-0.0") THEN
        Temp = "+0.0"
    END IF

    RepairFormat$ = Temp
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION InternalAdd$ (Num1In AS STRING, Num2In AS STRING)
    DIM Num1 AS STRING
    DIM Num2 AS STRING
    DIM fac1 AS DOUBLE
    DIM fac2 AS DOUBLE
    DIM LenDiff AS INTEGER
    DIM TempSwap AS STRING
    DIM Temp1 AS STRING
    DIM Temp2 AS STRING
    DIM Oper AS STRING
    DIM NewSign AS STRING
    DIM ChunkSize AS INTEGER
    DIM TheSum AS STRING
    DIM Remainder AS INTEGER
    DIM SubFactor AS INTEGER
    DIM psum AS INTEGER
    DIM PartialSum AS STRING
    DIM TempDiff AS INTEGER
    DIM TotalDecimalPlaces AS INTEGER
    DIM k AS INTEGER
    Num1 = Num1In
    Num2 = Num2In

    ' Add zeros to the right of the decimal of the shorter partial string.
    LenDiff = (LEN(Num1) - GetDecimalPos(Num1)) - (LEN(Num2) - GetDecimalPos(Num2))
    IF (LenDiff > 0) THEN
        Num2 = InsertCharacter$(Num2, "0", LEN(Num2) + 1, LenDiff)
    ELSE
        Num1 = InsertCharacter$(Num1, "0", LEN(Num1) + 1, -LenDiff)
    END IF

    ' Force Num1 to be the number with the greatest magnitude.
    LenDiff = LEN(Num1) - LEN(Num2)
    IF (LenDiff < 0) THEN
        TempSwap = Num1
        Num1 = Num2
        Num2 = TempSwap
    END IF
    IF (LenDiff = 0) THEN
        Temp1 = RemoveDecimal$(Num1)
        Temp2 = RemoveDecimal$(Num2)
        Temp1 = RemoveSign$(Temp1)
        Temp2 = RemoveSign$(Temp2)
        FOR k = 1 TO LEN(Temp1)
            TempDiff = VAL(ReadOneCharacter$(Temp1, k)) - VAL(ReadOneCharacter$(Temp2, k))
            IF (TempDiff <> 0) THEN
                IF (TempDiff > 0) THEN
                    EXIT FOR
                ELSE
                    TempSwap = Num1
                    Num1 = Num2
                    Num2 = TempSwap
                    EXIT FOR
                END IF
            END IF
        NEXT
    END IF

    'Add zeros to the left of Num2 to normalize lengths.
    Num2 = InsertCharacter$(Num2, "0", 2, LEN(Num1) - LEN(Num2))

    ' Determine the sign of the result.
    IF ((LEFT$(Num1, 1) = "+") AND (LEFT$(Num2, 1) = "+")) THEN
        Oper = "add"
        NewSign = "+"
    END IF
    IF ((LEFT$(Num1, 1) = "-") AND (LEFT$(Num2, 1) = "-")) THEN
        Oper = "add"
        NewSign = "-"
    END IF
    IF ((LEFT$(Num1, 1) = "+") AND (LEFT$(Num2, 1) = "-")) THEN
        Oper = "subtract"
        NewSign = "+"
    END IF
    IF ((LEFT$(Num1, 1) = "-") AND (LEFT$(Num2, 1) = "+")) THEN
        Oper = "subtract"
        NewSign = "-"
    END IF

    ' Remove the leading sign from each string.
    Num1 = RemoveSign$(Num1)
    Num2 = RemoveSign$(Num2)

    ' Remove the decimal from each number after storing the total number of
    ' decimal places in a new variable (to be restored after the operation).
    TotalDecimalPlaces = (LEN(Num1) - GetDecimalPos(Num1))
    IF (TotalDecimalPlaces > 0) THEN
        Num1 = RemoveDecimal$(Num1)
        Num2 = RemoveDecimal$(Num2)
    END IF

    ' Initialize internal addition and subtraction loop.
    ChunkSize = 4
    TheSum = ""
    Remainder = 0

    ' This formula is nice but a hardcoded value is faster.
    'SubFactor = VAL(InsertCharacter$("1", "0", 2, ChunkSize))
    SubFactor = 10000

    '''
    FOR k = 1 TO ChunkSize - (LEN(Num1) MOD ChunkSize)
        Num1 = "0" + Num1
        Num2 = "0" + Num2
    NEXT
    '''

    'IF (LEN(Num1) < ChunkSize) THEN
    '    FOR k = 1 TO ChunkSize - LEN(Num1)
    '        Num1 = "0" + Num1
    '        Num2 = "0" + Num2
    '    NEXT
    'END IF

    'IF (LEN(Num1) > ChunkSize) THEN
    '    FOR k = 1 TO ChunkSize - (LEN(Num1) MOD ChunkSize)
    '        Num1 = "0" + Num1
    '        Num2 = "0" + Num2
    '    NEXT
    'END IF

    'IF (LEN(Num1) > ChunkSize) THEN
    DO WHILE ((LEN(Num1) MOD ChunkSize) <> 0)
        Num1 = "0" + Num1
        Num2 = "0" + Num2
    LOOP
    'END IF

    ' Execute internal addition and subtraction loop.

    IF (Oper = "add") THEN
        FOR k = LEN(Num1) TO 1 STEP -ChunkSize
            fac1 = VAL(ReadManyCharacter$(Num1, k - ChunkSize + 1, k))
            fac2 = VAL(ReadManyCharacter$(Num2, k - ChunkSize + 1, k))
            psum = fac1 + fac2 + Remainder
            PartialSum = LTRIM$(RTRIM$(STR$(psum)))
            DO WHILE (LEN(PartialSum) < ChunkSize)
                PartialSum = "0" + PartialSum
            LOOP
            IF (LEN(PartialSum) = ChunkSize + 1) THEN
                Remainder = 1
                PartialSum = RemoveCharacter$(PartialSum, 1)
            ELSE
                Remainder = 0
            END IF
            TheSum = LEFT$(LTRIM$(PartialSum), ChunkSize) + TheSum
        NEXT
    END IF

    IF (Oper = "subtract") THEN
        FOR k = LEN(Num1) TO 1 STEP -ChunkSize
            fac1 = VAL(ReadManyCharacter$(Num1, k - ChunkSize + 1, k))
            fac2 = VAL(ReadManyCharacter$(Num2, k - ChunkSize + 1, k))
            psum = fac1 - fac2 + SubFactor - Remainder
            PartialSum = LTRIM$(STR$(psum))
            DO WHILE (LEN(PartialSum) < ChunkSize)
                PartialSum = "0" + PartialSum
            LOOP
            IF (LEN(PartialSum) > ChunkSize) THEN
                PartialSum = RemoveCharacter$(PartialSum, 1)
                Remainder = 0
            ELSE
                Remainder = 1
            END IF
            TheSum = LEFT$(LTRIM$(PartialSum), ChunkSize) + TheSum
        NEXT
    END IF

    ' Correct the string format.
    TheSum = RemoveSign$(TheSum)

    ' Restore the decimal point.
    TheSum = InsertCharacter$(TheSum, ".", LEN(TheSum) - TotalDecimalPlaces + 1, 1)

    ' If the result ends in a decimal then fix the format.
    IF (RIGHT$(TheSum, 1) = ".") THEN
        TheSum = TheSum + "0"
    END IF

    ' Remove unnecessary zeros.
    TheSum = RemoveZerosLeft$(TheSum, 1)

    ' If the result begins in a decimal then fix the format.
    IF (LEFT$(TheSum, 1) = ".") THEN
        TheSum = "0" + TheSum
    END IF

    ' Assign the proper sign to the result.
    TheSum = NewSign + TheSum

    InternalAdd$ = TheSum
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION InternalSub$ (Num1In AS STRING, Num2In AS STRING)
    DIM Num1 AS STRING
    DIM Num2 AS STRING
    Num1 = Num1In
    Num2 = Num2In
    InternalSub$ = InternalAdd$(Num1, ReverseSign$(Num2))
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION InternalMul$ (Num1In AS STRING, Num2In AS STRING)
    DIM Num1 AS STRING
    DIM Num2 AS STRING
    DIM Temp AS STRING
    DIM NewSign AS STRING
    DIM Prod AS STRING
    DIM TheProd AS STRING
    DIM TempMult AS STRING
    DIM CarryOver AS INTEGER
    DIM PresentDigit AS INTEGER
    DIM TotalDecimalPlaces AS INTEGER
    DIM WorkingDigit AS INTEGER
    DIM tempswap AS STRING
    DIM i AS INTEGER
    DIM k AS INTEGER
    DIM q AS INTEGER

    Num1 = Num1In
    Num2 = Num2In
    Temp = ""

    ' Problem requires post-DOUBLE precision.
    IF (Temp = "") THEN

        ' Remove unneessary zeros.
        Num1 = RemoveZerosRight$(Num1)
        Num2 = RemoveZerosRight$(Num2)

        ' Remove the decimal from each number after storing the total number of
        ' decimal places in a new variable (to be restored after the multiplication).
        TotalDecimalPlaces = (LEN(Num1) - GetDecimalPos(Num1)) + (LEN(Num2) - GetDecimalPos(Num2))
        Num1 = RemoveDecimal$(Num1)
        Num2 = RemoveDecimal$(Num2)

        ' Determine the sign of the result.
        IF ((LEFT$(Num1, 1) = "+") AND (LEFT$(Num2, 1) = "+")) THEN
            NewSign = "+"
        END IF
        IF ((LEFT$(Num1, 1) = "-") AND (LEFT$(Num2, 1) = "-")) THEN
            NewSign = "+"
        END IF
        IF ((LEFT$(Num1, 1) = "+") AND (LEFT$(Num2, 1) = "-")) THEN
            NewSign = "-"
        END IF
        IF ((LEFT$(Num1, 1) = "-") AND (LEFT$(Num2, 1) = "+")) THEN
            NewSign = "-"
        END IF

        ' Remove the leading sign from each string.
        Num1 = RemoveSign$(Num1)
        Num2 = RemoveSign$(Num2)

        ' Force Num1 to be the number with the greatest length.
        IF (LEN(Num2) > LEN(Num1)) THEN

            tempswap = Num1
            Num1 = Num2
            Num2 = tempswap
        END IF

        ' Add a zero to the left of each string.
        ' This is necessary when the length of the result surpasses that of the input.
        Num1 = "0" + Num1
        Num2 = "0" + Num2

        ' Initialize internal multiplication loop.
        TheProd = "+0.0"
        TempMult = ""
        CarryOver = 0

        ' Execute internal multiplication loop.
        FOR k = LEN(Num2) TO 1 STEP -1
            WorkingDigit = VAL(ReadOneCharacter$(Num2, k))
            TempMult = ""
            CarryOver = 0
            FOR i = LEN(Num1) TO 1 STEP -1
                PresentDigit = VAL(ReadOneCharacter$(Num1, i))
                Prod = STR$(PresentDigit * WorkingDigit + CarryOver)
                Prod = LTRIM$(RTRIM$(Prod))
                IF (LEN(Prod) = 1) THEN
                    CarryOver = 0
                    TempMult = Prod + TempMult
                END IF
                IF (LEN(Prod) = 2) THEN
                    CarryOver = VAL(LEFT$(Prod, 1))
                    TempMult = RIGHT$(Prod, 1) + TempMult
                END IF
            NEXT
            TempMult = RemoveZerosLeft$(TempMult, 1)

            IF (TempMult = "") THEN
                TempMult = "+0.0"
            ELSE
                TempMult = "+" + InsertCharacter$(TempMult, "0", LEN(TempMult) + 1, LEN(Num2) - k) + ".0"
            END IF
            TheProd = InternalAdd$(TheProd, TempMult)
        NEXT

        ' Correct the string format.
        TheProd = RemoveSign$(TheProd)
        TheProd = LEFT$(TheProd, LEN(TheProd) - 2)

        ' Restore the decimal point.
        IF (TotalDecimalPlaces > 0) THEN
            q = TotalDecimalPlaces - LEN(TheProd)
            IF (q >= 0) THEN
                TheProd = InsertCharacter$(TheProd, "0", 1, q)
                TheProd = "." + TheProd
            ELSE
                TheProd = InsertCharacter$(TheProd, ".", LEN(TheProd) - TotalDecimalPlaces + 1, 1)
            END IF
            TheProd = RemoveZerosRight$(TheProd)
            IF (RIGHT$(TheProd, 1) = ".") THEN
                TheProd = TheProd + "0"
            END IF
            IF (LEFT$(TheProd, 1) = ".") THEN
                TheProd = "0" + TheProd
            END IF
        ELSE
            TheProd = TheProd + ".0"
        END IF

        ' Assign the proper sign to the result.
        TheProd = NewSign + TheProd

        Temp = TheProd

    END IF

    InternalMul$ = Temp
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION InternalInv$ (DenomIn AS STRING, NumDigitsIn AS INTEGER)
    ' The output of this function does not have fixed length. The output is made such that
    ' NumDigits only counts numerical character 0-9. The sign and decimal are ignored. The overall
    ' string length (zero between decimal and first sig-fig) is thus variable.
    DIM Denom AS STRING
    DIM NumDigits AS INTEGER
    Denom = DenomIn
    NumDigits = NumDigitsIn
    DIM Temp AS STRING
    DIM NewSign AS STRING
    DIM Numerator AS STRING
    DIM TempDiff AS STRING
    DIM TempFactor AS STRING
    DIM TheQuot AS STRING
    DIM TotalDecimalPlaces AS INTEGER
    DIM dpd AS INTEGER
    DIM k AS INTEGER
    DIM m AS INTEGER
    DIM n AS INTEGER

    Temp = ""

    IF (RemoveSign$(Denom) = "0.0") THEN
        Temp = "{ERROR: Division by zero detected in InternalInv.}"
    END IF

    IF (Temp = "") THEN

        ' Determine the sign of the result.
        IF (LEFT$(Denom, 1) = "+") THEN
            NewSign = "+"
        END IF
        IF (LEFT$(Denom, 1) = "-") THEN
            NewSign = "-"
        END IF

        ' Remove the sign from the string.
        Denom = RemoveSign$(Denom)

        ' Remove leading zeros such that string is not of the format 00.000###
        ' but instead #.##
        m = 0
        DO WHILE (m > -1)
            IF ((LEFT$(Denom, 1) = ".") OR (LEFT$(Denom, 1) = "0")) THEN
                m = m + 1
                Denom = RemoveSign$(InternalMul$("+" + Denom, "+10.0"))
            ELSE
                EXIT DO
            END IF
        LOOP

        ' Remove the decimal from the number after storing the total number of
        ' decimal places in a new variable (to be restored after the inversion).
        dpd = GetDecimalPos(Denom)
        TotalDecimalPlaces = LEN(Denom) - dpd
        Denom = RemoveDecimal$(Denom)

        ' Initialize internal inversion loop.
        Numerator = "+1.0"
        TheQuot = ""
        TempFactor = Numerator

        ' Execute internal inversion loop.
        FOR k = 1 TO NumDigits + TotalDecimalPlaces + dpd - 2
            ' ^ The "2" is compensation for the sign and decimal. ^
            n = 0
            DO WHILE (n > -1)
                'Check for a zero in the result.
                TempFactor = RemoveSign$(TempFactor)
                TempFactor = RemoveDecimal$(TempFactor)
                IF (SelectLargerInteger$(TempFactor, Denom) <> "first") THEN
                    EXIT DO
                END IF

                TempDiff = InternalAdd$("+" + TempFactor + ".0", "-" + Denom + ".0")
                TempDiff = RemoveSign$(TempDiff)
                TempDiff = LEFT$(TempDiff, LEN(TempDiff) - 2)
                ' ^ Removes the ".0". ^
                n = n + 1
                TempFactor = TempDiff

                IF (SelectLargerInteger$(TempDiff, Denom) = "second") THEN
                    EXIT DO
                END IF

            LOOP
            IF (k > 1) THEN
                TheQuot = TheQuot + LTRIM$(STR$(n))
            END IF
            TempFactor = TempFactor + "0"
        NEXT

        ' Insert the decimal into the string.
        TheQuot = InsertCharacter$(TheQuot, ".", TotalDecimalPlaces + m, 1)

        ' If string begins with a decimal then add a zero to the left.
        IF (LEFT$(TheQuot, 1) = ".") THEN
            TheQuot = "0" + TheQuot
        END IF

        ' Assign the proper sign to the result.
        TheQuot = NewSign + TheQuot

        Temp = TheQuot

    END IF

    InternalInv$ = Temp
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION InternalDiv$ (NumerIn AS STRING, DenomIn AS STRING, NumDigitsIn AS INTEGER)
    DIM Numer AS STRING
    DIM Denom AS STRING
    DIM NumDigits AS INTEGER
    DIM Temp AS STRING
    DIM Factor AS STRING
    Numer = NumerIn
    Denom = DenomIn
    NumDigits = NumDigitsIn
    Factor = InternalInv$(Denom, NumDigits)
    IF (LEFT$(Factor, 6) <> "{ERROR") THEN
        Temp = InternalMul$(Numer, Factor)
    ELSE
        Temp = "{ERROR: Division by zero passed to InternalDiv.}"
    END IF
    InternalDiv$ = Temp
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION BigNumAdd$ (Num1In AS STRING, Num2In AS STRING)
    DIM Num1 AS STRING
    DIM Num2 AS STRING
    Num1 = Num1In
    Num2 = Num2In
    Num1 = RepairFormat$(Num1)
    Num2 = RepairFormat$(Num2)
    BigNumAdd$ = InternalAdd$(Num1, Num2)
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION BigNumSub$ (Num1In AS STRING, Num2In AS STRING)
    DIM Num1 AS STRING
    DIM Num2 AS STRING
    Num1 = Num1In
    Num2 = Num2In
    Num1 = RepairFormat$(Num1)
    Num2 = RepairFormat$(Num2)
    BigNumSub$ = InternalAdd$(Num1, ReverseSign$(Num2))
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION BigNumMul$ (Num1In AS STRING, Num2In AS STRING)
    DIM Num1 AS STRING
    DIM Num2 AS STRING
    Num1 = Num1In
    Num2 = Num2In
    Num1 = RepairFormat$(Num1)
    Num2 = RepairFormat$(Num2)
    BigNumMul$ = InternalMul$(Num1, Num2)
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION BigNumInv$ (DenomIn AS STRING, NumDigitsIn AS INTEGER)
    DIM Denom AS STRING
    DIM NumDigits AS INTEGER
    Denom = RepairFormat$(DenomIn)
    NumDigits = NumDigitsIn
    BigNumInv$ = InternalInv$(Denom, NumDigits)
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

FUNCTION BigNumDiv$ (NumerIn AS STRING, DenomIn AS STRING, NumDigitsIn AS INTEGER)
    DIM Numer AS STRING
    DIM Denom AS STRING
    DIM NumDigits AS INTEGER
    DIM Temp AS STRING
    DIM Factor AS STRING
    Numer = RepairFormat$(NumerIn)
    Denom = RepairFormat$(DenomIn)
    NumDigits = NumDigitsIn
    Factor = InternalInv$(Denom, NumDigits)
    Temp = ""
    IF (LEFT$(Factor, 6) <> "{ERROR") THEN
        IF (Temp = "") THEN
            Temp = InternalMul$(Numer, Factor)
        END IF
    ELSE
        Temp = "{ERROR: Division by zero passed to BigNumDiv.}"
    END IF
    BigNumDiv$ = Temp
END FUNCTION

' '''''''''' '''''''''' '''''''''' '''''''''' ''''''''''

