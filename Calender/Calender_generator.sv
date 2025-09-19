module calender;
string days[1:7];
string months[0:11];
initial begin
  //Start day of the current month (1=Sun, 2=Mon, etc.).
  static integer start_day=5;
  
  //no.of days in each month
  static integer days_in_month[0:11]={31,28,31,30,31,30,31,31,30,31,30,31};

//day's names
  days[1]="sun";
  days[2]="mon";
  days[3]="tue";
  days[4]="wed";
  days[5]="thu";
  days[6]="fri";
  days[7]="sat";

  //month's names
  months[0]="JANUARY";
  months[1]="FEBRUARY";
  months[2]="MARCH";
  months[3]="APRIL";
  months[4]="MAY";
  months[5]="JUNE";
  months[6]="JULY";
  months[7]="AUGUST";
  months[8]="SEPTEMBER";
  months[9]="OCTOBER";
  months[10]="NOVEMBER";
  months[11]="DECEMBER";

  for(int k=0;k<12;k++) begin
    $display("");
    
    //displaying month name and days
    $display(months[k]);
    $display("%s\t%s\t%s\t%s\t%s\t%s\t%s",days[1], days[2], days[3],days[4], days[5], days[6],days[7]);
    
    
    for (int j=1;j<start_day;j++) begin
      //to skips days upto start day
      $write("\t");
    end
    
    //to print days
    for (int i=1;i<days_in_month[k]+1;i++) begin
      $write("%0d\t",i);
      
      //to enter into new line at the end of each week
      if ((i+start_day-1)%7==0)
        $display("");
    end
    
    //logic to find 1st day in next month
    start_day=((start_day-1)+days_in_month[k])%7+1;
    $display("");
  end
end
endmodule
