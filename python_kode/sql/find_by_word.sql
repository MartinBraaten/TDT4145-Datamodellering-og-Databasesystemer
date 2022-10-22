SELECT
  refinery.name as Refinery,
  coffee.name as Coffee
FROM coffee
JOIN refinery ON coffee.refineryId = refinery.refineryId
WHERE INSTR(coffee.description, :word)
UNION
SELECT
  refinery.name as Refinery,
  coffee.name as Coffee
FROM tasting
JOIN coffee ON tasting.coffeeId = coffee.coffeeId
JOIN refinery ON coffee.refineryId = refinery.refineryId
WHERE INSTR(tasting.notes, :word);