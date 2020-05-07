CREATE VIEW richest_client_balance_VIEW AS
SELECT c.first_name,c.last_name,
convert_currencies(a.currency_id,1, a.balance, date(now()) - 1)
 AS total_balance FROM account a
 JOIN client c ON a.user_id = c.id
 GROUP BY c.first_name, c.last_name, total_balance
  ORDER BY total_balance DESC
 LIMIT 1;