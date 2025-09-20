module tb;
  reg [3:0]a,b;
  reg cin;
  wire [3:0]sum;
  wire carry;
  integer i,j,k;
  integer correct=0,incorrect=0;
  rca u1(a,b,cin,sum,carry);
  initial begin
    for (i=0;i<16;i=i+1)begin
      for (j=0;j<16;j=j+1)begin
        for(k=0;k<2;k=k+1)begin
          a=i;b=j;cin=k;
          #10;
          if ({carry,sum}==a+b+cin)begin
            correct=correct+1;
            $display("a=%b  |  b=%b  |  c=%b  |  sum=%b  |  carry=%b  |  it is a true condition ",a,b,cin,sum,carry);
          end
          else begin
            incorrect=incorrect+1;
            $display("a=%b  |  b=%b  |  c=%b  |  sum=%b  |  carry=%b  |  it is a false condition ",a,b,cin,sum,carry);
          end
        end
      end
    end
    $display("total conditions=%0d  |  no.of true conditions are %0d  |  no.of false conditions are %0d  ",(correct+incorrect),correct,incorrect);
  end
endmodule
