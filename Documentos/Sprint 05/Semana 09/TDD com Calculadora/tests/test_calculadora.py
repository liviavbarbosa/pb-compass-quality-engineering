import pytest
from calculadora import Calculadora

calc = Calculadora()

@pytest.mark.soma
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([2, 8], 10), ([0, 0], 0), ([56, 983], 1039), ([584, 2664], 3248)])
def test_soma_com_numero_valido(numeros, resultado_esperado):
    """
    Testa se a função somar realiza os cálculos corretamente em um cenário com números inteiros positivos.
    """
    assert calc.somar(numeros) == resultado_esperado

@pytest.mark.soma
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([24546746820219576, 83433259385101], 24630180079604677), 
    ([123354997656633266, 3226897160855451054], 3350252158512084320)])
def test_soma_com_numero_valido_grande(numeros, resultado_esperado):
    """
    Testa se a função somar realiza os cálculos corretamente em um cenário com números inteiros positivos e grandes.
    """
    assert calc.somar(numeros) == resultado_esperado

@pytest.mark.soma
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([1.23, 0.8965], 2.13), ([25.556, 980.54], 1006.1),
    ([3.7, 8.9], 12.60)])
def test_soma_com_numero_decimal(numeros, resultado_esperado):
    """
    Testa se a função somar realiza os cálculos corretamente em um cenário com números decimais positivos.
    """
    assert calc.somar(numeros) == resultado_esperado

@pytest.mark.soma
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-478, 386], -92), ([297, -41], 256), ([-5, -3], -8), 
    ([-23, 50], 27)])
def test_soma_com_numero_negativo(numeros, resultado_esperado):
    """
    Testa se a função somar realiza os cálculos corretamente em um cenário com números inteiros negativos.
    """
    assert calc.somar(numeros) == resultado_esperado

@pytest.mark.soma
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-0.57, 9.48], 8.91), ([26.4, -96.25], -69.85), 
    ([-187.1, -26.9], -214), ([-2.03, 5.69], 3.66)])
def test_soma_com_numero_decimal_negativo(numeros, resultado_esperado):
    """
    Testa se a função somar realiza os cálculos corretamente em um cenário com números decimais negativos.
    """
    assert calc.somar(numeros) == resultado_esperado

@pytest.mark.soma
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([58, 63, 97, 30, 42], 290), ([25, 25, 25, 25], 100), 
    ([815, 643, 14], 1472)])
def test_soma_com_lista_de_numeros(numeros, resultado_esperado):
    """
    Testa se a função somar realiza os cálculos corretamente em um cenário com uma lista contendo mais de 2 números.
    """
    assert calc.somar(numeros) == resultado_esperado

@pytest.mark.soma
@pytest.mark.parametrize("entrada_invalida", ["x", "@", [False, True], [None, None]])
def test_soma_com_tipagem_invalida(entrada_invalida):
    """
    Testa se a função somar lança uma exceção adequada em um cenário com entradas de tipagem incompatível.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.somar(entrada_invalida)
    assert "Não é possível realizar uma soma com uma entrada inválida." in str(exec_info)

@pytest.mark.soma
@pytest.mark.parametrize("entrada_invalida", [False, True, None])
def test_soma_com_um_elemento(entrada_invalida):
    """
    Testa se a função somar lança uma exceção adequada em um cenário com apenas um dado de entrada.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.somar(entrada_invalida)
    assert "Não é possível realizar uma soma com um elemento." in str(exec_info)

@pytest.mark.subtracao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([2, 8], -6), ([0, 0], 0), ([56, 983], -927), ([584, 2664], -2080)])
def test_subtracao_com_numero_valido(numeros, resultado_esperado):
    """
    Testa se a função subtrair realiza os cálculos corretamente em um cenário com números inteiros positivos.
    """
    assert calc.subtrair(numeros) == resultado_esperado

@pytest.mark.subtracao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([24546746820219576, 83433259385101], 24463313560834475), 
    ([123354997656633266, 3226897160855451054], -3103542163198817788)])
def test_subtracao_com_numero_valido_grande(numeros, resultado_esperado):
    """
    Testa se a função subtrair realiza os cálculos corretamente em um cenário com números inteiros positivos e grandes.
    """
    assert calc.subtrair(numeros) == resultado_esperado

@pytest.mark.subtracao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([1.23, 0.8965], 0.33), ([25.556, 980.54], -954.98),
    ([3.7, 8.9], -5.2)])
def test_subtracao_com_numero_decimal(numeros, resultado_esperado):
    """
    Testa se a função subtrair realiza os cálculos corretamente em um cenário com números decimais positivos.
    """
    assert calc.subtrair(numeros) == resultado_esperado

