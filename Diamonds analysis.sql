select * from diamond_prices;

/*1 How many total diamonds are on the list?*/
select count(carat) as total_diamonds
 from diamond_prices;
 
/*2 Rank the diamonds based on its carat.*/
select carat, rank() over(order by carat desc) as rnk
 from diamond_prices
 group by carat;
 
/*3 Determine the carat with highest no. of diamonds.*/
select carat, count(carat) as no_per_carat, rank() over(order by carat desc) as rnk
 from diamond_prices
 group by carat
 order by no_per_carat desc
 limit 10;
 
/*4 Determine the carat with lowest no. of diamonds.*/
select carat, count(carat) as no_per_carat, rank() over(order by carat desc) as rnk
 from diamond_prices
 group by carat
 order by no_per_carat asc
 limit 10;
 
/*5 Determine the no. of diamonds per cut.*/
select cut, count(cut) as no_per_cut
 from diamond_prices
 group by cut
 order by no_per_cut desc;
 
/*6 Determine the no. of diamonds per color.*/
select color, count(color) as no_per_color
 from diamond_prices
 group by color
 order by no_per_color desc;
 
 /*7 Determine the no. of diamonds per clarity.*/
select clarity, count(clarity) as no_per_clarity
 from diamond_prices
 group by clarity
 order by no_per_clarity desc;
 
  /*8 Determine the no. of diamonds per depth.*/
select depth, count(depth) as no_per_depth
 from diamond_prices
 group by depth
 order by no_per_depth desc;
 
   /*9 Determine the no. of diamonds per table.*/
select table_dia, count(table_dia) as no_per_table
 from diamond_prices
 group by table_dia
 order by no_per_table desc;
 
    /*10 What is the 3 most expensive diamonds.*/
select *, rank() over(order by price desc) as rnk
 from diamond_prices
 order by rnk
 limit 3;
 
     /*11 What is the 3 least expensive diamonds.*/
select *, row_number() over(order by price) as rnk
 from diamond_prices
 order by rnk
 limit 3;
 
     /*12 What is the price of most expensive diamond per carat.*/
select *, rank() over(order by carat desc) as rnk_carat
from (select carat, price as highest_price, row_number() over(partition by carat order by price desc) as rnk_price
 from diamond_prices
 order by rnk_price)x
where  rnk_price = 1
order by highest_price;
 


    