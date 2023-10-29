renda = int(input("Qual a sua renda mensal?")) 
if 0 > renda:
    print("Insira valores válidos")
aluguel_moradia = int(input("Quanto é seu aluguel?"))
if 0 > aluguel_moradia:
    print("Insira valores válidos")
alimentacao = int(input("Quanto é o seu custo de alimentação?"))
if 0 > alimentacao:
    print("Insira valores válidos")
transporte = int(input("Quanto você gasta de transporte?"))
if 0 > transporte:
    print("Insira valores válidos")
saude = int(input("Quanto gasta com sua saude?"))
if 0 > saude:
    print("Insira valores válidos")
educacao = int(input("Quanto gasta com educação?"))
if 0 > educacao:
    print("Insira valores válidos")
entretenimento = int(input("Quanto é seu entretenimento?"))
if 0 > entretenimento:
    print("Insira valores válidos")
despesas_variadas = int(input("Quanto gasta de despesas variadas?"))
if 0 > despesas_variadas:
    print("Insira valores válidos")


despesas_totais = aluguel_moradia + alimentacao + transporte + saude + educacao + entretenimento + despesas_variadas
falta = despesas_totais - renda
resto = renda - despesas_totais
if despesas_totais > renda : 
    print (f"Esta acima do orçamento e com uma renda mensal de R${renda},00 e uma despesa de R${despesas_totais},00 este mês faltou R${falta},00. Aproveite como quiser, ou guarde para investimento")

elif despesas_totais < renda or despesas_totais == renda:
    print(f"Está dentro do orçamento e com uma renda mensal de R${renda},00 e uma despesa de R${despesas_totais},00 este mês sobrou R${resto},00. Aproveite como quiser, ou guarde para investimento")

    





