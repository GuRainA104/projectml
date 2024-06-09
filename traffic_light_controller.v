`timescale 1ns / 1ps

module testbench();

reg clk;
reg reset;
wire [2:0] lights;

// 实例化交通灯控制器
traffic_light_controller tlc(
    .clk(clk),
    .reset(reset),
    .lights(lights)
);

// 生成时钟信号
initial begin
    clk = 0;
    forever #10 clk = ~clk;  // 产生一个周期为20ns的时钟信号
end

// 测试序列
initial begin
    reset = 1;  // 开始时先进行复位
    #40 reset = 0;  // 释放复位
end

// 监视输出
initial begin
    $monitor("Time = %t, State = %b", $time, lights);
end

endmodule