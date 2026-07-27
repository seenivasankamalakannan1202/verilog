module bitwise_operation();

    reg [5:0] x = 0;
    reg [5:0] y = 0;
    reg [5:0] result = 0;

    initial begin
        $monitor("Time=%0t, x=%b, y=%b, result=%b",
                 $time, x, y, result);
    end

    initial begin

        // AND
        #1;
        x = 6'b00_0101;
        y = 6'b11_0001;
        result = x & y;

        // NAND
        #1;
        result = ~(x & y);

        // OR
        #1;
        x = 6'b10_0101;
        y = 6'b01_1011;
        result = x | y;

        // NOR
        #1;
        result = ~(x | y);

        // XOR
        #1;
        x = 6'b01_0110;
        y = 6'b01_1011;
        result = x ^ y;

        // XNOR
        #1;
        result = x ~^ y;

        // Make x and y equal
        #1;
        x = y;
        result = ~(x ^ y);

        #1;
        $finish;

    end

endmodule