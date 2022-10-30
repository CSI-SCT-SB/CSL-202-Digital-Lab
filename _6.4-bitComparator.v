module comparator(
  input [3:0] A, B,
  output AgB, AlB, AeB // A>B, A<B, A=B
);
  assign AgB = (A > B);
  assign AlB = (A < B);
  assign AeB = (A == B);
  
endmodule

// TESTBENCH
module comparator_tb;
  
  reg [3:0] t_A, t_B;
  wire t_AgB, t_AlB, t_AeB;
  
  comparator dut (t_A, t_B, t_AgB, t_AlB, t_AeB);
  
  initial begin
    $dumpfile("comp.vcd");
    $dumpvars();
    $monitor("[%4d] (A)%d (B)%d (A>B)%d (A=B)%b (A<B)%b", $time, t_A, t_B, t_AgB, t_AeB, t_AlB);
    
    t_A = 4'd0; t_B  = 4'd0;
    #10 t_A = 4'd3; t_B  = 4'd6;
    #10 t_A = 4'd15; t_B  = 4'd15;
    #10 t_A = 4'd10; t_B  = 4'd6;
    #10 t_A = 4'd4; t_B  = 4'd0;
    #10 t_A = 4'd0; t_B  = 4'd11;
    #10
    $finish;
    
  end
endmodule
