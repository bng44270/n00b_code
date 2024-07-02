/*
Link List

by Andy Carlson
*/
#include <iostream.h>
#include <ctype.h>
//Link Structure
struct link
  {
    int data;
    link* next;
    link* prev;
  };
//-----------------------------------------------------------------------------
//Class linkList
//-----------------------------------------------------------------------------
class linkList
  {
    private:
            link* first;        //First Link
    public:
            linkList()
              {
                first = NULL;
              } //end constructor
            void addItem(int);    //Method to add item
            void displayData();     //Method to display item
  }; //class linkList
//-----------------------------------------------------------------------------
//Method addItem
void linkList::addItem(int d)
  {
    link* tempLink = new link;
    tempLink -> data = d;
    tempLink -> next = first;
    first = tempLink;
  } //addItem
//-----------------------------------------------------------------------------
//Method displayData
void linkList::displayData()
  {
    link* current = first;
    while(current != NULL)
      {
        cout << current -> data << endl;
        current = current -> next;
      } //while
  } //displayData
//-----------------------------------------------------------------------------
//Main Logic
//-----------------------------------------------------------------------------
linkList linkListData;          //Usable Link List
char moreData;                  //Option to enter more data
int tempData;                   //Temporary Data Holder

void main()
  {
    do
      {
        cout << "Enter data to put into link list. ";
        cin >> tempData;
        linkListData.addItem(tempData);
        cout << "More Data to Enter? ";
        cin >> moreData;
      }
    while (toupper(moreData) == 'Y');
    linkListData.displayData();
    cout << "Thanx for using this program.";
  }
