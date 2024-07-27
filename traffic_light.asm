; Define port addresses for 8255 PPI
PPI_CONTROL_PORT EQU 0x003F
PORT_A           EQU 0x0038
PORT_B           EQU 0x0039
PORT_C           EQU 0x003A

; Define bit patterns for the traffic lights
RED_LIGHT        EQU 0x01 ; 0000 0001
YELLOW_LIGHT     EQU 0x02 ; 0000 0010
GREEN_LIGHT      EQU 0x04 ; 0000 0100

; Initialize the 8255 PPI
INIT_PPI:
    MOV AL, 0x80         ; Control word: 1000 0000 (Set all ports to output)
    OUT PPI_CONTROL_PORT, AL
    RET

; Delay routine
DELAY:
    MOV CX, 0FFFFh       ; Large value for delay
DELAY_LOOP:
    NOP                  ; No operation (short delay)
    LOOP DELAY_LOOP      ; Loop until CX is 0
    RET

; Main routine
MAIN:
    CALL INIT_PPI        ; Initialize the 8255 PPI

RED_PHASE:
    MOV AL, RED_LIGHT    ; Set red light
    OUT PORT_A, AL
    CALL DELAY           ; Delay for red light duration

YELLOW_PHASE:
    MOV AL, YELLOW_LIGHT ; Set yellow light
    OUT PORT_A, AL
    CALL DELAY           ; Delay for yellow light duration

GREEN_PHASE:
    MOV AL, GREEN_LIGHT  ; Set green light
    OUT PORT_A, AL
    CALL DELAY           ; Delay for green light duration

    JMP RED_PHASE        ; Repeat the cycle

; Entry point
START:
    JMP MAIN             ; Start the main routine

END START                ; End of the program
