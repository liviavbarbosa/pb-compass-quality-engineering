from typing import Iterable

class Calculadora:
    def somar(self, numeros):
        resultado = 0 
        if not isinstance(numeros, Iterable):
            raise ValueError("Não é possível realizar uma soma com um elemento.")
        for n in numeros:
            if not isinstance(n, (int, float)) or isinstance(n, bool) or n is None:
                raise ValueError("Não é possível realizar uma soma com uma entrada inválida.")
            resultado += n
        return round(resultado, 2)
    
    def subtrair(self, numeros):
        if not isinstance(numeros, Iterable):
            raise ValueError("Não é possível realizar uma subtração com um elemento.")
        resultado = numeros[0]
        if not isinstance(resultado, (int, float)) or isinstance(resultado, bool) or resultado is None:
            raise ValueError("Não é possível realizar uma subtração com uma entrada inválida.")
        for n in numeros[1:]:
            if not isinstance(n, (int, float)) or isinstance(n, bool) or n is None:
                raise ValueError("Não é possível realizar uma subtração com uma entrada inválida.")
            resultado -= n
        return round(resultado, 2)
    
    def multiplicar(self, numeros):
        if not isinstance(numeros, Iterable):
            raise ValueError("Não é possível realizar uma multiplicação com um elemento.")
        resultado = numeros[0]
        if not isinstance(resultado, (int, float)) or isinstance(resultado, bool) or resultado is None:
            raise ValueError("Não é possível realizar uma multiplicação com uma entrada inválida.")
        for n in numeros[1:]:
            if not isinstance(n, (int, float)) or isinstance(n, bool) or n is None:
                raise ValueError("Não é possível realizar uma multiplicação com uma entrada inválida.")
            resultado *= n
        return round(resultado, 2)
    
    def dividir(self, numeros):
        if not isinstance(numeros, Iterable):
            raise ValueError("Não é possível realizar uma divisão com um elemento.")
        resultado = numeros[0]
        if not isinstance(resultado, (int, float)) or isinstance(resultado, bool) or resultado is None:
            raise ValueError("Não é possível realizar uma divisão com uma entrada inválida.")
        for n in numeros[1:]:
            if not isinstance(n, (int, float)) or isinstance(n, bool) or n is None:
                raise ValueError("Não é possível realizar uma divisão com uma entrada inválida.")
            elif n == 0:
                raise ZeroDivisionError("Não é possível realizar uma divisão com o divisor zero.")
            resultado /= n
        return round(resultado, 2)
    
    def potenciar(self, numeros):
        if not isinstance(numeros, Iterable):
            raise ValueError("Não é possível realizar uma potenciação com um elemento.")
        resultado = numeros[0]
        if not isinstance(resultado, (int, float)) or isinstance(resultado, bool) or resultado is None:
            raise ValueError("Não é possível realizar uma potenciação com uma entrada inválida.")
        for n in numeros[1:]:
            if not isinstance(n, (int, float)) or isinstance(n, bool) or n is None:
                raise ValueError("Não é possível realizar uma potenciação com uma entrada inválida.")
            resultado **= n
        return round(resultado, 2)

    def definir_porcentagem(self, numeros):
        if not isinstance(numeros, Iterable):
            raise ValueError("Não é possível calcular a porcentagem com um elemento.")
        resultado = numeros[0]
        if not isinstance(resultado, (int, float)) or isinstance(resultado, bool) or resultado is None:
            raise ValueError("Não é possível realizar a porcentagem com uma entrada inválida.")
        for n in numeros[1:]:
            if not isinstance(n, (int, float)) or isinstance(n, bool) or n is None:
                raise ValueError("Não é possível realizar a porcentagem com uma entrada inválida.")
            elif n == 0:
                raise ZeroDivisionError("Não é possível calcular a porcentagem com o divisor zero.")
            resultado = (resultado / n) * 100
        return round(resultado, 2)