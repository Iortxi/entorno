#!/usr/bin/env python3

import psutil
from termcolor import colored
from os import system

def interfaces_disponibles():
    interfaces = list(psutil.net_if_addrs().keys())

    interfaces_d = {}
    indice = 0
    for tema in interfaces:
        interfaces_d[indice] = tema
        indice += 1
    
    return interfaces_d


def recoger_input(interfaces: dict):
    # Numero de interfaces
    num_interfaces = len(interfaces)

    input_ = input(colored('[?] ', 'blue') + colored('Introduce el numero de la interfaz de red de la que quieres ver info: ', 'light_magenta'))

    while True:
        try:
            indice = int(input_)
            if indice < 0 or indice >= num_interfaces:
                raise ValueError
            break
        except ValueError:
            input_ = input('\n' + colored('[!] ', 'red') + colored('Debes introducir un numero valido: ', 'light_cyan'))

    return interfaces[indice]


def mostrar_interfaces(interfaces: dict):
    for indice in interfaces:
        print(colored(f'[{indice}]', 'light_grey') + ' ' + colored(f'{interfaces[indice]}', 'light_green') + '\n')


def separador():
    print(colored('-'*60 + '\n', 'black'))


if __name__ == '__main__':
    # Nombres de las interfaces de red disponibles
    interfaces = interfaces_disponibles()

    print()
    separador()

    # Mostrar por output las interfaces de red disponibles
    mostrar_interfaces(interfaces)

    separador()

    # Interfaz de red seleccionada
    interfaz = recoger_input(interfaces)

    # Cambio de interfaz en el fichero ~/.config/qtile/settings/widgets.py
    system(f"sed -i \"s/interface='.*'/interface='{interfaz}'/\" ~/.config/qtile/settings/widgets.py")

    print()
    separador()

    print(colored('Pulsa Win+Ctrl+r para actualizar la interfaz\n', 'yellow'))
