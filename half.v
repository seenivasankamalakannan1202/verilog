// Half Adder Module
module half_adder (
    input  a,      // First input
    input  b,      // Second input
    output sum,    // Sum output
    output carry   // Carry output
);
    
    // Combinational logic for half adder
    assign sum   = a ^ b;   // XOR for sum
    assign carry = a & b;   // AND for carry
    
endmodule