@pytest.mark.subtracao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-478, 386], -864), ([297, -41], 338), ([-5, -3], -2), 
    ([-23, 50], -73)])
def test_subtracao_com_numero_negativo(numeros, resultado_esperado):
    """
    Testa se a função subtrair realiza os cálculos corretamente em um cenário com números inteiros negativos.
    """
    assert calc.subtrair(numeros) == resultado_esperado

@pytest.mark.subtracao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-0.57, 9.48], -10.05), ([26.4, -96.25], 122.65),
    ([-187.1, -26.9], -160.2), ([-2.03, 5.69], -7.72)])
def test_subtracao_com_numero_decimal_negativo(numeros, resultado_esperado):
    """
    Testa se a função subtrair realiza os cálculos corretamente em um cenário com números decimais negativos.
    """
    assert calc.subtrair(numeros) == resultado_esperado

@pytest.mark.subtracao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([58, 63, 97, 30, 42], -174), ([25, 25, 25, 25], -50),
    ([815, 643, 14], 158)])
def test_subtracao_com_lista_de_numeros(numeros, resultado_esperado):
    """
    Testa se a função subtrair realiza os cálculos corretamente em um cenário com uma lista contendo mais de 2 números.
    """
    assert calc.subtrair(numeros) == resultado_esperado

@pytest.mark.subtracao
@pytest.mark.parametrize("entrada_invalida", ["x", "@", [False, True], [None, None]])
def test_subtracao_com_tipagem_invalida(entrada_invalida):
    """
    Testa se a função subtrair lança uma exceção adequada em um cenário com entradas de tipagem incompatível.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.subtrair(entrada_invalida)
    assert "Não é possível realizar uma subtração com uma entrada inválida." in str(exec_info)

@pytest.mark.subtracao
@pytest.mark.parametrize("entrada_invalida", [False, True, None])
def test_subtracao_com_um_elemento(entrada_invalida):
    """
    Testa se a função somar lança uma exceção adequada em um cenário com apenas um dado de entrada.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.subtrair(entrada_invalida)
    assert "Não é possível realizar uma subtração com um elemento." in str(exec_info)

@pytest.mark.multiplicacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([2, 8], 16), ([0, 0], 0), ([56, 983], 55048), ([584, 2664], 1555776)])
def test_multiplicacao_com_numero_valido(numeros, resultado_esperado):
    """
    Testa se a função multiplicar realiza os cálculos corretamente em um cenário com números inteiros positivos.
    """
    assert calc.multiplicar(numeros) == resultado_esperado

@pytest.mark.multiplicacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([24546746820219576, 83433259385101], 2048015094511783068491562937176), 
    ([123354997656633266, 3226897160855451054], 398053891715520703978459017491162364)])
def test_multiplicacao_com_numero_valido_grande(numeros, resultado_esperado):
    """
    Testa se a função multiplicar realiza os cálculos corretamente em um cenário com números inteiros positivos e grandes.
    """
    assert calc.multiplicar(numeros) == resultado_esperado

@pytest.mark.multiplicacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([1.23, 0.8965], 1.1), ([25.556, 980.54], 25058.68),
    ([3.7, 8.9], 32.93)])
def test_multiplicacao_com_numero_decimal(numeros, resultado_esperado):
    """
    Testa se a função multiplicar realiza os cálculos corretamente em um cenário com números decimais positivos.
    """
    assert calc.multiplicar(numeros) == resultado_esperado

@pytest.mark.multiplicacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-478, 386], -184508), ([297, -41], -12177), ([-5, -3], 15), 
    ([-23, 50], -1150)])
def test_multiplicacao_com_numero_negativo(numeros, resultado_esperado):
    """
    Testa se a função multiplicar realiza os cálculos corretamente em um cenário com números inteiros negativos.
    """
    assert calc.multiplicar(numeros) == resultado_esperado

@pytest.mark.multiplicacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-0.57, 9.48], -5.4), ([26.4, -96.25], -2541.0), 
    ([-187.1, -26.9], 5032.99), ([-2.03, 5.69], -11.55)])
def test_multiplicacao_com_numero_decimal_negativo(numeros, resultado_esperado):
    """
    Testa se a função multiplicar realiza os cálculos corretamente em um cenário com números decimais negativos.
    """
    assert calc.multiplicar(numeros) == resultado_esperado

@pytest.mark.multiplicacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([58, 63, 97, 30, 42], 446591880), ([25, 25, 25, 25], 390625), 
    ([815, 643, 14], 7336630)])
def test_multiplicacao_com_lista_de_numeros(numeros, resultado_esperado):
    """
    Testa se a função multiplicar realiza os cálculos corretamente em um cenário com uma lista contendo mais de 2 números.
    """
    assert calc.multiplicar(numeros) == resultado_esperado

