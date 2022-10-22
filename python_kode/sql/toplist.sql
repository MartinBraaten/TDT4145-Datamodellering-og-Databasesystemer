SELECT user.name as Name, COUNT(DISTINCT tasting.coffeeId) as Tastings
FROM user
JOIN tasting ON user.email = tasting.email
WHERE tasting.date >= DATE("now", "start of year")
GROUP BY user.name
ORDER BY Tastings DESC;