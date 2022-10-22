INSERT INTO user (email, password, name)
VALUES
  ("olanor@example.com", "abc", "Ola Normann"),
  ("karinor@example.com", "abc", "Kari Normann"),
  ("pergynt@example.com", "abc", "Peer Gynt"),
  ("harryp@example.com", "abc", "Harry Potter"),
  ("captn@sabeltann.com", "abc", "Kaptein Sabeltann"),
  ("dtrump@example.com", "abc", "Donald Trump"),
  ("dduck@example.com", "abc", "Donald Duck"),
  ("abc", "abc", "tester");

INSERT INTO bean (species, name)
VALUES
  ("Coffea arabica", "Bourbon"),
  ("Coffea arabica", "Typica"),
  ("Coffea arabica", "Caturra"),
  ("Coffea arabica", "Blue Monutain"),
  ("Coffea caniphora", "Robusta"),
  ("Coffea caniphora", "Nganda"),
  ("Coffea excelsa", "Excelsa"),
  ("Coffea liberica", "Liberica");

INSERT INTO refinery (name)
VALUES
  ("Jacobsen & Svart"),
  ("Kieldsberg"),
  ("Fuglen Coffee Roasters"),
  ("Kafeteros"),
  ("Norð Brenneri"),
  ("Lille Oslo Kaffebrenneri");

INSERT INTO refinementMethod (refinementType, description)
VALUES
  ("Bærtørket", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, nobis!"),
  ("Fordøyd", "Et kattelignende dyr, spiser modne kaffebær (røde), for så å la kaffebærene gå gjennom fordøyelsessystemet."),
  ("Vasket", "Den våte metode går ut på å skille fruktkjøttet fra bønnen i en maskinell vaskeprosess umiddelbart etter innhøsting. Kaffen omtales gjerne som vasket eller våtforedlet."),
  ("Ubehandlet", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, nobis!"),
  ("Røkt", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, nobis!"),
  ("Kokt", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, nobis!"),
  ("Soltørket", "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, nobis!");

INSERT INTO farm (name, country, region, masl)
VALUES
  ("Nombre de Dios", "El Salvador", "Santa Ana", 1500),
  ("Casa di Mama", "Mexico", "Chihuahua", 500),
  ("Santa Maria", "Spania", "Anda Lusia", 1500),
  ("Asprotimania", "Rwanda", "Kiagali", 69),
  ("Kamajumba", "Rwanda", "Kiagali", 7400),
  ("Sake Farm", "Rwanda", "Kiagali", 1),
  ("Pablo Guereros", "Colombia", "Santander", 739),
  ("Coco Loco", "Colombia", "Norte de Santander", 420),
  ("El Obraje", "Colombia", "Meta", 132),
  ("La Esperansa", "Colombia", "Bolivar", 777);

INSERT INTO bean_farm (beanId, farmId)
VALUES
  (1, 1),(4, 1),(8, 1),(5, 2),(6, 2),(2, 2),
  (1, 3),(2, 3),(7, 3),(1, 4),(2, 4),(3, 4),
  (1, 5),(8, 5),(7, 5),(6, 6),(5, 6),(4, 6),
  (2, 7),(3, 7),(4, 7),(5, 8),(6, 8),(7, 8),
  (5, 9),(4, 9),(3, 9),(2, 10),(1, 10),(8, 10);

INSERT INTO batch (year, price, farmId, refinementType)
VALUES
  (2021, 8, 1, "Bærtørket"),
  (1970, 100, 1, "Kokt"),
  (1984, 81, 3, "Fordøyd"),
  (1666, 89, 6, "Vasket"),
  (2000, 1, 8, "Kokt"),
  (2010, 67, 10, "Røkt"),
  (1337, 9001, 2, "Soltørket"),
  (1911, 14, 5, "Bærtørket");

INSERT INTO bean_batch (beanId, batchId)
VALUES
  (1,1),(4,2),(8,2),(1,3),
  (2,3),(7,3),(6,4),(6,5),
  (7,5),(2,6),(2,7),(5,7),
  (8,8),(7,8);

INSERT INTO coffee (refineryId, burningGrade, date, name, description, price, batchId)
VALUES
  (1, "lys", "2022-01-20", "Vinterkaffe 2022", "En velsmakende og kompleks kaffe for mørketiden",  600, 1),
  (5, "middels", "1970-02-14", "Kjærlighetskaffe", "Smaker som kjerlighet på pinne",  69, 3),
  (3, "mørk", "2020-06-06", "Sommerkaffe 2020", "Sol kompis", 450, 5),
  (4, "middels", "2020-06-06", "Blomsterkaffe", "Veldig floral", 202, 2),
  (6, "lys", "1997-12-01", "Adventskaffe", "Julen den er her",  25, 7);

INSERT INTO tasting (email, coffeeId, date, notes, points)
VALUES
  ("captn@sabeltann.com", 3, "2021-01-04", "Da jeg reiste fra Karibien og ankret opp i natt. Hørte jeg et rykte om en kaffe med en helt fantastisk smak.", 10),
  ("olanor@example.com", 2, "2022-03-04", "En svært god kaffe med en mild, floral ettersmak.", 7),
  ("olanor@example.com", 2, "2022-03-05", "En svært god kaffe med en mild, floral ettersmak.", 5),
  ("dtrump@example.com", 5, "2021-01-04", "Fake news.", 1),
  ("dduck@example.com", 3, "2021-01-04", "Quack", 6);
