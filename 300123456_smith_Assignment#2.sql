-- # Question 1 (5 marks)
-- Brewbean’s wants to include a feature in its application that calculates the total amount
-- (quantity) of a specified item that can be purchased with a given amount of money. Create a
-- block with a WHILE loop to increment the item’s cost until the dollar value is met. Test first
-- with a total spending amount of $100 and product ID 4. Then test with an amount and a product
-- of your choice. Use initialized variables to provide the total spending amount and product ID.
DECLARE
    v_total_spending_amount NUMBER := 100; -- Total spending amount
    v_product_id NUMBER := 4; -- Product ID
    v_item_cost NUMBER;
    v_quantity_can_purchase NUMBER := 0;
BEGIN
    -- Retrieve item cost
    SELECT item_cost INTO v_item_cost
    FROM products
    WHERE product_id = v_product_id;

    -- Calculate quantity that can be purchased
    WHILE v_total_spending_amount >= v_item_cost LOOP
        v_quantity_can_purchase := v_quantity_can_purchase + 1;
        v_total_spending_amount := v_total_spending_amount - v_item_cost;
    END LOOP;

    -- Display results
    DBMS_OUTPUT.PUT_LINE('With $' || v_total_spending_amount || ', you can purchase ' || v_quantity_can_purchase || ' units of product ' || v_product_id);
END;
/

-- # Question 2 (5 marks)
-- The Brewbean’s application contains a page displaying order summary information, including
-- IDBASKET, SUBTOTAL, SHIPPING, TAX, and TOTAL columns from the BB_BASKET
-- table. Create a PL/SQL block with scalar variables to retrieve this data and then display it
-- onscreen. An initialized variable should provide the IDBASKET value. Test the block using the
-- basket ID 12.
-- 
-- # Question 3 (5 marks)
-- 
-- Brewbean’s calculates shipping cost based on the quantity of items in an order. Assume the
-- quantity column in the BB_BASKET table contains the total number of items in a basket. A
-- block is needed to check the quantity provided by an initialized variable and determine the
-- shipping cost. Display the calculated shipping cost onscreen ( # capture output in screenshot#  
-- Test using the basket IDs 5 and 12, and apply the shipping rates listed in table below.
-- _Table: Shipping Charges_
-- 
-- # Question 4 (5 marks)
-- The Brewbean’s application contains a page displaying order summary information, including
-- IDBASKET, SUBTOTAL, SHIPPING, TAX, and TOTAL columns from the BB_BASKET
-- table. Create a PL/SQL block with a record variable to retrieve this data and display it onscreen
-- ( # capture output in screenshot#  ). An initialized variable should provide the IDBASKET valu
-- Test the block using
-- the basket ID 12.
