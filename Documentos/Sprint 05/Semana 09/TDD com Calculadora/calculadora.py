class Calculadora:
    def somar(self, numero1, numero2):
        if numero1 is None or numero2 is None:
            raise ValueError("Não é possível realizar uma soma com apenas um elemento.")
        elif not isinstance(numero1, (int, float)) or not isinstance(numero2, (int, float)):
            raise ValueError("Não é possível realizar uma soma com uma entrada inválida.")
        return round(numero1 + numero2, 2)
    
    def subtrair(self, numero1, numero2):
        if numero1 is None or numero2 is None:
            raise ValueError("Não é possível realizar uma subtração com apenas um elemento.")
        elif not isinstance(numero1, (int, float)) or not isinstance(numero2, (int, float)):
            raise ValueError("Não é possível realizar uma subtração com uma entrada inválida.")
        return round(numero1 - numero2, 2)
    
    def multiplicar(self, numero1, numero2):
        if numero1 is None or numero2 is None:
            raise ValueError("Não é possível realizar uma multiplicação com apenas um elemento.")
        elif not isinstance(numero1, (int, float)) or not isinstance(numero2, (int, float)):
            raise ValueError("Não é possível realizar uma multiplicação com uma entrada inválida.")
        return round(numero1 * numero2, 2)
    
    def dividir(self, numero1, numero2):
        if numero1 is None or numero2 is None:
            raise ValueError("Não é possível realizar uma divisão com apenas um elemento.")
        elif numero2 == 0:
            raise ZeroDivisionError("Não é possível realizar uma divisão com o divisor zero.")
        elif not isinstance(numero1, (int, float)) or not isinstance(numero2, (int, float)):
            raise ValueError("Não é possível realizar uma divisão com uma entrada inválida.")
        return round(numero1 / numero2, 2)
    
    def potenciar(self, numero1, numero2):
        if numero1 is None or numero2 is None:
            raise ValueError("Não é possível realizar uma potenciação com apenas um elemento.")
        elif not isinstance(numero1, (int, float)) or not isinstance(numero2, (int, float)):
            raise ValueError("Não é possível realizar uma potenciação com uma entrada inválida.")
        return round(numero1 ** numero2, 2)

    def definir_porcentagem(self, numero1, numero2):
        if numero1 is None or numero2 is None:
            raise ValueError("Não é possível calcular a porcentagem com apenas um elemento.")
        elif numero2 == 0:
            raise ZeroDivisionError("Não é possível calcular a porcentagem com o divisor zero.")
        elif not isinstance(numero1, (int, float)) or not isinstance(numero2, (int, float)):
            raise ValueError("Não é possível realizar a porcentagem com uma entrada inválida.")
        return round((numero1 / numero2) * 100, 2)