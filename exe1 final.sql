use exercicio_licensas;

#a)
select count(idCLiente) from lcliente;
#b)
select * from llicenca where month(DtAquisicao)=08;
#c)
select * from llicenca where month(DtAquisicao)=05 and year(DtAquisicao)=2007;
#d)
select idTIPO_Empresa, DescricaoTipo, substr(DescricaoTipo,1,5) from ltipo_empresa
order by DescricaoTipo asc;
#e)
select idTIPO_Empresa, DescricaoTipo, substr(DescricaoTipo,-5) from ltipo_empresa
order by DescricaoTipo desc;
#f)
select idTIPO_Empresa, DescricaoTipo, substr(DescricaoTipo,6,5) from ltipo_empresa;
#g)
select Nome_RazaoSocial, length(Nome_RazaoSocial) from lcliente
order by Nome_RazaoSocial;
#i)
select upper(NomeSetor) as maisculo, lower(NomeSetor) as minusculo from lsetor;
#j)
select NomeSoftware, Versao from lsoftware s
join lversao v on s.idSOFTWARE = v.idSOFTWARE_FK
order by s.NomeSoftware,v.Versao;
#k)
select * from lcliente c
join ltipo_empresa t on t.idTIPO_Empresa = c.idTIPO_Empresa_FK
join lsetor s on s.idSETOR = c.idSETOR_FK
order by t.idTIPO_Empresa,s.idSETOR;
#l)
select idCLIENTE, Nome_RazaoSocial, NumLicenca, DtAquisicao, ValorAquisicao from lcliente c 
join llicenca l on c.idCLIENTE = l.idCLIENTE_FK;
#m)
select Nome_RazaoSocial, NomeSoftware from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
inner join lversao v on v.versao = l.versao_FK
inner join lsoftware s on s.idSOFTWARE = v. idSOFTWARE_FK
group by c.idCLIENTE,s.idSOFTWARE
order by c.Nome_RazaoSocial,s.NomeSoftware;
#n)
select Nome_RazaoSocial, Endereco, Cidade, UF, CEP, DescricaoTipo, NomeSetor from lcliente c
inner join ltipo_empresa t on t.idTIPO_Empresa = c.idTIPO_EMPRESA_FK
inner join lsetor s on s.idSETOR = c.idSETOR_FK
where c.UF in ('SP','RS','PR','MG');
#o)
select NomeSoftware,Versao,Nome_RazaoSocial,DescricaoTipo,NomeSetor,
NumLicenca,DtAquisicao,ValorAquisicao from lsoftware sw
inner join lversao v on sw.idSOFTWARE = v.idSOFTWARE_FK
inner join llicenca l on v.Versao = l.Versao_FK
inner join lcliente c on c.idCLIENTE = l.idCLIENTE_FK
inner join ltipo_empresa t on t.idTIPO_Empresa = c.idTIPO_Empresa_FK
inner join lsetor st on st.idSETOR = c.idSETOR_FK
order by sw.idSOFTWARE,v.Versao,l.DtAquisicao,c.idCLIENTE;
#p)
select count(NumLicenca) as licenças_vendidas from llicenca;
#q)
select sum(ValorAquisicao) as valor_total, avg(ValorAquisicao) as valor_medio,
max(ValorAquisicao) as maior_valor, min(ValorAquisicao) as menor_valor from llicenca;
#r)
select count(*) from lcliente c
inner join lsetor s on s.idSETOR = c.idSETOR_FK
where s.NomeSetor = 'Farmacêutica';
#s)
select Nome_RazaoSocial, count(NumLicenca) as quantidade_licencas from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
group by c.Nome_RazaoSocial
order by c.Nome_RazaoSocial;
#t)
select Nome_RazaoSocial, sum(ValorAquisicao) as valor_total, 
avg(ValorAquisicao) as valor_medio from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
group by c.Nome_RazaoSocial
order by c.Nome_RazaoSocial;
#u)
select NomeSetor, sum(ValorAquisicao) as valor_total from llicenca l
inner join lcliente c on c.idCLIENTE = l.idCLIENTE_FK
inner join lsetor s on s.idSETOR = c.idSETOR_FK
group by s.NomeSetor
order by s.NomeSetor;
#v)
select idTIPO_Empresa, sum(ValorAquisicao) as valor_total from llicenca l
inner join lcliente c on c.idCLIENTE = l.idCLIENTE_FK
inner join ltipo_empresa t on t.idTIPO_Empresa = c.idTIPO_Empresa_FK
group by t.idTIPO_Empresa
order by t.idTIPO_Empresa;
#w)
select Versao, sum(ValorAquisicao) as valor_total from llicenca l
inner join lversao v on v.Versao = l.Versao_FK
group by v.Versao
order by v.Versao;

select NomeSoftware, sum(ValorAquisicao) as valor_total from llicenca l
inner join lversao v on v.Versao = l.Versao_FK
inner join lsoftware s on s.idSOFTWARE = v.idSOFTWARE_FK
group by s.NomeSoftware
order by s.NomeSoftware;
#x)
select NomeSoftware, Nome_RazaoSocial, count(NumLicenca) as quantidade_licencas from lcliente c
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
inner join lversao v on v.Versao = l.Versao_FK
inner join lsoftware s on s.idSOFTWARE = v.idSOFTWARE_FK
group by c.Nome_RazaoSocial,NomeSoftware
order by c.Nome_RazaoSocial;
#y)
select Nome_RazaoSocial, count(NumLicenca) as numero_licensas from lcliente c 
inner join llicenca l on c.idCLIENTE = l.idCLIENTE_FK
group by Nome_RazaoSocial having count(NumLicenca) >10;

