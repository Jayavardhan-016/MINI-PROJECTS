module F_S(input a,b,c,
           output sub,barrow);
  assign {sub,barrow}={a^b^c,~a&b|b&c|c&~a};
endmodule

interface inter;
  logic a,b,c;
  logic sub,barrow;
endinterface
