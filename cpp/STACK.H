/*
stack.h

by Andy Carlson

Enables the use of a stack from a included header
*/
class stack
  {
	 private:
		  int st[20];			//Number array (stack)
		  int top;				//Top of stack
	 public:
		  stack() : top(-1) 		//Null Constructor
			 {
				int i;		//index in for loop

				//Initialize stack
				for (i = 0; i < 21; i++)
				  st[i]  = 0;
				//end for
			 }
		  void push(int var)		//Push method
			 {
				st[++top] = var;
			 } //end push
		  int pop()					//Pop method
			 {
				int temp;		//temporary number holder
				temp = st[top];
				st[top--] = 0;
				return temp;
			 } //end pop
  }; //end class stack
