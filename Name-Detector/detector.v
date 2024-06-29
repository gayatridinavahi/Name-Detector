module hw22 (clk,rst,inp,eurika);
input clk,rst;
input [7:0] inp;
output eurika;

`include "parameters.txt"

enum {NO,SG,SA1,SY,SA2,ST,SR,SI} state;

always @(posedge clk or posedge rst)
begin
	if (rst) state <=NO;
	else 
	case(state)
	NO: state <= inp==G ? SG : NO;
	SG: case (inp)
		A: state<=SA1;
		G: state <= SG;
		default: state<=NO;
		endcase	
	SA1: case (inp)
		Y: state<=SY;
		G: state<=SG;
		default: state<=NO;
		endcase	
	SY: case (inp)
		A: state<=SA2;
		G: state<=SG;
		default: state<=NO;
		endcase		
	SA2: case (inp)
		T: state<=ST;
		G: state<=SG;
		default: state<=NO;
		endcase		
	ST: case (inp)
		R: state<=SR;
		G: state<=SG;
		default: state<=NO;
		endcase		
	SR: case (inp)
		 I: state<=SI;
		 G: state<=SG;
		 default: state<=NO;
		 endcase	
	SI: state <= (inp == G) ? SG : NO;
	
	endcase
end

assign eurika = (state==SI);

endmodule
		
		

	