@pytest.mark.multiplicacao
@pytest.mark.parametrize("entrada_invalida", ["x", "@", [False, True], [None, None]])
def test_multiplicacao_com_tipagem_invalida(entrada_invalida):
    """
    Testa se a função multiplicar lança uma exceção adequada em um cenário com entradas de tipagem incompatível.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.multiplicar(entrada_invalida)
    assert "Não é possível realizar uma multiplicação com uma entrada inválida." in str(exec_info)

@pytest.mark.multiplicacao
@pytest.mark.parametrize("entrada_invalida", [False, True, None])
def test_multiplicacao_com_um_elemento(entrada_invalida):
    """
    Testa se a função multiplicar lança uma exceção adequada em um cenário com apenas um dado de entrada.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.multiplicar(entrada_invalida)
    assert "Não é possível realizar uma multiplicação com um elemento." in str(exec_info)

@pytest.mark.divisao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([2, 8], 0.25), ([56, 983], 0.06), ([584, 2664], 0.22)])
def test_divisao_com_numero_valido(numeros, resultado_esperado):
    """
    Testa se a função dividir realiza os cálculos corretamente em um cenário com números inteiros positivos.
    """
    assert calc.dividir(numeros) == resultado_esperado

@pytest.mark.divisao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([24546746820219576, 83433259385101], 294.21), 
    ([123354997656633266, 3226897160855451054], 0.04)])
def test_divisao_com_numero_valido_grande(numeros, resultado_esperado):
    """
    Testa se a função dividir realiza os cálculos corretamente em um cenário com números inteiros positivos e grandes.
    """
    assert calc.dividir(numeros) == resultado_esperado

@pytest.mark.divisao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([1.23, 0.8965], 1.37), ([25.556, 980.54], 0.03), 
    ([3.7, 8.9], 0.42)])
def test_divisao_com_numero_decimal(numeros, resultado_esperado):
    """
    Testa se a função dividir realiza os cálculos corretamente em um cenário com números decimais positivos.
    """
    assert calc.dividir(numeros) == resultado_esperado

@pytest.mark.divisao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-478, 386], -1.24), ([297, -41], -7.24), 
    ([-5, -3], 1.67), ([-23, 50], -0.46)])
def test_divisao_com_numero_negativo(numeros, resultado_esperado):
    """
    Testa se a função dividir realiza os cálculos corretamente em um cenário com números inteiros negativos.
    """
    assert calc.dividir(numeros) == resultado_esperado

@pytest.mark.divisao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-0.57, 9.48], -0.06), ([26.4, -96.25], -0.27), 
    ([-187.1, -26.9], 6.96), ([-2.03, 5.69], -0.36)])
def test_divisao_com_numero_decimal_negativo(numeros, resultado_esperado):
    """
    Testa se a função dividir realiza os cálculos corretamente em um cenário com números decimais negativos.
    """
    assert calc.dividir(numeros) == resultado_esperado

@pytest.mark.divisao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([58, 63, 97, 30, 42], 0.00), ([25, 25, 25, 25], 0.00), 
    ([815, 643, 14], 0.09)])
def test_divisao_com_lista_de_numeros(numeros, resultado_esperado):
    """
    Testa se a função dividir realiza os cálculos corretamente em um cenário com uma lista contendo mais de 2 números.
    """
    assert calc.dividir(numeros) == resultado_esperado

@pytest.mark.divisao
@pytest.mark.parametrize("entrada_invalida", ["x", "@", [False, True], [None, None]])
def test_divisao_com_tipagem_invalida(entrada_invalida):
    """
    Testa se a função dividir lança uma exceção adequada em um cenário com entradas de tipagem incompatível.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.dividir(entrada_invalida)
    assert "Não é possível realizar uma divisão com uma entrada inválida." in str(exec_info)

@pytest.mark.divisao
@pytest.mark.parametrize("entrada_invalida", [False, True, None])
def test_divisao_com_um_elemento(entrada_invalida):
    """
    Testa se a função dividir lança uma exceção adequada em um cenário com apenas um dado de entrada.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.dividir(entrada_invalida)
    assert "Não é possível realizar uma divisão com um elemento." in str(exec_info)

@pytest.mark.divisao
@pytest.mark.parametrize("entrada_invalida", [([-0.57, 0]), ([26.4, 0])])
def test_divisao_por_zero(entrada_invalida):
    """
    Testa se a função dividir lança uma exceção adequada em um cenário em que o divisor é zero.
    """
    with pytest.raises(ZeroDivisionError) as exec_info:
        calc.dividir(entrada_invalida)   
    assert "Não é possível realizar uma divisão com o divisor zero." in str(exec_info)

