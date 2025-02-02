#!/usr/bin/env python3

from termcolor import colored
from os import system
from subprocess import run, PIPE
from sys import exit
from signal import SIGINT, signal


def interfaces_disponibles():
    interfaces_c = run("ifconfig | grep flags= | awk '{print $1}' | tr -d ':' | xargs", shell=True, stdout=PIPE, stderr=PIPE)
    interfaces = interfaces_c.stdout.decode('utf-8').split()

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
    print(colored('-'*75 + '\n', 'black'))


def ctrl_c(sig, frame):
    print()
    exit(1)

signal(SIGINT, ctrl_c)


if __name__ == '__main__':
    # Nombre de las interfaces de red disponibles
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
