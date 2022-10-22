SELECT
  refinery.name as Refinery,
  coffee.name as Coffee,
  coffee.price as Price,
  AVG(tasting.points) as "Average Points"
FROM tasting
JOIN coffee ON tasting.coffeeId = coffee.coffeeId
JOIN refinery ON coffee.refineryId = refinery.refineryId
GROUP BY Coffee
ORDER BY "Average Points" / Price DESC;

