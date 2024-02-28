.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price
  FROM products
  GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price)
  FROM inventory
  GROUP BY item;
  
CREATE TABLE targetitem AS
  SELECT name, MIN(MSRP/rating) AS best
  FROM products
  GROUP BY category;

CREATE TABLE shopping_list AS
  SELECT targetitem.name,lowest_prices.store as place
  FROM targetitem, lowest_prices
  WHERE lowest_prices.item=targetitem.name;

CREATE TABLE destination AS
  SELECT sh.place, st.Mbs AS Mbs
  FROM shopping_list as sh, stores as st
  WHERE sh.place=st.store;

CREATE TABLE total_bandwidth AS
  SELECT SUM(Mbs) FROM destination;

