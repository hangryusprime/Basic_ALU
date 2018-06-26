module alu_a5(a,b,sel,agrtb,altb,aeqb,result);

input signed[11:0] a;

input signed[11:0] b;

input [3:0] sel;

output agrtb,altb,aeqb;

output [11:0] result;

reg [11:0] result;

reg agrtb; reg altb; reg aeqb;



always @ (a or b or sel ) begin

	case (sel)

		4'b0000 : result = -a ;

		4'b0001 : result = !a; // not a

		4'b0010 : result = -(a+b);

		4'b0011 : result = a;

		4'b0100 : result = (a+b);

		4'b0101 : result = (a-b);

		4'b0110 : result = a | b; // a OR b

		4'b0111 : result = a&b; // a AND b

		4'b1000 : result = a^b; // a xor b

		4'b1001 : result =(2*a)+(4*b)+1;

		4'b1010 : result = 12'b111111111111; // in hex= 48

		4'b1011 : result = !(a&b);

		4'b1100 : begin result[11:1] <= a[10:0]; result [0] <= 0; end // LEFT ARITHMETIC SHIFT

		4'b1101 : begin result[10:0] <= a[11:1]; result [11] <= 0; end // RIGHT ARITHMETIC SHIFT

		4'b1110 : begin result[11:1] <= a[10:0]; result [0] <= a[11]; end // LEFT CIRCULAR SHIFT

		4'b1111 : begin result[10:0] <= a[11:1]; result [11] <= a[0]; end // RIGHT CIRCULAR SHIFT

		default : result= 0;

	endcase

	

	if (a > b)

		agrtb= 1;

	else   agrtb=0;

	if(a < b)

		 altb = 1;

	else  altb = 0;

	if (a == b)

		  aeqb= 1;

	else  aeqb = 0;

end

endmodule 

	