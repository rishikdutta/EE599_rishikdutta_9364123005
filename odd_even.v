`timescale 1 ns / 1 ps

module sort (
  input  wire clk,
  input  wire [15:0] in1, in2, in3, in4, in5,
  output reg  [15:0] out1, out2, out3, out4, out5
  );
  reg [15:0] dat1, dat2, dat3, dat4, dat5;
  always @(posedge clk)
  begin
      dat1 <= in1;
      dat2 <= in2;
      dat3 <= in3;
      dat4 <= in4;
      dat5 <= in5;
  end
    integer i, j;
    reg [15:0] temp;
    reg [15:0] array [1:5];
    always @*
    begin
  array[1] = dat1;
  array[2] = dat2;
  array[3] = dat3;
  array[4] = dat4;
  array[5] = dat5;
      for (i = 1; i <= 5; i = i + 1) begin
    if (i%2 != 0) begin
      for (j = 0 ; j < 2; j = j + 1) begin
        if (array[2*j+1] > array[2*j + 2])
              begin
                temp = array[2*j + 1];
                array[2*j + 1] = array[2*j + 2];
                array[2*j + 2] = temp;
      end end
    end
    else if (i%2 ==0) begin
      for (j = 1 ; j <= 2; j = j + 1) begin
        if (array[2*j] > array[2*j + 1])
              begin
                temp = array[2*j];
                array[2*j] = array[2*j + 1];
                array[2*j + 1] = temp;
      end end
    end
    
  
      end end
    always @(posedge clk)
    begin
      out1 <= array[1];
      out2 <= array[2];
      out3 <= array[3];
      out4 <= array[4];
      out5 <= array[5];
  end
  endmodule