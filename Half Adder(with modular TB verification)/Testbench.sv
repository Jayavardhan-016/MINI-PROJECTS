//TESTBENCH:
class transaction;
  randc bit a,b,c;
  task display();
    $display("the data transacted: a=%0b\tb=%0b\tc=%0b",a,b,c);
  endtask
endclass

class generator;
  transaction tx;
  mailbox mbx;
  task run();
    tx=new();
    assert(tx.randomize());
    tx.display();
    $display("data recived       : a=%0b\tb=%0b\tc=%0b",tx.a,tx.b,tx.c);
    mbx.put(tx);
  endtask
endclass

class driver;
  mailbox mbx;
  transaction tx;
  virtual inter inf1;
  task run();
    mbx.get(tx);
    $display("data driven        : a=%0b\tb=%0b\tc=%0b",tx.a,tx.b,tx.c);
    inf1.a=tx.a;
    inf1.b=tx.b;
    inf1.c=tx.c;
    #1;
    $display("output data        : sub=%0b\tbarrow=%0b",inf1.sub,inf1.barrow);
  endtask
endclass

module tb;
  generator gen;
  driver div;
  mailbox mbx;
  inter inf2();
  F_S u1(.a(inf2.a),.b(inf2.b),.c(inf2.c),.sub(inf2.sub),.barrow(inf2.barrow));
  initial begin
    mbx=new();
    gen=new();
    div=new();
    gen.mbx=mbx;
    div.mbx=mbx;
    div.inf1=inf2;
    fork
      repeat(10) begin 
        gen.run();
        div.run();
      end
    join
  end
endmodule
    
