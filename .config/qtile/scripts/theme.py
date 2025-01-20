#!/usr/bin/env python3

from glob import glob
from os import path, system
from termcolor import colored


def temas_disponibles():
    ficheros = glob.glob(path.expanduser("~/.config/qtile/themes/*.json"))

    temas = [path.basename(file)[:-5] for file in ficheros]

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
    # Nombres de los temas disponibles
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
