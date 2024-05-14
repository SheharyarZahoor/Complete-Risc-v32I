module pipe1reg
  (
    input clk,
    input reset,
    input [31:0] instruction,
    input [63:0] memAddress, //a
    input flush, 
    input IFIDWrite, 
    output reg [31:0] inst,//instruction out,
    output reg [63:0] memAddressOut
  );
  always @(posedge clk)
    begin
      if (reset == 1'b1 || flush == 1'b1)
        begin
          inst = 32'b0;
         memAddressOut = 64'b0;
        end
      else if (IFIDWrite == 1'b0)
        begin
          inst = instruction;
         memAddressOut = memAddress;
        end
    end
endmodule