/*
hwcmpnt.h

Hardware component emulation library

allows you to assemble logical circuts with the use of relays, combined to
form logic gates.

Ace E. Rawker
(P) Lokil Eko
2002

Current classes:

relay
andGate
orGate
nandGate
norGate
xorGate
inverter
halfBinAdder
fullBinAdder

Current Functions:

toggleVal(int)
*/

//********************************************************************
//***************** Class Area ***************************************
//********************************************************************

//class relay (build circuts from the ground up)
class relay
  {
	 private:
		int lineIn;
		int lineOut;
	 public:
		//No arguement constructor
		relay() : lineIn(0)
		  {
			 changeOut();
		  }
		//getLineIn
		int getLineIn()
		  {
			 return lineIn;
		  }
		//setLineIn
		void setLineIn(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineIn = i;
				  changeOut();
				}
			 //endif
		  }
		//getLineOut
		int getLineOut()
		  {
			 return lineOut;
		  }
		//changeOut
		void changeOut()
		  {
			 if (lineIn == 1)
				lineOut = 1;
			 else
				lineOut = 0;
			 //endif
		  }
  }; //class relay

//class andGate
class andGate
  {
	 private:
		int lineInOne;
		int lineInTwo;
		int andOut;
	 public:
		//no arguement constructor
		andGate() : lineInOne(0), lineInTwo(0)
		  {
			 changeOut();
		  }
		//setLineInOne
		void setLineInOne(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
					lineInOne = i;
				  changeOut();
				}
			 //endif
		  }
		//setLineInTwo
		void setLineInTwo(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInTwo = i;
				  changeOut();
				}
			 //endif
		  }
		int getLineInOne()
		  {
			 return lineInOne;
		  }
		int getLineInTwo()
		  {
			 return lineInTwo;
		  }
		//getAndOut
		int getAndOut()
		  {
			 return andOut;
		  }
		//changeOut
		void changeOut()
		  {
			 if ((lineInOne == 1) && (lineInTwo == 1))
				andOut = 1;
			 else
				andOut = 0;
			 //end if
		  }
  }; //class andGate

//class orGate
class orGate
  {
	 private:
		int lineInOne;
		int lineInTwo;
		int orOut;
	 public:
		//no arguement constructor
		orGate() : lineInOne(0), lineInTwo(0)
		  {
			 changeOut();
		  }
		//setLineInOne
		void setLineInOne(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInOne = i;
				  changeOut();
				}
			 //endif
		  }
		//setLineInTwo
		void setLineInTwo(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInTwo = i;
				  changeOut();
				}
			 //endif
		  }
		int getLineInOne()
		  {
			 return lineInOne;
		  }
		int getLineInTwo()
		  {
			 return lineInTwo;
		  }
		//getOrOut
		int getOrOut()
		  {
			 return orOut;
		  }
		//changeOut
		void changeOut()
		  {
			 if ((lineInOne == 1) || (lineInTwo == 1))
				orOut = 1;
			 else
				orOut = 0;
			 //endif
		  }
  };  //class orGate

//class inverter
class inverter
  {
	 private:
		int lineIn;
		int lineOut;
	 public:
		//No arguement constructor (set up inverter input)
		inverter() : lineIn(0)
		  {
			 changeOut();
		  }
		//setLineIn
		void setLineIn(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineIn = i;
				  changeOut();
				}
		  }
		//getLineIn
		int getLineIn()
		  {
			 return lineIn;
		  }
		//getLineOut
		int getLineOut()
		  {
			 return lineOut;
		  }
		//changeOut
		void changeOut()
		  {
			 if (lineIn == 1)
				lineOut = 0;
			 else
				lineOut = 1;
		  }
  }; //class inverter

//class norGate
class norGate
  {
	 private:
		orGate norOrGate;
		inverter norInverter;
		int lineInOne;
		int lineInTwo;
		int norOut;
	 public:
		//No arguement constructor
		norGate() : lineInOne(0), lineInTwo(0)
		  {
			 changeOut();
		  }
		//setLineInOne
		void setLineInOne(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInOne = i;
				  changeOut();
				}
		  }
		//getLineInOne
		int getLineInOne()
		  {
			 return lineInOne;
		  }
		//setLineInTwo
		void setLineInTwo(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInTwo = i;
				  changeOut();
				}
		  }
		//getLineInTwo
		int getLineInTwo()
		  {
			 return lineInTwo;
		  }
		//getNorOut
		int getNorOut()
		  {
			 return norOut;
		  }
		//changeOut
		void changeOut()
		  {
			 norOrGate.setLineInOne(lineInOne);
			 norOrGate.setLineInTwo(lineInTwo);
			 norInverter.setLineIn(norOrGate.getOrOut());
			 norOut = norInverter.getLineOut();
		  }
  }; //class norGate

//class nandGate
class nandGate
  {
	 private:
		andGate nandAndGate;
		inverter nandInverter;
		int lineInOne;
		int lineInTwo;
		int nandOut;
	 public:
		//no arguement constructor
		nandGate() : lineInOne(0), lineInTwo(0)
		  {
			 changeOut();
		  }
		//setLineInOne
		void setLineInOne(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInOne = i;
				  changeOut();
				}
		  }
		//getLineInOne
		int getLineInOne()
		  {
			 return lineInOne;
		  }
		//setLineInTwo
		void setLineInTwo(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInTwo = i;
				  changeOut();
				}
		  }
		int getLineInTwo()
		  {
			 return lineInTwo;
		  }
		//getNandOut
		int getNandOut()
		  {
			 return nandOut;
		  }
		//changeOut
		void changeOut()
		  {
			 nandAndGate.setLineInOne(lineInOne);
			 nandAndGate.setLineInTwo(lineInTwo);
			 nandInverter.setLineIn(nandAndGate.getAndOut());
			 nandOut = nandInverter.getLineOut();
		  }
  }; //class nandGate

