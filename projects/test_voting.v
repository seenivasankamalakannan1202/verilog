`timescale 1ns/1ps

module votingMachine_tb;

    reg clock;
    reg reset;
    reg mode;

    reg button1;
    reg button2;
    reg button3;
    reg button4;

  wire [7:0] led;


    // ==========================================
    // DUT - Design Under Test
    // ==========================================

    votingMachine dut (
        .clock(clock),
        .reset(reset),
        .mode(mode),

        .button1(button1),
        .button2(button2),
        .button3(button3),
        .button4(button4),

        .led(led)
    );


    // ==========================================
    // Clock Generation
    // Period = 10 ns
    // ==========================================

    always #5 clock = ~clock;


    // ==========================================
    // VCD File Generation
    // ==========================================

    initial begin

        $dumpfile("votingMachine.vcd");
        $dumpvars(0, votingMachine_tb);

    end


    // ==========================================
    // Test Cases
    // ==========================================

    initial begin

        // Initial values

        clock   = 0;
        reset   = 1;
        mode    = 0;

        button1 = 0;
        button2 = 0;
        button3 = 0;
        button4 = 0;


        // ======================================
        // RESET
        // ======================================

        #20;

        reset = 0;


        // ======================================
        // VOTING MODE
        // mode = 0
        // ======================================

        mode = 0;


        // Candidate 1 - Vote 1
        button1 = 1;
        #120;

        button1 = 0;
        #30;


        // Candidate 2 - Vote 1
        button2 = 1;
        #120;

        button2 = 0;
        #30;


        // Candidate 1 - Vote 2
        button1 = 1;
        #120;

        button1 = 0;
        #30;


        // Candidate 3 - Vote 1
        button3 = 1;
        #120;

        button3 = 0;
        #30;


        // ======================================
        // RESULT MODE
        // mode = 1
        // ======================================

        mode = 1;

        #20;


        // Candidate 1 result
        button1 = 1;
        #120;

        button1 = 0;
        #30;


        // Candidate 2 result
        button2 = 1;
        #120;

        button2 = 0;
        #30;


        // Candidate 3 result
        button3 = 1;
        #120;

        button3 = 0;
        #30;


        // Candidate 4 result
        button4 = 1;
        #120;

        button4 = 0;
        #30;


        // ======================================
        // End Simulation
        // ======================================

        #50;

        $finish;

    end


    // ==========================================
    // Display values in terminal
    // ==========================================

    initial begin

        $monitor(
            "Time=%0t | reset=%b | mode=%b | B1=%b B2=%b B3=%b B4=%b | LED=%b",
            $time,
            reset,
            mode,
            button1,
            button2,
            button3,
            button4,
            led
        );

    end

endmodule