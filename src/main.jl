include("UtilModel.jl")
include("MarkovModel.jl")

using .UtilModel
using .MarkovModel

println("--- Resolvedor de Cadeias de Markov (Mercado de Ações) ---")

estados_mercado = ["Alta", "Estável", "Baixa"]

# Colunas: Alta, Estável, Baixa
matriz_mercado = [
    0.5  0.3  0.2;  # Linha "Alta"
    0.4  0.4  0.2;  # Linha "Estável"
    0.3  0.3  0.4   # Linha "Baixa"
]

try
    p1 = MarkovModel.calcular_probabilidade(matriz_mercado,estados_mercado,"Alta","Baixa",1)
    println("Probabilidade (Alta -> Baixa em 1 dia): $(round(p1*100, digits=2))%")

    p2 = MarkovModel.calcular_probabilidade(matriz_mercado,estados_mercado,"Baixa","Alta",1)
    println("Probabilidade (Baixa -> Alta em 1 dia): $(round(p2*100, digits=2))%")
    
    p3 = MarkovModel.calcular_probabilidade(matriz_mercado,estados_mercado,"Alta","Baixa",2)
    println("Probabilidade (Alta -> Baixa em 2 dias): $(round(p3*100, digits=2))%")

    p4 = MarkovModel.calcular_probabilidade(matriz_mercado,estados_mercado,"Estável","Alta",3)
    println("Probabilidade (Estável -> Alta em 3 dias): $(round(p4*100, digits=2))%")
catch e
    println("Erro durante a execução:")
    println(e)
end