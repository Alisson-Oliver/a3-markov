module UtilModel

using LinearAlgebra

function validar_matriz(matriz)
    for (i, linha) in enumerate(eachrow(matriz))
        if sum(linha) != 1
            error("Erro: A linha $i ($linha) não soma 1.0 (soma = $(sum(linha))).")
        end
    end
    return true
end

function calcular_matriz_n_passos(matriz, n)
    if n < 1
        error("O número de passos 'n' deve ser 1 ou maior.")
    end
    return matriz^n
end

end