@pytest.mark.potenciacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([2, 8], 256), ([0, 0], 1), ([56, 9], 5416169448144896), ([5, 26], 1490116119384765625)])
def test_potenciacao_com_numero_valido(numeros, resultado_esperado):
    """
    Testa se a função potenciar realiza os cálculos corretamente em um cenário com números inteiros positivos.
    """
    assert calc.potenciar(numeros) == resultado_esperado

@pytest.mark.potenciacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([1.23, 0.8965], 1.20), ([25.556, 0.54], 5.76),
    ([3.7, 8.9], 114023.76)])
def test_potenciacao_com_numero_decimal(numeros, resultado_esperado):
    """
    Testa se a função potenciar realiza os cálculos corretamente em um cenário com números decimais positivos.
    """
    assert calc.potenciar(numeros) == resultado_esperado

@pytest.mark.potenciacao
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-4, 3], -64), ([29, -4], 0.00), ([-5, -3], -0.01), 
    ([-23, 1], -23)])
def test_potenciacao_com_numero_negativo(numeros, resultado_esperado):
    """
    Testa se a função potenciar realiza os cálculos corretamente em um cenário com números inteiros negativos.
    """
    assert calc.potenciar(numeros) == resultado_esperado

@pytest.mark.potenciacao
@pytest.mark.parametrize("entrada_invalida", ["x", "@", [False, True], [None, None]])
def test_potenciacao_com_tipagem_invalida(entrada_invalida):
    """
    Testa se a função potenciar lança uma exceção adequada em um cenário com entradas de tipagem incompatível.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.potenciar(entrada_invalida)
    assert "Não é possível realizar uma potenciação com uma entrada inválida." in str(exec_info)

@pytest.mark.potenciacao
@pytest.mark.parametrize("entrada_invalida", [False, True, None])
def test_potenciacao_com_um_elemento(entrada_invalida):
    """
    Testa se a função potenciar lança uma exceção adequada em um cenário com apenas um dado de entrada.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.potenciar(entrada_invalida)
    assert "Não é possível realizar uma potenciação com um elemento." in str(exec_info)

@pytest.mark.porcentagem
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([2, 8], 25.00), ([56, 9], 622.22), ([5, 26], 19.23)])
def test_porcentagem_com_numero_valido(numeros, resultado_esperado):
    """
    Testa se a função definir_porcentagem realiza os cálculos corretamente em um cenário com números inteiros positivos.
    """
    assert calc.definir_porcentagem(numeros) == resultado_esperado

@pytest.mark.porcentagem
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([1.23, 4.8965], 25.12), ([25.556, 7.54], 338.94),
    ([3.7, 8.9], 41.57)])
def test_porcentagem_com_numero_decimal(numeros, resultado_esperado):
    """
    Testa se a função definir_porcentagem realiza os cálculos corretamente em um cenário com números decimais positivos.
    """
    assert calc.definir_porcentagem(numeros) == resultado_esperado

@pytest.mark.porcentagem
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-4, 3], -133.33), ([29, -4], -725.00), ([-5, -3], 166.67),
    ([-23, 1], -2300.00)])
def test_porcentagem_com_numero_negativo(numeros, resultado_esperado):
    """
    Testa se a função definir_porcentagem realiza os cálculos corretamente em um cenário com números inteiros negativos.
    """
    assert calc.definir_porcentagem(numeros) == resultado_esperado

@pytest.mark.porcentagem
@pytest.mark.parametrize("entrada_invalida", ["x", "@", [False, True], [None, None]])
def test_porcentagem_com_tipagem_invalida(entrada_invalida):
    """
    Testa se a função definir_porcentagem lança uma exceção adequada em um cenário com entradas de tipagem incompatível.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.definir_porcentagem(entrada_invalida)
    assert "Não é possível realizar a porcentagem com uma entrada inválida." in str(exec_info)

@pytest.mark.porcentagem
@pytest.mark.parametrize("entrada_invalida", [False, True, None])
def test_porcentagem_com_um_elemento(entrada_invalida):
    """
    Testa se a função definir_porcentagem lança uma exceção adequada em um cenário com apenas um dado de entrada.
    """
    with pytest.raises(ValueError) as exec_info:
        calc.definir_porcentagem(entrada_invalida)
    assert "Não é possível calcular a porcentagem com um elemento." in str(exec_info)

@pytest.mark.pocentagem
@pytest.mark.parametrize("entrada_invalida", [([-0.57, 0]), ([26.4, 0])])
def test_porcentagem_com_todo_zero(entrada_invalida):
    """
    Testa se a função definir_porcentagem lança uma exceção adequada em um cenário em que o todo (100%) é zero.
    """
    with pytest.raises(ZeroDivisionError) as exec_info:
        calc.definir_porcentagem(entrada_invalida)   
    assert "Não é possível calcular a porcentagem com o divisor zero." in str(exec_info)