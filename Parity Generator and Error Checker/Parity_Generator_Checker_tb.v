`timescale 1ns / 1ps

module Parity_Generator_Checker_tb;
  // Inputs
  reg A, B, C;
  reg parity_in;

  // Outputs
  wire even_parity_gen;
  wire odd_parity_gen;
  wire even_parity_Error;
  wire odd_parity_Error;

  
  Parity_Generator_Checker uut (A,B,C,parity_in,even_parity_gen,odd_parity_gen,
                                even_parity_Error,odd_parity_Error);

  initial begin
      // Display header
      $display(" A B C P_in | EvenGen OddGen | EvenErr OddErr");
      $monitor("%b %b %b %b | %b %b | %b %b", 
                 A, B, C, parity_in, 
                even_parity_gen, odd_parity_gen, 
                even_parity_Error, odd_parity_Error);
       // Test 1: 000 data, parity 0
      A = 0; B = 0; C = 0; parity_in = 0;
      #100;
      // Test 2: 000 data, parity 1 (should show error for even parity)
      A = 0; B = 0; C = 0; parity_in = 1;
      #100;
      // Test 3: 101 data, correct even parity
      A = 1; B = 0; C = 1; parity_in = (1 ^ 0 ^ 1);
      #100;
      // Test 4: 101 data, wrong even parity
      A = 1; B = 0; C = 1; parity_in = ~ (1 ^ 0 ^ 1);
      #100;
      // Test 5: 111 data, correct even parity
      A = 1; B = 1; C = 1; parity_in = (1 ^ 1 ^ 1);
      #100;
      // Test 6: 111 data, wrong even parity
      A = 1; B = 1; C = 1; parity_in = ~ (1 ^ 1 ^ 1);
      #100; // Test 7: 010 data, parity 0
      A = 0; B = 1; C = 0; parity_in = 0;
      #100;

      $finish;
  end
endmodule
