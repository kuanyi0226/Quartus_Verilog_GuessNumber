# Quartus_Verilog_GuessNumber
The final demo project for NCKU Course 111-1_Experiment on digital system

# Game rule and how it works
1. 按下startButton開始遊戲，產生隨機答案(4個0~9的數字)
2. 搬動SW 選取欲猜的數字，按下checkButton輸入(若非0~9則一，則輸入不成功，dotMatrix顯示NO；輸入成功則顯示OK)，數字會顯示到七段顯示器
3. 依次輸入4個數字，再次按下checkButton確認答案?A?B。若為4A，dotMatrix顯示O，否則顯示X。
4. 按下resetBuuton可以重新猜測(正確答案不變)；按下startButton再來一局，重新產生隨機答案。

![image](https://github.com/kuanyi0226/Quartus_Verilog_GuessNumber/blob/main/323384300_1476772199513456_7130878458256090085_n.jpg)

# Something We Learned
1. 使用引入其他module時，若少傳入input，Compile會過，且其值為1
2. Variables with less bits can be assgined a number with more bits,(Overflow) Compile也會過
