module tb;
reg clk,rst;
reg [7:0] inp,inpPUSHED_INTO_NBA_REGION=0;
wire eurika;
always @(inp) inpPUSHED_INTO_NBA_REGION <= inp;

hw22 KABALI (clk,rst,inpPUSHED_INTO_NBA_REGION,eurika);
`include "parameters.txt"

initial
	begin
	repeat(5) @(posedge clk)
	inp=G;@(posedge clk);
	inp=A;@(posedge clk);
	inp=Y;@(posedge clk);
	inp=A;@(posedge clk);
	inp=T;@(posedge clk);
	inp=R;@(posedge clk);
	inp=I;@(posedge clk);
	inp=S;@(posedge clk);
	inp=X;@(posedge clk);
	inp=P;@(posedge clk);
	inp=G;@(posedge clk);
	inp=A;@(posedge clk);
	inp=P;@(posedge clk);
	inp=A;@(posedge clk);
	inp=T;@(posedge clk);
	inp=R;@(posedge clk);
	inp=I;@(posedge clk);
	
	$finish;
	end
	
always #5 clk =!clk;

initial 
	begin
	clk=0;
	inp="";
	rst=1;
	#2;
	rst=0;
	end
	
endmodule
	
