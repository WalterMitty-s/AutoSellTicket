# AutoSellTicket
基于Verilog的自动售票机 课程设计 FPGA实验板
自动售票机，可以完成5元，10元，20元，30元四种票的自动售出，货币的种类可以是1元，5元，10元，50元，100元，能进行自动找零和显示。
 共有五个模块和一个顶层模块：五个模块为控制模块，统计金额模块，出票模块，找零模块和数码管显示模块。顶层模块负责将各个模块进行连接。
  + 统计金额模块：根据货币的种类，统计输入总金额，然后将总金额提供给控制模块，每次售完票后可以通过控制模块来将金额清零。同时加入了FPGA实验板上的蜂鸣器，每输入一货币，蜂鸣器工作。
  + 控制模块：进行各个模块间的控制和连接。同时提供给用户确定购票和取消购票的功能。
  + 找零模块：通过输出金额来将各个面值的货币进行输出，通过数码管和LED灯来进行显示。
  + 出票模块：根据输入的票的类型和票的数量，来将对应的票通过LED灯进行输出和显示。
  + 数码管显示模块：将输入的总金额，票的总价格和找零金额进行显示。
