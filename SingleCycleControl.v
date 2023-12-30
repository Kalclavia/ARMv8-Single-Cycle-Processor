`define OPCODE_ANDREG 11'b?0001010???
`define OPCODE_ORRREG 11'b?0101010???
`define OPCODE_ADDREG 11'b?0?01011???
`define OPCODE_SUBREG 11'b?1?01011???

`define OPCODE_ADDIMM 11'b?0?10001???
`define OPCODE_SUBIMM 11'b?1?10001???

`define OPCODE_MOVZ   11'b110100101?? // lower 3 bits are the sign_op 
`define OPCODE_MOVZ0   11'b11010010100
`define OPCODE_MOVZ16   11'b11010010101
`define OPCODE_MOVZ32   11'b11010010110
`define OPCODE_MOVZ48   11'b11010010111

`define OPCODE_B      11'b?00101?????
`define OPCODE_CBZ    11'b?011010????

`define OPCODE_LDUR   11'b??111000010
`define OPCODE_STUR   11'b??111000000

module control(
	       output reg 	reg2loc,
	       output reg 	alusrc,
	       output reg 	mem2reg,
	       output reg 	regwrite,
	       output reg 	memread,
	       output reg 	memwrite,
	       output reg 	branch,
	       output reg 	uncond_branch,
	       output reg [3:0] aluop,
	       output reg [2:0] signop,
	       input [10:0] 	opcode
	       );

   always @(*)
     begin
	casez (opcode)
            `OPCODE_ANDREG: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b0;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0000;
                assign signop        = 3'bxxx;
            end
            `OPCODE_ORRREG: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b0;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0001;
                assign signop        = 3'bxxx;
            end
            `OPCODE_ADDREG: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b0;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0010;
                assign signop        = 3'bxxx;
            end
	    `OPCODE_MOVZ0: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b1;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0111;
                assign signop        = 3'b100;
            end
	    `OPCODE_MOVZ16: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b1;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0111;
                assign signop        = 3'b101;
            end
	    `OPCODE_MOVZ32: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b1;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0111;
                assign signop        = 3'b110;
            end
	    `OPCODE_MOVZ48: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b1;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0111;
                assign signop        = 3'b111;
            end
            `OPCODE_SUBREG: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b0;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0110;
                assign signop        = 3'bxxx;
            end
            `OPCODE_ADDIMM: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b0;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0010;
                assign signop        = 3'b000;
            end
	    `OPCODE_SUBIMM: begin
                assign reg2loc       = 1'b0;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'b0;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b0;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0110;
                assign signop        = 3'b000;
            end
	    `OPCODE_B: begin
                assign reg2loc       = 1'bx;
	        assign uncond_branch = 1'b1;
		assign branch        = 1'bx;
		assign memread       = 1'b0;
		assign mem2reg       = 1'bx;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b0;
                assign regwrite      = 1'b0;
                assign aluop         = 4'bxxxx;
                assign signop        = 3'b010;
            end
	    `OPCODE_CBZ: begin
                assign reg2loc       = 1'b1;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b1;
		assign memread       = 1'b0;
		assign mem2reg       = 1'bx;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b0;
                assign regwrite      = 1'b0;
                assign aluop         = 4'b0111;
                assign signop        = 3'b011;
            end
	    `OPCODE_LDUR: begin
                assign reg2loc       = 1'bx;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b1;
		assign mem2reg       = 1'b1;
		assign memwrite      = 1'b0;
	        assign alusrc        = 1'b1;
                assign regwrite      = 1'b1;
                assign aluop         = 4'b0010;
                assign signop        = 3'b001;
            end
	    `OPCODE_STUR: begin
                assign reg2loc       = 1'b1;
	        assign uncond_branch = 1'b0;
		assign branch        = 1'b0;
		assign memread       = 1'b0;
		assign mem2reg       = 1'bx;
		assign memwrite      = 1'b1;
	        assign alusrc        = 1'b1;
                assign regwrite      = 1'b0;
                assign aluop         = 4'b0010;
                assign signop        = 3'b001;
            end
          default:
            begin
               reg2loc       = 1'bx;
               alusrc        = 1'bx;
               mem2reg       = 1'bx;
               regwrite      = 1'b0;
               memread       = 1'b0;
               memwrite      = 1'b0;
               branch        = 1'b0;
               uncond_branch = 1'b0;
               aluop         = 4'bxxxx;
               signop        = 3'bxxx;
            end
	endcase
     end

endmodule

