#!/usr/bin/env python3

from os import system
from termcolor import colored
from subprocess import run, PIPE


def temas_disponibles():
    temas_c = run("/bin/ls ~/.config/qtile/themes/*.json | awk -F '/' '{print $NF}' | xargs", shell=True, stdout=PIPE, stderr=PIPE)
    temas = temas_c.stdout.decode('utf-8').split()

    temas_d = {}
    indice = 0
    for tema in temas:
        temas_d[indice] = tema
        indice += 1

    return temas_d


def recoger_input(temas: dict):
    # Numero de temas
    num_temas = len(temas)

    input_ = input(colored('[?] ', 'blue') + colored('Introduce el numero del tema que quieres utilizar: ', 'light_magenta'))

    while True:
        try:
            indice = int(input_)
            if indice < 0 or indice >= num_temas:
                raise ValueError
            break
        except ValueError:
            input_ = input('\n' + colored('[!] ', 'red') + colored('Debes introducir un numero valido: ', 'light_cyan'))

    return temas[indice]


def mostrar_temas(temas: dict):
    for indice in temas:
        print(colored(f'[{indice}]', 'light_grey') + ' ' + colored(f'{temas[indice]}', 'light_green') + '\n')


def separador():
    print(colored('-'*60 + '\n', 'black'))


if __name__ == '__main__':
    # Nombre de los temas disponibles
    temas = temas_disponibles()

    print()
    separador()

    # Mostrar por output los temas disponibles
    mostrar_temas(temas)

    separador()

    # Tema seleccionado para cambiar
    tema = recoger_input(temas)

    # Cambio del tema en el fichero de configuracion JSON
    system(f"echo '{{\"theme\": \"{tema}\"'}} > ~/.config/qtile/config.json")

    print()
    separador()

    print(colored('Pulsa Win+Ctrl+r para actualizar el tema\n', 'yellow'))
