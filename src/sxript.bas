OPTION _EXPLICIT

REM $Include: 'sxmath.bi'
REM $Include: 'sxript.bi'

_DELAY 1

$EXEICON:'sxript.ico'
'$CHECKING:OFF

$SCREENHIDE
$CONSOLE
_DEST _CONSOLE
$CONSOLE:ONLY

RANDOMIZE TIMER

DIM InternalInput AS STRING
DIM GeneralInput AS STRING
DIM GeneralOutput AS STRING
DIM OutputFile AS STRING

IF (_FILEEXISTS("sxriptstate.txt")) THEN
    OPEN "sxriptstate.txt" FOR INPUT AS #1
    DO WHILE NOT EOF(1)
        LINE INPUT #1, InternalInput
        GeneralInput = GeneralInput + InternalInput
    LOOP
    CLOSE #1
    InternalInput = SxriptEval$("block(" + GeneralInput + ")")
END IF

IF (COMMAND$ <> "") THEN
    GeneralInput = COMMAND$(1)
    GeneralOutput = SxriptEval$(GeneralInput)
    IF (COMMAND$(2) <> "") THEN
        OutputFile = COMMAND$(2)
        OPEN OutputFile FOR OUTPUT AS #1
        PRINT #1, GeneralOutput
        CLOSE #1
    ELSE
        PRINT GeneralOutput
    END IF
    OPEN "sxriptstate.txt" FOR OUTPUT AS #1
    PRINT #1, SxriptEval$("report()")
    CLOSE #1
    SYSTEM
END IF

PRINT
DIM k AS INTEGER
FOR k = 1 TO SxriptLogoSize
    PRINT SxriptLogoText$(k)
NEXT
PRINT
PRINT " *** Welcome to Sxript *** "
PRINT "       (QB64 Build)        "
PRINT

DO
    LINE INPUT ":"; GeneralInput
    GeneralOutput = SxriptEval$(GeneralInput)
    PRINT ":"; GeneralOutput: PRINT
LOOP

END

REM $Include: 'sxmath.bm'
REM $Include: 'sxript.bm'
