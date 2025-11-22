module MarkovModel

import ..UtilModel

function calcular_probabilidade(matriz, lista_estados, estado_inicial, estado_final, n)
    mapa_estados = Dict()
    for (i, estado) in enumerate(lista_estados)
        mapa_estados[estado] = i
    end

    if !haskey(mapa_estados, estado_inicial)
        error("Estado inicial '$estado_inicial' não encontrado. Estados válidos: $(lista_estados)")
    end

    if !haskey(mapa_estados, estado_final)
        error("Estado final '$estado_final' não encontrado. Estados válidos: $(lista_estados)")
    end
    
    idx_inicial = mapa_estados[estado_inicial]
    idx_final = mapa_estados[estado_final]
    
    UtilModel.validar_matriz(matriz)

    matriz_n = UtilModel.calcular_matriz_n_passos(matriz, n)
    
    return matriz_n[idx_inicial, idx_final]
end

end 
