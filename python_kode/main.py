import os
from tabulate import tabulate
from datetime import datetime
from db.dbutils import init_db, execute_sqlfile
from sqlite3 import connect, Connection, IntegrityError


def clear():
    os.system('cls' if os.name == 'nt' else 'clear')


connection = connect('KaffeDB.sqlite3')


# Brukerhistorie 1
def create_user(connection: Connection, user):
    execute_sqlfile(connection, 'create_user.sql', user)
    connection.commit()


# Brukerhistorie 1
def login(connection: Connection, email: str, password: str):
    result = execute_sqlfile(connection, 'find_user.sql', {
                             'email': email, 'password': password})
    return result.fetchall()


# Brukerhistorie 1
def getcoffee(connection: Connection):
    result = execute_sqlfile(connection, 'find_coffee.sql')
    return result.fetchall()


# Brukerhistorie 1
def create_tasting(connection: Connection, tasting):
    execute_sqlfile(connection, 'create_tasting.sql', tasting)
    connection.commit()


# Brukerhistorie 2
def get_leaderboard(connection: Connection):
    result = execute_sqlfile(connection, 'toplist.sql')
    return result.fetchall()


# Brukerhistorie 3
def get_topcoffee(connection: Connection):
    result = execute_sqlfile(connection, 'coffee_pr_price.sql')
    return result.fetchall()


# Brukerhistorie 4
def search_description(connection: Connection, word: str):
    result = execute_sqlfile(connection, 'find_by_word.sql', {'word': word})
    return result.fetchall()


# Brukerhistorie 5
def find_unwashed(connection: Connection):
    result = execute_sqlfile(connection, 'unwashed.sql')
    return result.fetchall()


def prettyprint(result, headers):
    return print('\n\n' + tabulate(result, headers) + '\n\n')


def loginuser():
    print('Vennligst logg inn')
    email = input('Epost: ')
    password = input('Passord: ')
    user = login(connection, email, password)
    return user


def newuser():
    print('Opprett bruker')
    user = {
        'email': input('Epost: '),
        'password': input('Passord: '),
        'name': input('Navn: ')
    }
    try:
        create_user(connection, user)
    except IntegrityError:
        clear()
        print('Det finnes allerede en bruker med denne epost adressen\n')
        return None
    return login(connection, user['email'], user['password'])


def getuser():
    while True:
        print('Velg et alternativ:\n\
    1.\tLogg inn\n\
    2.\tOpprett bruker\n')

        try:
            option = int(input())

            if option == 1:
                clear()
                user = loginuser()
                while(len(user) == 0):
                    clear()
                    print('Feil epost eller passord. Vennligst prøv igjen.\n')
                    user = loginuser()
                break

            elif option == 2:
                clear()
                user = newuser()
                while not user:
                    user = newuser()
                break

            else:
                clear()
                print('Det er ikke et gyldig alternativ\n')
        except ValueError:
            clear()
            print('Det er ikke et gyldig alternativ\n')

    return user


def whattodo(email: str):
    while True:
        print('Hva vil du gjøre?\n')
        print('Velg et alternativ:\n\
    1\tRegistrer kaffesmaking\n\
    2\tSe de største kaffedrikkerne i år\n\
    3\tSe de beste kaffene\n\
    4\tSøk i beskrivelse\n\
    5\tFinn uvasket kaffe fra Colombia eller Rwanda\
    ')
        try:
            option = int(input())

            if option == 1:
                tasting = {"email": email}
                clear()
                coffees = getcoffee(connection)
                prettyprint(
                    coffees,
                    ['Nr', 'Navn', 'Brenningsgrad', 'Brenningsdato',
                     'Brenneri', 'Pris', 'Beskrivelse'])
                coffeeIdx = int(input('Hvilken kaffe har du smakt? (Nr): '))
                while coffeeIdx > len(coffees) or coffeeIdx < 0:
                    print('Fant ikke den kaffen. Prøv igjen')
                    coffeeIdx = int(
                        input('Hvilken kaffe har du smakt? (Nr): '))
                tasting["coffeeId"] = coffees[coffeeIdx - 1][0]

                points = int(
                    input('Hvor mange poeng vil du gi kaffen? (0-10): '))
                while points > 10 or points < 0:
                    print('Det er ikke en gyldig poengsum. Prøv igjen')
                    points = int(
                        input('Hvor mange poeng vil du gi kaffen? (0-10): '))

                tasting["points"] = points
                tasting["notes"] = input('Skriv et notat: ')
                tasting["date"] = datetime.today().strftime('%Y-%m-%d')

                create_tasting(connection, tasting)
                print('Smakingen ble opprettet')
                input('Trykk en tast for å gå videre')
                clear()

            elif option == 2:
                clear()
                topdrinkers = get_leaderboard(connection)
                prettyprint(topdrinkers, ['Navn', 'Antall ulike kaffer'])
            elif option == 3:
                clear()
                topcoffee = get_topcoffee(connection)
                headers = ['Brenneri', 'Kaffenavn',
                           'Pris', 'Gjennomsnitts score']
                prettyprint(topcoffee, headers)
            elif option == 4:
                clear()
                word = input("Hva vil du søke etter?: ")
                results = search_description(connection, word)
                prettyprint(results, ['Brenneri', 'Kaffenavn'])
            elif option == 5:
                clear()
                results = find_unwashed(connection)
                prettyprint(results, ['Brenneri', 'Kaffenavn'])
            else:
                clear()
                print('Det er ikke et gyldig alternativ\n')
        except ValueError:
            clear()
            print('Det er ikke et gyldig alternativ\n')


def main():
    print('Velkommen til KaffeDB!\n')

    while True:
        user = getuser()[0]
        clear()
        print(f'Du har logget inn som {user[1]} \n')

        whattodo(user[0])


if __name__ == "__main__":
    init_db(connection)
    clear()
    main()
