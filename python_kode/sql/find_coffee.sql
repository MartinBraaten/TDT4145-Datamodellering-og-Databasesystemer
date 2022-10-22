SELECT coffee.coffeeId, coffee.name, coffee.burningGrade, coffee.date, refinery.name, coffee.price, coffee.description
FROM coffee
JOIN refinery ON coffee.refineryId = refinery.refineryId;