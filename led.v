module led(
    input clk,
    input rst_n,
    output led_flash
);

reg [31:0] cnt;
reg led_temp;

always@(posedge clk, negedge rst_n) begin
    if(~rst_n) begin 
        cnt <= 32'd0;
    end 
    else if(cnt == 32'd49_999_999) begin 
        cnt <= 32'd0;
    end 
    else begin 
        cnt <= cnt + 32'd1;
    end 
end

always@(posedge clk, negedge rst_n) begin 
    if(~rst_n) begin 
        led_temp <= 1'd0;
    end 
    else if(cnt == 32'd49_999_999) begin
        led_temp <= ~led_temp;
    end 
    else begin 
        led_temp <= led_temp;
    end 
end 

assign led_flash <= led_temp;

endmodule 