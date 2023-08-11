module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output [3:0]Q,        // Parallel Output 	
    output reg RCO            // Ripple Carry Output (Terminal Count)
); 
reg [3:0]data; 
always @ ( posedge(CLK) )
begin 
if(CLR_n == 0)
begin
data<=0000;    
end
else if( (CLR_n == 1) && (LOAD_n==0)) 
begin
data<=D;      
end
else if( (CLR_n == 1) && (LOAD_n==1) && (ENP==1) && (ENT==1) ) 
begin
data<=data+1;   
end
if(ENT==1 && (&data))
begin
RCO<=1;
end
end
assign Q=data;
endmodule