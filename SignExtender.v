module SignExtender(BusImm, Imm26, Ctrl); 
   output [63:0] BusImm; 
   input [25:0]  Imm26; 
   input [2:0] Ctrl; 

   assign BusImm = 
      (Ctrl == 3'b000) ? {52'b0, Imm26[21: 10]}: //I
      (Ctrl == 3'b001) ? {{53{Imm26[20]}}, Imm26[20: 12]}: //D: 64-11=53
      (Ctrl == 3'b010) ? {{36{Imm26[25]}}, Imm26[25: 0], 2'b0}: // B: 64-26-2= 36
      (Ctrl == 3'b011) ? {{43{Imm26[23]}}, Imm26[23: 5], 2'b0}: //CB: 64-19-2=43
      (Ctrl == 3'b100) ? {48'b0, Imm26[20: 5]}:
      (Ctrl == 3'b101) ? {32'b0, Imm26[20: 5], 16'b0}:
      (Ctrl == 3'b110) ? {16'b0, Imm26[20: 5], 32'b0}:
      (Ctrl == 3'b111) ? {Imm26[20: 5], 48'b0}:      
      0;   
endmodule
