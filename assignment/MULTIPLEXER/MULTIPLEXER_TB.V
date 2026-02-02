<--------------------------------------------------mux_2to1------------------------------------------------------->
module mux_2to1_tb;

  reg a, b, sel;
  wire y;

  mux_2to1 UUT (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Table header
    $display("| TIME | A | B | SEL | Y |");
    $display("|------|---|---|-----|---|");

    // Test cases
    a = 0; b = 0; sel = 0; #5;
    $display("| %3t  | %b | %b |  %b  | %b |", $time, a, b, sel, y);

    a = 0; b = 1; sel = 0; #5;
    $display("| %3t  | %b | %b |  %b  | %b |", $time, a, b, sel, y);

    a = 0; b = 1; sel = 1; #5;
    $display("| %3t  | %b | %b |  %b  | %b |", $time, a, b, sel, y);

    a = 1; b = 0; sel = 1; #5;
    $display("| %3t  | %b | %b |  %b  | %b |", $time, a, b, sel, y);

    $display("|------|---|---|-----|---|");
    $finish;
  end

endmodule

