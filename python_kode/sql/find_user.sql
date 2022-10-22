SELECT
  user.email,
  user.name
FROM user
WHERE user.email = :email
AND user.password = :password;