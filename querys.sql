-- Select para saber onde o Cliente Fulano Silva alugou e devolveu o carro
select
    c.modelo as carro_modelo,
    c.cor as carro_cor,
    l.locacao_data as data_locacao,
    l.devolucao_data as data_devolucao,
    loc_filial.nome as locacao_filial,
    dev_filial.nome as devolucao_filial
from locadora l
join carro c on l.carro_id = c.id
join cliente cli on l.cliente_id = cli.id
join filial loc_filial on l.locacao_filial_id = loc_filial.id
join filial dev_filial on l.devolucao_filial_id = dev_filial.id
where cli.nome = 'Fulano Silva';

-- Select para descobrir quanto quilometros o cliente Ciclano pecorreu com o veiculo 
select 
    cl.nome AS nome_cliente,
    sum(l.quilometragem_chegada - l.quilometragem_saida) as quilometros_rodados
from locadora l
inner join cliente cl on l.cliente_id = cl.id
where cl.nome = 'Ciclano Pereira'
group by cl.nome;

-- Select para o tempo que Fulano ficou com o veiculo 
select 
    cl.nome as nome_cliente,
    l.locacao_data as data_locacao,
    l.devolucao_data as data_devolucao,
    age(l.devolucao_data, l.locacao_data) as tempo_locacao
from locadora l
inner join cliente cl on l.cliente_id = cl.id
where cl.nome = 'Fulano Silva';
