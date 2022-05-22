module modhalfq_tb ();
parameter WIDTH = 13;

reg [WIDTH-1:0] a,c,d;
reg clk,rst;

reg fail;

wire [WIDTH-1:0] b;

always begin
clk = 0;
#1 clk =1;
#1;
end

initial begin
    fail = 0;
    rst = 1;
    #50;
    rst = 0;
end

modhalfq imodhalfq
(
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b)
);


always@(posedge clk) begin
  #50 a = $random;
  c = a/2;
  d = a/2 +1665;
  #50 
  if ((b !== c)&(b !== d)) begin
    $display ("Mismatch at time %d",$time);
    $display ("khi do a=%d",a, "ket qua la %d",c," nhung lai tinh ra la %d",b);
    fail = 1;
  end
end
endmodule
