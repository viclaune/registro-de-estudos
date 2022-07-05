"""Hello World Multi Linguas.

Dependendo da lingua configurada no ambiente, o programa exibe a mensagem
correspondente

Como usar:

Tenha a variável LANG devidamente configurada. Ex:
    export Lang-pt_BR

Execução:
    python3 hello.py
    ou
    ./hello.py
"""
__version__ = "0.0.1"
__author__  = "Victor Laune"
__license__ = "Unlicense"

import os

if __name__ == "__main__":

    current_language = os.getenv("LANG", "en_US")[:5]
    msg = "Hello, World!"

    if current_language == "pt_BR":
        msg = "Olá, Mundo!"
    if current_language == "it_IT": 
        msg = "Ciao, Mondo!"
    if current_language == "fr_FR":
        msg = "Bonjuor, Monde!"
    
    print(msg)
