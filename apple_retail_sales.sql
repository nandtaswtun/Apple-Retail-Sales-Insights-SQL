/*
Create a report
that shows the sales volume of existing products in a category
(e.g., iPhones) 1 year after a new product launch
*/

select 
    Product_Name, 
    (Price * Order_Quantity) AS Total_Sales,
    date_sub(Launch_Date, interval 1 day) as Release_Date,
    date_add(Launch_Date, interval 1 year) as One_Year_After,
	Release_Date,
    One_Year_After
from (
    select 
        p.Product_Name,
        p.Price,
        month(p.Launch_Date) as Order_Month, 
        min(p.Launch_Date) as Launch_Date, 
        sum(s.quantity) as Order_Quantity, 
        lead(sum(s.quantity)) over (order by month(p.Launch_Date)) as Release_Date,
        lag(sum(s.quantity)) over (order by month(p.Launch_Date)) as One_Year_After
    from products p
    join sales s on p.product_id = s.product_id 
    group by p.Product_Name, p.Price, month(p.Launch_Date)
) as Yearly_Sales
order by Product_Name asc;

/*
Summary all the total sales each store
*/

select * from (
	select
    st.Store_Name,
	sum(s.quantity) as Total_Quantity,
	sum(p.Price * s.quantity) AS Total_Sales
	from stores st
	join sales s ON st.Store_ID = s.store_id
    JOIN products p ON s.Product_ID = p.Product_ID
	group by st.Store_Name
) AS Sales;

/*
Summary all the total sales each country
*/

select * from (
	select
    st.Country,
	sum(s.quantity) as Total_Quantity,
	sum(p.Price * s.quantity) AS Total_Sales
	from stores st
	join sales s ON st.Store_ID = s.store_id
    join products p ON s.Product_ID = p.Product_ID
	group by st.Country
) AS Sales;

/*
warranty summaries
*/

select * from (
	select
		c.category_name,
		w.repair_status,
        count(w.repair_status) as total_reparation
	from warranty w
	join sales s on s.sale_id = w.sale_id
    join products p on s.product_id = p.product_id
    join category c on p.Category_ID = c.category_id
	group by
		c.category_name,
		w.repair_status
) as claim_status
where total_reparation > 0
order by repair_status asc;