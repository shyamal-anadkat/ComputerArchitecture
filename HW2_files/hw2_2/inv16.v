// 16 bit inverter, active high enable(En)
module inv16(In, Out, En);
	
	input [15:0] In;
	input En; 
	output [15:0] Out;

	wire[15:0] temp; 

	not1 n1(In[0],temp[0]);
	not1 n2(In[1],temp[1]);
	not1 n3(In[2],temp[2]);
	not1 n4(In[3],temp[3]);
	not1 n5(In[4],temp[4]);
	not1 n6(In[5],temp[5]);
	not1 n7(In[6],temp[6]);
	not1 n8(In[7],temp[7]);
	not1 n9(In[8],temp[8]);
	not1 n10(In[9],temp[9]);
	not1 n11(In[10],temp[10]);
	not1 n12(In[11],temp[11]);
	not1 n13(In[12],temp[12]);
	not1 n14(In[13],temp[13]);
	not1 n15(In[14],temp[14]);
	not1 n16(In[15],temp[15]);

    mux2_1 mux1[15:0] (.InA(In),.InB(temp),.S(En),.Out(Out));

endmodule