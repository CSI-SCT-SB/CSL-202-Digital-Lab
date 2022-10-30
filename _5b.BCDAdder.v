module bcd_fadd(
  input [3:0] a, b,
  input cin,
  output cout,
  output [3:0] sum
);
  reg [4:0] bin_sum;
  
  always @(*) begin
    bin_sum = a + b + cin;
    
    if (bin_sum > 9)
      bin_sum = bin_sum + 6;
    
  end
  
  assign cout = bin_sum[4];
  assign sum = bin_sum[3:0];
endmodule

// TESTBENCH

module bcd_adder_tb();
  
  reg [3:0] t_a, t_b;
  reg t_cin;
  wire t_cout;
  wire [3:0] t_sum;
  
  bcd_fadd dut(t_a, t_b, t_cin, t_cout, t_sum);
  initial begin
    $dumpfile("bcd_adder.vcd");
    $dumpvars;
    
    t_a = 0; t_b = 0; t_cin = 0;
    #20 t_a = 4'd4; t_b = 4'd5;
    #20 t_a = 4'd9; t_b = 4'd7;
    #20 t_a = 4'd6; t_b = 4'd4;
    #20 t_a = 4'd1; t_b = 4'd8;
  end
  
  initial begin
    $monitor("a = %d, b = %d, cin = %d \t sum = %d, cout = %d", t_a, t_b, t_cin, t_cout, t_sum);
  end
  
endmodule
