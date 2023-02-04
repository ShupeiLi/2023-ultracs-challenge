.read data.sql


CREATE TABLE bluedog AS
  select color, pet
    from students
      where color = 'blue' and pet = 'dog';

CREATE TABLE bluedog_songs AS
  select color, pet, song
    from students
      where color = 'blue' and pet = 'dog';


CREATE TABLE smallest_int_having AS
  select time, smallest
    from students
      group by smallest
        having count(smallest) = 1;


CREATE TABLE matchmaker AS
  select pet1 as pet, song1 as song, color1, color2 from (
    select a.pet as pet1, a.song as song1, a.color as color1, a.time as time1, b.pet as pet2, b.song as song2, b.color as color2, b.time as time2
      from students as a, students as b
        where pet1 = pet2 and song1 = song2 and time1 < time2);


CREATE TABLE sevens AS
  select students.seven 
    from numbers, students
      where numbers.time = students.time and numbers."7" = "True" and students.number = 7;


CREATE TABLE average_prices AS
  select category, avg(MSRP) as average_price 
    from products 
      group by category;


CREATE TABLE lowest_prices AS
  select store, item, min(price) as min_price
    from inventory
      group by item;


CREATE TABLE shopping_list AS
  select a.name as name, b.store as store 
    from (
        select name, min(MSRP / rating) 
          from products 
            group by category) as a, 
      lowest_prices as b 
      where a.name = b.item;


CREATE TABLE total_bandwidth AS
  select sum(Mbs) 
    from stores natural join shopping_list;
