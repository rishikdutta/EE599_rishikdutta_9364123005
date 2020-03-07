module multiplier #(parameter k = 2)(input[k-1:0]a, input[k-1:0]b, output[2*k-1:0] out);
  reg [2*k-1:0] out;
  assign out = a*b;
endmodule

module adder #(parameter k = 4)(input[k-1:0]a, input[k-1:0]b, output[2*k-1:0] out);
  reg [2*k-1:0] out;
  assign out = a+b;
endmodule

module matrix #(parameter n=2)(input [n*n*8-1:0]a, input [n*n*8-1:0]b, output [n*n*8-1:0]out);
  
  reg [7:0] matrixA[n-1:0][n-1:0],matrixB[n-1:0][n-1:0]; 
  reg [7:0] x[0:n*n-1];
  reg [7:0] y[0:n*n-1];
  wire [2*8-1:0] tmp[1:0];
  wire [2*8-1:0] mout[0:n-1][0:n-1];
  wire [2*8-1:0] mout_temp[0:n-1][0:n-1];
  
  genvar i,j,g;
  generate
    for(i=0;i<n*n;i=i+1) begin:gen1
      //$monitor ("get=%b, full=%b, ", x[i] , a);
      assign x[i] = a[i*8+7:i*8];
    end
    
    for(i=0;i<n*n;i=i+1) begin:gen2
      assign y[i] = b[i*8+7:i*8];
    end 
    
    for(i=0;i<n;i=i+1)begin:gen3
      for(j=0;j<n;j=j+1)begin:gen4
        assign matrixA[i][j] = x[i*n+j];
      end
    end
    
    for(i=0;i<n;i=i+1)begin:gen5
      for(j=0;j<n;j=j+1)begin:gen6
        assign matrixB[i][j] = y[i*n+j];
      end
    end
    
    //assign out = {matrixB[1][1],matrixB[1][0],matrixB[0][1], matrixB[0][0]};
    
    for(i=0;i<n;i=i+1)begin:gen7
      for(j=0;j<n;j=j+1)begin:gen8
        assign mout_temp[i][j] = 8'b 0;
        for(g=0;g<n;g=g+1)begin:gen9
          assign tmp[0] = matrixA[i][g]*matrixB[g][j];
          assign mout_temp[i][j]= tmp[0] + mout[i][j];
          assign mout[i][j] = mout_temp[i][j];
        end
      end
    end
    
    assign out = mout[0][0];
    
    
    
    
    
    
    
  endgenerate
endmodule
                               
                               
                               

