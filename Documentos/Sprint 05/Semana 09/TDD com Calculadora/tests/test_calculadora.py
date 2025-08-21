import pytest
from calculadora import somar

"fazer testes com: operações básicas(adição, subtração, multiplicação e divisão), além de mais duas operações a serem desenvolvidas"

# Testes com o método de adição
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([2, 8], 10), ([0, 0], 0), ([56, 983], 1039), ([584, 2664], 3248)])
def test_numeros_validos(numeros, resultado_esperado):
    assert somar(numeros) == resultado_esperado

@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([24546746820219576, 83433259385101], 24630180079604677), 
    ([123354997656633266, 3226897160855451054], 3350252158512084320)])
def test_numeros_validos_grandes(numeros, resultado_esperado):
    assert somar(numeros) == resultado_esperado

@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([1.23, 0.8965], 2.1265), ([25.556, 980.54], 1006.096),
    ([3.7, 8.9], 12.6)])
def test_numeros_decimais(numeros, resultado_esperado):
    assert somar(numeros) == resultado_esperado

@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-478, 386], -92), ([297, -41], 256), ([-5, -3], -8), 
    ([-23, 50], 27)])
def test_numeros_negativos(numeros, resultado_esperado):
    assert somar(numeros) == resultado_esperado

@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-0.57, 9.48], 8.91), ([26.4, -96.25], -69,85), 
    ([-187.1, -26.9], -214), ([-2.03, 5.69], 3.66)])
def test_numeros_decimais_negativos(numeros, resultado_esperado):
    assert somar(numeros) == resultado_esperado

@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([58, 63, 97, 30, 42], 290), ([25, 25, 25, 25], 100), 
    ([815, 643, 14], 1472)])
def test_lista_de_numeros(numeros, resultado_esperado):
    assert somar(numeros) == resultado_esperado

@pytest.mark.parametrize("entrada_invalida", ["x", "@", False, None])
def test_tipagem_invalida(entrada_invalida):
    with pytest.raises(TypeError) as exec_info:
        somar(entrada_invalida)
    assert "Não é possível realizar uma soma com uma entrada inválida." in str(exec_info)


# Testes com o método de subtração
@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([2, 8], -6), ([0, 0], 0), ([56, 983], -927), ([584, 2664], -2080)])
def test_numeros_validos(numeros, resultado_esperado):
    assert subtrair(numeros) == resultado_esperado

@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([24546746820219576, 83433259385101], 24463313560834475), 
    ([123354997656633266, 3226897160855451054], -3103542163198817788)])
def test_numeros_validos_grandes(numeros, resultado_esperado):
    assert subtrair(numeros) == resultado_esperado

@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([1.23, 0.8965], 0.3335), ([25.556, 980.54], -954.984),
    ([3.7, 8.9], -5.2)])
def test_numeros_decimais(numeros, resultado_esperado):
    assert subtrair(numeros) == resultado_esperado

@pytest.mark.parametrize("numeros, resultado_esperado", [
    ([-478, 386], -864), ([297, -41], 338), ([-5, -3], 3), 
    ([-23, 50], 27)])
def test_numeros_negativos(numeros, resultado_esperado):
    assert subtrair(numeros) == resultado_esperado