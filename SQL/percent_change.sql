CREATE OR REPLACE FUNCTION
percent_change(new_value numeric,
               old_value numeric,
               decimal_places integer DEFAULT 1)
RETURNS numeric AS
'SELECT round(
       ((new_value - old_value) / old_value) * 100, decimal_places
);'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

/*
SELECT percent_change(110, 108, 2); -- 1.85
SELECT percent_change(100, 98, 5);  -- 2.04082
SELECT percent_change(100, 50);     -- 100.0
SELECT percent_change(NULL, 50);    -- [null]

SELECT percent_change(num_2020, num_2010) AS "Percent change" FROM table_of_foo;
*/
