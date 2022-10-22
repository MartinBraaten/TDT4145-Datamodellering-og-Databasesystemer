SELECT
  refinery.name as Refinery,
  coffee.name as Coffee
FROM coffee
JOIN refinery ON coffee.refineryId = refinery.refineryId
JOIN batch ON coffee.batchId = batch.batchId
JOIN farm ON batch.farmId = farm.farmId
WHERE batch.refinementType != 'Vasket'
AND (
  farm.country = 'Rwanda'
  OR
  farm.country = 'Colombia'
);