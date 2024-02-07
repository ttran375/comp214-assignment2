-- # Question 1 (5 marks)
-- Brewbean’s wants to include a feature in its application that calculates the total amount
-- (quantity) of a specified item that can be purchased with a given amount of money. Create a
-- block with a WHILE loop to increment the item’s cost until the dollar value is met. Test first
-- with a total spending amount of $100 and product ID 4. Then test with an amount and a product
-- of your choice. Use initialized variables to provide the total spending amount and product ID.
DECLARE
    v_total_spending_amount NUMBER := 100; -- Total spending amount
    v_product_id NUMBER := 4; -- Product ID
    v_item_cost BB_Product.price%TYPE;
    v_quantity INTEGER := 0;
BEGIN
    -- Get the cost of the specified item
    SELECT price INTO v_item_cost
    FROM BB_PRODUCT
    WHERE idProduct = v_product_id;

    -- Initialize total cost
    DECLARE
        v_total_cost NUMBER := 0;
    BEGIN
        -- Calculate the total cost incrementally until it exceeds the spending amount
        WHILE v_total_cost + v_item_cost <= v_total_spending_amount LOOP
            v_quantity := v_quantity + 1;
            v_total_cost := v_quantity * v_item_cost;
        END LOOP;
    END;

    -- Output the result
    DBMS_OUTPUT.PUT_LINE('With $'||v_total_spending_amount||
                         ', you can purchase '||v_quantity||
                         ' units of Product ID '||v_product_id);
END;

-- # Question 2 (5 marks)
-- The Brewbean’s application contains a page displaying order summary information, including
-- IDBASKET, SUBTOTAL, SHIPPING, TAX, and TOTAL columns from the BB_BASKET
-- table. Create a PL/SQL block with scalar variables to retrieve this data and then display it
-- onscreen. An initialized variable should provide the IDBASKET value. Test the block using the
-- basket ID 12.
DECLARE
    v_idbasket NUMBER := 12; -- Initialized variable providing the IDBASKET value
    v_subtotal NUMBER;
    v_shipping NUMBER;
    v_tax      NUMBER;
    v_total    NUMBER;
BEGIN
 -- Retrieve order summary information
    SELECT
        SUBTOTAL,
        SHIPPING,
        TAX,
        TOTAL INTO v_subtotal,
        v_shipping,
        v_tax,
        v_total
    FROM
        BB_BASKET
    WHERE
        IDBASKET = v_idbasket;
 -- Display order summary information
    DBMS_OUTPUT.PUT_LINE('Order Summary for Basket ID: '
                         || v_idbasket);
    DBMS_OUTPUT.PUT_LINE('Subtotal: $'
                         || v_subtotal);
    DBMS_OUTPUT.PUT_LINE('Shipping: $'
                         || v_shipping);
    DBMS_OUTPUT.PUT_LINE('Tax: $'
                         || v_tax);
    DBMS_OUTPUT.PUT_LINE('Total: $'
                         || v_total);
END;

-- # Question 3 (5 marks)
-- Brewbean’s calculates shipping cost based on the quantity of items in an order. Assume the
-- quantity column in the BB_BASKET table contains the total number of items in a basket. A
-- block is needed to check the quantity provided by an initialized variable and determine the
-- shipping cost. Display the calculated shipping cost onscreen ( # capture output in screenshot#
-- Test using the basket IDs 5 and 12, and apply the shipping rates listed in table below.
-- _Table: Shipping Charges_
DECLARE
    v_idbasket      NUMBER := 5; -- Initialized variable providing the IDBASKET value
    v_quantity      NUMBER;
    v_shipping_cost NUMBER;
BEGIN
 -- Retrieve the quantity of items from the basket
    SELECT
        QUANTITY INTO v_quantity
    FROM
        BB_BASKET
    WHERE
        IDBASKET = v_idbasket;
 -- Calculate shipping cost based on the quantity
    CASE
        WHEN v_quantity <= 5 THEN
            v_shipping_cost := 5; -- $5 flat rate for up to 5 items
        WHEN v_quantity <= 10 THEN
            v_shipping_cost := 8; -- $8 flat rate for 6-10 items
        ELSE
            v_shipping_cost := 10; -- $10 flat rate for more than 10 items
    END CASE;
 -- Display the calculated shipping cost
    DBMS_OUTPUT.PUT_LINE('Shipping cost for Basket ID '
                         || v_idbasket
                         || ': $'
                         || v_shipping_cost);
END;

-- # Question 4 (5 marks)
-- The Brewbean’s application contains a page displaying order summary information, including
-- IDBASKET, SUBTOTAL, SHIPPING, TAX, and TOTAL columns from the BB_BASKET
-- table. Create a PL/SQL block with a record variable to retrieve this data and display it onscreen
-- ( # capture output in screenshot#  ). An initialized variable should provide the IDBASKET valu
-- Test the block using
-- the basket ID 12.
DECLARE
    TYPE order_summary_type IS RECORD (
        idbasket BB_BASKET.IDBASKET%TYPE,
        subtotal BB_BASKET.SUBTOTAL%TYPE,
        shipping BB_BASKET.SHIPPING%TYPE,
        tax BB_BASKET.TAX%TYPE,
        total BB_BASKET.TOTAL%TYPE
    );
    v_order_summary order_summary_type;
    v_idbasket      NUMBER := 12; -- Initialized variable providing the IDBASKET value
BEGIN
 -- Retrieve order summary information for the specified basket ID
    SELECT
        IDBASKET,
        SUBTOTAL,
        SHIPPING,
        TAX,
        TOTAL INTO v_order_summary
    FROM
        BB_BASKET
    WHERE
        IDBASKET = v_idbasket;
 -- Display the order summary information
    DBMS_OUTPUT.PUT_LINE('Order Summary for Basket ID: '
                         || v_order_summary.idbasket);
    DBMS_OUTPUT.PUT_LINE('Subtotal: $'
                         || v_order_summary.subtotal);
    DBMS_OUTPUT.PUT_LINE('Shipping: $'
                         || v_order_summary.shipping);
    DBMS_OUTPUT.PUT_LINE('Tax: $'
                         || v_order_summary.tax);
    DBMS_OUTPUT.PUT_LINE('Total: $'
                         || v_order_summary.total);
END;
