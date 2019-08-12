# SQL applied on the DVD-rental database
This is a workshop for SQL, where I will cover basic statements, clauses and functions for making queries. <br>
I will use the PostgreSQL relational database management system (RDBMS), looking at the DVD rental database. <br> This database represents the business processes of a DVD rental store, where we can make queries about films, categories, rental duration, which films you can find in which store, customer information and so on. 


##### The DVD rental database has 15 tables

| Table         | Description                                                                   |
| :---:         |    ------                                                                     |
| category      | contains category data for the films                                          |
| film_category | containing the relationships between films and categories                     |
| film          | data about the films, such as title, release year, description, rating, etc.  |
| language      | stores language data                                                          |
| film_actor    | contains the relationship between films and actors                            |
| inventory     | stores inventory data                                                         |
| rental        | information about rental date, which customer, return date, etc.              |
| payment       | data on customer's payment, like amount, which customer, date, etc.           |
| staff         | stores data about the employees at the DVD rental store                       |
| actor         | contains actor data including first and last name                             |
| customer      | stores customer's data                                                        |
| address       | contains address data for staff and customer's                                |
| city          | stores city names                                                             |
| country       | stores the country names                                                      |
| store         | contains the store data for the rental stores, like manager staff and address |
