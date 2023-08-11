module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [8:0] DataIn,
  output reg [8:0] DataOut,
  input rden, wren
	);
//signal declarations

	reg [8:0] fifo_array[7:0];
	reg [7:0] wrptr, rdptr;
	wire [7:0] wr_cnt, rd_cnt;

  always @ (clk)
  begin
    if(RdPtrClr)
    begin
      rdptr<=8'b00000000;
    end
    if(WrPtrClr)
    begin
      wrptr<=8'b00000000;
    end
    if(RdInc)
    begin
      rdptr<=rdptr+1;
    end
    if(WrInc)
    begin
      wrptr<=wrptr+1;
    end
if(rden) 
begin
 DataOut<=fifo_array[rdptr];
end
if(wren)
begin
  fifo_array[wrptr]<=DataIn;
end
  end
  endmodule
