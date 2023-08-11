module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);

reg [2:0]Next_State ;
reg [2:0]Current_State;
// Sequential Block 
always @ (posedge(CLK))
begin 
  if (RST) begin
    Next_State<=3'b000;
  end
    Current_State<=Next_State;

end 
// Combo Block 
always @ (In1,Current_State)
begin 
  case (Current_State)
 3'b000: 
    begin
    if(In1 == 0)
    begin
      Next_State<=3'b000;
    end
    else if (In1 == 1)
    begin
       Next_State<=3'b001;
    end  
    Out1<=0;
    end
 3'b001: 
    begin
    if(In1 == 0)
    begin
      Next_State=3'b010;
    end
    else if (In1 == 1)
    begin
       Next_State=3'b001;
    end  
    Out1<=0;
    end
    
 3'b010: 
    begin
    if(In1 == 0)
    begin
      Next_State=3'b010;
    end
    else if (In1 == 1)
    begin
       Next_State=3'b000;
    end  
    Out1<=1;
    end
    default: 
    begin
    Next_State=3'b000;   
    end
  endcase
end 

endmodule