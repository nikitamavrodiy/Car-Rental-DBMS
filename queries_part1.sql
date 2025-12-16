SELECT * FROM Customers;

SELECT 
    Rentals.rental_id,
    Customers.first_name || ' ' || Customers.last_name AS customer_name,
    Cars.brand || ' ' || Cars.model AS car,
    Rentals.rental_date,
    Rentals.return_date,
    Rentals.total_amount
FROM Rentals
INNER JOIN Customers ON Rentals.customer_id = Customers.customer_id
INNER JOIN Cars ON Rentals.car_id = Cars.car_id;

SELECT 
    Cars.car_id,
    Cars.brand,
    Cars.model,
    Cars.status,
    Rentals.rental_id,
    Rentals.rental_date,
    Rentals.return_date
FROM Cars
LEFT JOIN Rentals ON Cars.car_id = Rentals.car_id;

SELECT 
    car_id,
    brand,
    model,
    year,
    mileage,
    status
FROM Cars
WHERE Cars.status = 'Available';

SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    created_at
FROM Customers
ORDER BY Customers.created_at DESC;

SELECT 
    Branches.branch_name,
    COUNT(Cars.car_id) AS number_of_cars
FROM Branches
LEFT JOIN Cars ON Branches.branch_id = Cars.branch_id
GROUP BY Branches.branch_id, Branches.branch_name;

SELECT 
    Branches.branch_name,
    SUM(Rentals.total_amount) AS total_revenue,
    COUNT(Rentals.rental_id) AS number_of_rentals
FROM Branches
LEFT JOIN Cars ON Branches.branch_id = Cars.branch_id
LEFT JOIN Rentals ON Cars.car_id = Rentals.car_id
GROUP BY Branches.branch_id, Branches.branch_name;
