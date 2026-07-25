// Half Adder Testbench with VCD Dump
`timescale 1ns/1ps

module tb_half_adder;
    
    // Inputs
    reg a;
    reg b;
    
    // Outputs
    wire sum;
    wire carry;
    
    // Instantiate the Unit Under Test (UUT)
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );
    
    // Generate VCD dump file
    initial begin
        // Create VCD file
        $dumpfile("half_adder.vcd");
        $dumpvars(0, tb_half_adder);
        
        // Optional: Display simulation time and information
        $display("Starting Half Adder Simulation...");
        $display("Time\t a b | sum carry");
        $display("----------------------");
    end
    
    // Stimulus generation
    initial begin
        // Test all possible input combinations
        // Test case 1: 0 + 0 = 0, carry 0
        a = 0; b = 0;
        #10;
        
        // Test case 2: 0 + 1 = 1, carry 0
        a = 0; b = 1;
        #10;
        
        // Test case 3: 1 + 0 = 1, carry 0
        a = 1; b = 0;
        #10;
        
        // Test case 4: 1 + 1 = 0, carry 1
        a = 1; b = 1;
        #10;
        
        // End simulation
        $display("----------------------");
        $display("Simulation completed successfully!");
        $finish;
    end
    
    // Monitor and display results
    initial begin
        $monitor("%0t\t %b %b | %b  %b", 
                 $time, a, b, sum, carry);
    end
    
endmodule