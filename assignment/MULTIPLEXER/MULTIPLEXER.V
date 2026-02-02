<------------------------------------------ mux_2to1_dataflow_modeling---------------------------------------------->
module mux_2to1(
  		input a,b,sel,
  		output y
);
  
  assign y=(sel)?a:b;
endmodule

<-------------------------------------------gate_level_modeling------------------------------------------------------->

module mux_2to1(
    input a, b, sel,
    output y
);

  wire sel_not, and_1, and_2;

  not g1(sel_not, sel);
  and g2(and_1, a, sel_not);
  and g3(and_2, b, sel);
  or  g4(y, and_1, and_2);

endmodule

