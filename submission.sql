-- the post from april 2048 mentioned emptystack and "my dad works there"
-- so i searched for posts in that month that mention emptystack
SELECT id, author, date, title, content
FROM forum_posts
WHERE date >= '2048-04-01' AND date < '2048-05-01'
  AND (content ILIKE '%emptystack%' OR title ILIKE '%emptystack%');
-- smart-money-44 wrote it

-- now get their name from forum_accounts
SELECT username, first_name, last_name
FROM forum_accounts
WHERE username = 'smart-money-44';
-- Brad Steele. his dad would have the same last name so i looked for other Steeles

SELECT username, first_name, last_name
FROM forum_accounts
WHERE last_name = 'Steele';
-- sharp-engine-57 (Andrew), stinky-tofu-98 (Kevin), smart-money-44 (Brad)

-- checked which of them also has an emptystack account (i.e. works there)
SELECT username, password, first_name, last_name
FROM emptystack_accounts
WHERE last_name = 'Steele';
-- triple-cart-38 (Andrew) and lance-main-11 (Lance)
-- Andrew is in both tables so he's the dad -> node mainframe: triple-cart-38 / password456
-- that gave me emptystack.sql, ran it in psql

-- looked for the self-driving taxi project in the internal messages
SELECT id, "from", "to", subject, body
FROM emptystack_messages
WHERE subject ILIKE '%taxi%' OR body ILIKE '%taxi%';
-- your-boss-99 sent the "Project TAXI" message

SELECT username, password
FROM emptystack_accounts
WHERE username = 'your-boss-99';
-- your-boss-99 / notagaincarter

SELECT id, code
FROM emptystack_projects
WHERE code = 'TAXI';
-- DczE0v2b

-- node mainframe -stop -> your-boss-99 / notagaincarter / DczE0v2b
-- "Project shutdown complete."
