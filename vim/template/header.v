module  template(
                input clock,
                input reset 
                //inputs ... 
                
                
                
                //outputs ...  
                 
                
                );

    
    reg [6:0] divcnt;	    


    always @(posedge clock )begin
        if (reset) begin
            divcnt <= 0;
        end else begin
            divcnt <=   divcnt +1'b1;
        end 
    end    

endmodule


