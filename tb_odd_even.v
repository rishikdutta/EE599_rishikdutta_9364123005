
`timescale 1 ns / 1 ps

module testbench;
 
reg clk;
always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end
  reg [7:0] in1, in2, in3, in4, in5;
  always @(negedge clk)
  
  begin
    in1 <= $random;
    in2 <= $random;
    in3 <= $random;
    in4 <= $random;
    in5 <= $random;
end
  initial
  begin
    $monitor ("input is %b,%b,%b,%b,%b and output is %b,%b,%b,%b,%b", in1, in2, in3, in4, in5, out1, out2, out3, out4, out5);
 #40; // allow it to run
 $stop;
 $finish;
end
  wire [7:0] out1, out2, out3, out4, out5;
  sort my_sort (
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .in5(in5),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .out4(out4),
    .out5(out5),
    .clk(clk)
    );
endmodule