Advanced Database Concepts COMP 214

Assignment # 2 Page 1 of 2

# Assignment # 2 – Handling Data in PL/SQL Blocks

**Instructions** :

1. This assignment should be completed individually by all the students.
2. Take screenshot of your and paste it in the word document. **whole screen** including the connection window for each Query
3. Submit **both** your .sql file and the Word document under Assessments - > Assignment –>
    Assignment 2 folder.
4. Late submissions will be subject to guidelines outlined in eCentennial and your course
    outline.
5. The submission must be named according to the following rule: **studentID_yourlastname_Assignment#number.docx**. e.g.,
    300123456 _ **smith_Assignment# 2** .docx
**6. Your recently loaded Brewbean’s tables should be used to complete this assignment.**
^

**Question 1 (5 marks)**
Brewbean’s wants to include a feature in its application that calculates the total amount
(quantity) of a specified item that can be purchased with a given amount of money. Create a
block with a WHILE loop to increment the item’s cost until the dollar value is met. Test first
with a total spending amount of $100 and product ID 4. Then test with an amount and a product
of your choice. Use initialized variables to provide the total spending amount and product ID.

**Question 2 (5 marks)**
The Brewbean’s application contains a page displaying order summary information, including
IDBASKET, SUBTOTAL, SHIPPING, TAX, and TOTAL columns from the BB_BASKET
table. Create a PL/SQL block with scalar variables to retrieve this data and then display it
onscreen. An initialized variable should provide the IDBASKET value. Test the block using the
basket ID 12.

**Question 3 (5 marks)**


Advanced Database Concepts COMP 214

Assignment # 2 Page 2 of 2

Brewbean’s calculates shipping cost based on the quantity of items in an order. Assume the
quantity column in the BB_BASKET table contains the total number of items in a basket. A
block is needed to check the quantity provided by an initialized variable and determine the
shipping cost. Display the calculated shipping cost onscreen ( **capture output in screenshot** ).
Test using the basket IDs 5 and 12, and apply the shipping rates listed in table below.
_Table: Shipping Charges_

**Question 4 (5 marks)**
The Brewbean’s application contains a page displaying order summary information, including
IDBASKET, SUBTOTAL, SHIPPING, TAX, and TOTAL columns from the BB_BASKET
table. Create a PL/SQL block with a record variable to retrieve this data and display it onscreen
( **capture output in screenshot** ). An initialized variable should provide the IDBASKET value.
Test the block using
the basket ID 12.


