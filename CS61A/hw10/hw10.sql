CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  select child from (
    select dogs.name as name, dogs.height as height, parents.parent as parent, parents.child as child 
      from dogs, parents 
        where parent = name 
          order by height desc);


-- The size of each dog
CREATE TABLE size_of_dogs AS
  select name, size from (
    select dogs.name as name, dogs.height as height, sizes.size as size, sizes.min as min, sizes.max as max 
      from dogs, sizes 
        where height > min and height <= max);


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  select child1, child2 from (
    select a.child as child1, a.parent as parent1, b.child as child2, b.parent as parent2 
      from parents as a, parents as b
        where parent1 = parent2 and child1 < child2);

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  select "The two siblings, " || name1 || " plus " || name2 || " have the same size: " || size1 from (
    select a.name as name1, a.size as size1, b.name as name2, b.size as size2, c.child1 as child1, c.child2 as child2 
      from size_of_dogs as a, size_of_dogs as b, siblings as c 
        where name1 = child1 and name2 = child2 and size1 = size2 
          order by size1);