//class xorGate
class xorGate
  {
	 private:
		orGate xorOrGate;
		nandGate xorNandGate;
		andGate xorAndGate;
		int lineInOne;
		int lineInTwo;
		int xorOut;
	 public:
		//no arguement constructor
		xorGate() : lineInOne(0), lineInTwo(0)
		  {
			 changeOut();
		  }
		//setLineInOne
		void setLineInOne(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInOne = i;
				  changeOut();
				}
		  }
		//getLineInOne
		int getLineInOne()
		  {
			 return lineInOne;
		  }
		//setLineInTwo
		void setLineInTwo(int i)
		  {
			 if ((i == 1) || (i == 0))
				{
				  lineInTwo = i;
				  changeOut();
				}
		  }
		//getLineInTwo
		int getLineInTwo()
		  {
			 return lineInTwo;
		  }
		//getXorOut
		int getXorOut()
		  {
			 return xorOut;
		  }
		//changeOut
		void changeOut()
		  {
			 xorOrGate.setLineInOne(lineInOne);
			 xorOrGate.setLineInTwo(lineInTwo);
			 xorNandGate.setLineInOne(lineInOne);
			 xorNandGate.setLineInTwo(lineInTwo);
			 xorAndGate.setLineInOne(xorOrGate.getOrOut());
			 xorAndGate.setLineInTwo(xorNandGate.getNandOut());
			 xorOut = xorAndGate.getAndOut();
		  }
  }; //class xor

//halfBinAdder (Half binary adding unit with two lines in and sum and carry out)
class halfBinAdder
  {
	 private:
		andGate halfAndGate;
		xorGate halfXorGate;
		int lineInOne;
		int lineInTwo;
		int sumOut;
		int carryOut;
	 public:
		halfBinAdder() : lineInOne(0),  lineInTwo(0)
		  {
			 changeOut();
		  }
		void setLineInOne(int i)
		  {
			 if ((i == 0) || (i == 1))
				{
				  lineInOne = i;
				  changeOut();
				}
		  }
		void setLineInTwo(int i)
		  {
			 if ((i == 0) || (i == 1))
				{
				  lineInTwo = i;
				  changeOut();
				}
		  }
		int getLineInOne()
		  {
			 return lineInOne;
		  }
		int getLineInTwo()
		  {
			 return lineInTwo;
		  }
		int getSumOut()
		  {
			 return sumOut;
		  }
		int getCarryOut()
		  {
			 return carryOut;
		  }
		void changeOut()
		  {
			 halfAndGate.setLineInOne(lineInOne);
			 halfAndGate.setLineInTwo(lineInTwo);
			 halfXorGate.setLineInOne(lineInOne);
			 halfXorGate.setLineInTwo(lineInTwo);
			 sumOut = halfXorGate.getXorOut();
			 carryOut = halfAndGate.getAndOut();
		  }
  };

//fullBinAdder (Full binary adder with carry in and out)
class fullBinAdder
  {
	 private:
		halfBinAdder addOne,
						 addTwo;
		orGate fullOrGate;
		int lineInOne;
		int lineInTwo;
		int carryIn;
		int carryOut;
		int sumOut;
	 public:
		fullBinAdder() : lineInOne(0), lineInTwo(0), carryIn(0)
		  {
			 changeOut();
		  }
		void setLineInOne(int i)
		  {
			 if ((i == 0) || (i == 1))
				{
				  lineInOne = i;
				  changeOut();
				}
		  }
		void setLineInTwo(int i)
		  {
			 if ((i == 0) || (i == 1))
				{
				  lineInTwo = i;
				  changeOut();
				}
		  }
		void setCarryIn(int i)
		  {
			 if (( i == 0) || (i == 1))
				{
				  carryIn = i;
				  changeOut();
				}
		  }
		int getLineInOne()
		  {
			 return lineInOne;
		  }
		int getLineInTwo()
		  {
			 return lineInTwo;
		  }
		int getCarryIn()
		  {
			 return carryIn;
		  }
		int getSumOut()
		  {
			 return sumOut;
		  }
		int getCarryOut()
		  {
			 return carryOut;
		  }
		void changeOut()
		  {
			 addOne.setLineInOne(lineInOne);
			 addOne.setLineInTwo(lineInTwo);
			 addTwo.setLineInOne(carryIn);
			 addTwo.setLineInTwo(addOne.getSumOut());
			 sumOut = addTwo.getSumOut();
			 fullOrGate.setLineInOne(addOne.getCarryOut());
			 fullOrGate.setLineInTwo(addTwo.getCarryOut());
			 carryOut = fullOrGate.getOrOut();
		  }
  };

//********************************************************************
//***************** Function Area ************************************
//********************************************************************

//void toggleVal (designed for ease of toggling input value)
void toggleVal(int &i)
  {
	 if (i == 0)
		i = 1;
	 else
		i = 0;
	 //endif
  }

